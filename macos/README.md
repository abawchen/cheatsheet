- **[Mount NTFS writable](http://osxdaily.com/2013/10/02/enable-ntfs-write-support-mac-os-x/)**

    ```bash
    $ diskutil list
    $ sudo umount /dev/disk5s1
    $ sudo /usr/local/bin/ntfs-3g /dev/disk5s1 /Volumes/NTFS -olocal -oallow_other
    ```