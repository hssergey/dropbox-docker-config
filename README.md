# dropbox-docker-config
Configuration files to dockerize dropbox

Usage:
1. Clone this repository
2. Make sure that your linux user has id 1000 (you can check it by command  echo $UID). Change id of user and group in dockerfile if you have another.
3. cd to folder dropbox-docker-config and create folders:
  - Drobox to store your files. If you want to use different folder for files, change path in docker-compose.yml
  - db-conf to store dropbox configuration files
4. Run dropbox by command:  docker-compose up . In the first time the software will output in console url you should enter to log in to your dropbox account.

