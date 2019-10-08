## GitLab

### Run GitLab docker on Ubuntu

- docker-compose.yml
  ```bash
  # with following docker-compose.yml
  $ docker-compose up -d
  ```
  
  ```yml
  version: '3.2'
  services:

    gitlab:
      image: gitlab/gitlab-ce:12.1.1-ce.0
      # hostname: git.aheadmedicine.com
      environment:
        GITLAB_OMNIBUS_CONFIG: |
          external_url 'https://gitlab.example.com'
          letsencrypt['enable'] = true
      container_name: gitlab-12.1.1
      restart: always
      volumes:
        - /gitlab/config:/etc/gitlab
        - /gitlab/logs:/var/log/gitlab
        - /gitlab/data:/var/opt/gitlab
      ports:
        - 443:443
        - 80:80
        - 22:22
      networks:
        - devel-net

  networks:
    devel-net:
  ```

### [Backup & Restore](https://docs.gitlab.com/ee/raketasks/backup_restore.html)

- Backup

  ```bash
  # First make sure your backup tar file is in the backup directory described in 
  # the gitlab.rb configuration gitlab_rails['backup_path'].
  # The default is /var/opt/gitlab/backups. It needs to be owned by the git user.

  # 12.2+
  $ sudo gitlab-backup create
  # docker
  $ docker exec -it {container_name} gitlab-backup create

  # 12.1 and earlier
  $ sudo gitlab-rake gitlab:backup:create
  ```
  
- Restore

  ```bash
  # 12.2+
  $ sudo gitlab-backup restore
  # docker
  $ docker exec -it {container_name} gitlab-backup restore
  
  # 12.1 and earlier
  $ gitlab-rake gitlab:backup:restore
  $ gitlab-rake gitlab:backup:restore BACKUP={timestamp}
  ```
