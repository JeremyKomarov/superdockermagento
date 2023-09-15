# Super Docker Magento
Maintained By Jeremy Komarov

## Before Starting
* Make sure you have the DB project.
* MEDIA files if needed.
* In some projects you will need some unique files or configurations:
    - "env.php"
    - setting a unique urls inside the db in after uploaded.

## SSH Key Setup
1. In the terminal do this command "ssh-keygen" to  generate an ssh key inside default path "~/.ssh".
2. choose a name for your ssh-key(if empty then default ssh is "id_rsa").
3. choose password for your ssh-key(you can leave empty for none ssh-key password).
   - This will create 2 files, ~/.ssh/{ssh_name}, ~/.ssh/{ssh_name}.pub.
4. In terminal Run "eval "$(ssh-agent -s)" to start the agent.
5. In terminal Run "ssh-add ~/.ssh/{ssh_name}.pub".
6. In terminal Run "ssh-add -l" to add the ssh-key to agent.
7. In terminal Run "cat" to copy the ssh.public key 
   - for default path and ssh name Run "cat ~/.ssh/id_rsa.pub",
8. In Bitbucket Go to Settings -> Personal Bitbucket Setting -> SSH Keys-> Add Key
9. Choose a Label name and for the Key copy the ssh key from line "7".


## Docker Environment and Project Setup
1. Inside ".env" file set domain and project name.
2. Clone project into "www" folder within Docker directory.
3. Run "make set-env" to set environment.
4. Run "bin/start" to start containers.
5. Run "bin/composer install" to install dependencies.
6. Run "bin/mysql < {db_name}.sql" to import the database.
7. Add media files to "./www/pub/media".
   - For Magento 2.3.2:
8. Run "make install-old" for installation.
   - For other versions:
9. Run "make install" for installation.


## Create Admin User
1. Inside ".env" file set your your admin details.
2. Run "make admin" to create a admin user.


## Xdebug Setup
1. Install "Xdebug helper" browser extension.
2. Configure "Xdebug helper" Set IDE Key to PhpStorm and choose Debug mode.
3. In your project, navigate to Settings > PHP > CLI Interpreter.
4. Click the three dots -> "+" -> "From Docker".
5. Set Server to "docker" and Image to "{project name}-phpfpm".
6. Set Name to your project name and click "OK".
7. Navigate to Settings -> PHP -> Servers. 
8. Click "+" and set name and Host to your full project URL for example "example.local". 
9. Enable "Use path mappings" and map your "www" folder to "/var/www/html".
10. Go to Settings -> PHP -> Debug. 
11. Ensure that the 4 checkboxes under Port are unchecked and 2 checkboxes above are also unchecked.
12. Navigate to Run -> Edit Configurations. 
13. Add "PHP Remote Debug" configuration:
   - Name: Your project URL
   - Check "Filter Debug Connection by IDE Key"
   - Select configured server
   - Enter "PHPSTORM" in IDE Key field.
14. Click the telephone icon to start listening for PHP Debug connections and the bug icon to start debugging.
### Testing the Debugger
1. Set a breakpoint at "$bootstrap->run($app)" in "pub/index.php". 
2. Enter your project's URL in your web browser.


## Grunt
1. Run "make grunt" to install grunt grunt.
2. Run "make set-grunt" to set grunt
3. Run "bin/grunt watch" to start grunt watcher
