# Mount Remove Disk

## Ubuntu

- Make sure `/mnt/share_folder` existed
- NFS

  ```bash
  # Check NFS service
  $ showmount -e hostname:/folder

  # Mount  
  $ sudo mount -t nfs hostname:/folder /mnt/share_folder
  ```

- SMABA (smb, cifs)

  ```bash
  # Check SAMBA service
  $ sudo apt-get install smbclient
  $ smbclient -L hostname -U username
  
  # Mount
  $ sudo apt-get install cifs-utils
  $ sudo mount -t cifs -v -o username=username,password=password,gid=1019,forcegid,file_mode=0775,dir_mode=0775 //hostname/folder /mnt/share_folder
  # gid=1019,forcegid,file_mode=0775,dir_mode=0775 => r/w for specific group
  ```

- Unmount

  ```bash
  $ sudo umount /mnt/share_folder
  
  # if target is busy, use fuser to get pid, then kill it
  $ sudo fuser -m /mnt/share_folder
  ```

- Auto-mount at boot

  /etc/fstab
  ```
  # nfs
  hostname:/folder  /mnt/share_folder nfs  rw   0 0
  
  # cifs
  //hostname/folder /mnt/share_folder cifs  uid=0,credentials=.smb,iocharset=utf8,noperm 0 0
  ```

  .smb
  ```
  user=username
  password=password
  domain=domain
  ```
  
  ```bash
  $ sudo mount -a
  ```
