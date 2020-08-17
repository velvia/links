<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Amazing, Easy and Cheap Photo Backup using Amazon Drive](#amazing-easy-and-cheap-photo-backup-using-amazon-drive)
  - [Prerequisites](#prerequisites)
  - [Procedure](#procedure)
  - [Non-Amazon Cloud Backups](#non-amazon-cloud-backups)
  - [RClone](#rclone)
  - [B2](#b2)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Amazing, Easy and Cheap Photo Backup using Amazon Drive

## Prerequisites

* Amazon Prime membership and Amazon Drive account (as of 10/2017, unlimited photo storage)
* Mac OSX (instructions are easily adaptable to Linux and other POSIX systems)
* Amazon Drive app / mounted folder
* You follow my [file system based photo layout](http://velvia.github.io/Simplified-Photo-Workflow/)

The idea is that the photos, which form the bulk of the backup, are "free."  However, this can back up other files such as Luminar editing sessions and other metadata too.  Only the non-photos count toward your Amazon Drive cap.

## Procedure

Create a PhotoBackup dir in your Amazon Drive:

    mkdir -p ~/Amazon\ Drive/PhotoBackup

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

    rsync -avz --list-only --include-from=photo-backup-dirlist --exclude '*' /Volumes/MyPhotos/Photos/ ~/Amazon\ Drive/PhotoBackup/

Now remove the `--list-only` and run it.  Heck put it in a cron script for daily backups!

## Non-Amazon Cloud Backups

If you want to backup to other cloud providers, you can easily use the above method as long as there is some kind of FUSE-based or file system folder.  Google Drive, Dropbox, iCloud Drive all have apps that mirror the cloud content to local folders.

For example, to backup to iCloud Drive, just change the destination folder above

    rsync -avz --list-only --include-from=photo-backup-dirlist --exclude '*' /Volumes/MyPhotos/Photos/ ~/Library/Mobile\ Documents/com~apple~CloudDocs/PhotoBackup/

## RClone

[RClone](https://rclone.org/) is even more convenient than rsync in that it can directly back up to multiple cloud places without using a FUSE/local sync folder, which takes up extra space.   In theory it can even upload to Amazon Cloud Drive, but unfortunately Amazon revoked third party API privileges, so you have to use the Amazon Photos app now and a local sync dir.

For example, to upload all selects and albums to the Amazon Photos sync dir:

    rclone sync --include '*/*/*/select/**' --include '*/*/ALBUMS/**' /Volumes/ChanPhotos1/Photos/ ~/amazondrive/Amazon\ Drive/PhotoBackup/

Unfortunately including all your years and dirs in your Amazon sync dir would probably take up too much space, so you might want to restrict the list of years to back up via more specialized `--include` directives.

## B2

BackBlaze B2 is a great cloud object store service with incredibly cost-effective storage, cheaper than S3.  RClone has built-in support, so you can just configure and setup your B2 storage bucket and do:

    rclone sync -v --include '2020/*/*/select/**' --include '2020/*/ALBUMS/**' --include '2020*' --transfers 32 /Volumes/ChanPhotos1/Photos/ b2-evan:Velvia-PhotosPrivate/