/** Drop this file in ~/.sbt/0.13/plugins/Prompt.scala for a prompt of the form:
  * <code>sbt projectNameOrId version (branch dirty aheadBehind)</code>
  * Where dirty is zero or more of:
  * `*` - at least one modified file
  * `+` - at least one new file
  * `$` - something is stashed
  * `%` - at least one untracked file
  * And aheadBehind is one of:
  * `=` - equal to upstream
  * `>` - ahead of upstream
  * `<` - behind upstream
  * Modified from https://github.com/novus/salat/commit/4e1c11e4e72da75f3bef0da28f59048225f4bd74#commitcomment-4037192 
  * This utility requires git to be installed and on the path */

import sbt._
import Keys._

// Shell prompt which show the current project, git branch and build version
object ShellPrompt extends Plugin {
  override def settings = Seq(
//    shellPrompt := { state =>
//      "sbt (%s)> ".format(Project.extract(state).currentProject.id) }
    shellPrompt := buildShellPrompt
  )

  object devnull extends ProcessLogger {
     def info (s: => String) {}
     def error (s: => String) { }
     def buffer[T] (f: => T): T = f
  }

  private def cleanupGitReponse(string: String): String = 
    if (string.endsWith("%")) string.substring(0, string.length-1) else string
  
  lazy val currBranch:String = {
    val branch: String = ("git rev-parse --abbrev-ref HEAD" lines_! devnull).headOption.getOrElse("???")
    cleanupGitReponse(branch)
  }

  private def parseToBool(cmd: String): Boolean = (cmd lines_! devnull).headOption.exists(_ == "true")

  private def successfulExit(cmd: String): Boolean = cmd ! devnull == 0

  private def unsuccessfulExit(cmd: String): Boolean = !successfulExit(cmd)

  private def dirtyState: String = {
    // transposed from git-completion.bash
    val insideGitDir = parseToBool("git rev-parse --is-inside-git-dir")
    val insideWorkTree = !insideGitDir && parseToBool("git rev-parse --is-inside-work-tree")

    /** For some reason, git config exits with 1 but that's what we want */
    val dirtyState = insideWorkTree && unsuccessfulExit("git config --bool bash.dirtyState") 
    if (dirtyState) {
      val modified = if (unsuccessfulExit("git diff --no-ext-diff --quiet --exit-code")) "*" else ""
      val added = if (successfulExit("git rev-parse --quiet --verify HEAD") && 
                      unsuccessfulExit("git diff-index --cached --quiet HEAD --")) "+" else ""
      val stashed = if (successfulExit("git rev-parse --verify refs/stash")) "$" else ""
      val untracked = if (("git ls-files --others --exclude-standard" lines_! devnull).nonEmpty) "%" else ""
      s"$modified$added$stashed$untracked"
    } else ""
  }

  private def upstreamState: String = {
    val counts: String = ("git rev-list --count --left-right @{upstream}...HEAD" lines_! devnull).headOption.getOrElse("")
    cleanupGitReponse(counts) match {
        case cs if cs.isEmpty => "" // no upstream
        case cs if cs == "0\t0" => "=" // equal to upstream
        case cs if cs.startsWith("0") => ">" // ahead of upstream
        case cs if cs.endsWith("\t0") => "<" // behind upstream
        case _ => "<>" // oh crumbs
    }
  }

  // thanks to https://groups.google.com/forum/#!searchin/simple-build-tool/How$20to$20color$20ShellPrompt/simple-build-tool/H7HcaYiv8FM/lMa2aVgCa3gJ
  // and http://mediadoneright.com/content/ultimate-git-ps1-bash-prompt
  val buildShellPrompt: State => String = (state: State) => {
    import scala.Console.RESET

    val ep: Extracted = Project.extract(state)
    val projectNameOrId: String = ep.getOpt(Keys.name).getOrElse(ep.currentProject.id)
    val projectVersion: String = ep.getOpt(Keys.version).getOrElse("")

    val YELLOW_I = "\033[0;92m"
    val GREEN_I  = "\033[0;92m"
    val RED_I    = "\033[0;91m"
    val BLACK_I  = "\033[00m" // "\033[0;90m" // previous color was invisible with solarized xfce4-terminal over mintty
    val CYAN_I   = "\033[0;96m"

    val dirtyColor: String =
      if (("git status" lines_! devnull).filter(_.contains("nothing to commit")).nonEmpty) GREEN_I
      else RED_I

    "sbt %s%s%s %s%s%s %s(%s%s%s) > ".format(
      CYAN_I, projectNameOrId, RESET,
      BLACK_I, projectVersion, RESET,
      dirtyColor, currBranch, dirtyState, upstreamState, RESET)
   }
 }
 
