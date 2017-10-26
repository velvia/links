# Amazing, Easy and Cheap Photo Backup using Amazon Drive

## Prerequisites

* Amazon Prime membership and Amazon Drive account (as of 10/2017, unlimited photo storage)
* Mac OSX (instructions are easily adaptable to Linux and other POSIX systems)
* Amazon Drive app / mounted folder
* You follow my file system based photo layout

The idea is that the photos, which form the bulk of the backup, are "free."  However, this can back up other files such as Luminar editing sessions and other metadata too.  Only the non-photos count toward your Amazon Drive cap.

## Procedure

Create a file list.  This will need to be maintained.  The below would back up all the SELECTs (better photos; for me maybe my best 10%) and ALBUMs (I create at least one every quarter of the best stuff).

```
+ XT1-watermark1.jpg
+ XT1-darkframe.JPG
+ 2016/
+ 2016/Q4/
+ 2016/Q4/*/
+ 2016/Q4/*/select/***
+ 2016/Q4/ALBUMS/***
```

Do a test run to list the files and ensure just the right ones are included:

    rsync -avz --list-only --include-from=photo-backup-dirlist --exclude '*' /Volumes/MyPhotos/Photos/ ~/Amazon\ Drive/

Now remove the `--list-only` and run it.  Heck put it in a cron script for daily backups!