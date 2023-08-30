Maintain By Jeremy Komarov

# Super Docker Magento

# SSH
1. In the terminal do this command "ssh-keygen" to  generate an ssh key inside default path "~/.ssh".
2. choose a name for your ssh-key(if empty then default ssh is "id_rsa").
3. choose password for your ssh-key(you can leave empty for none ssh-key password).
   This will create 2 files, ~/.ssh/{ssh_name}, ~/.ssh/{ssh_name}.pub.
4. In terminal do this command "eval "$(ssh-agent -s)" to start the agent.
5. In terminal do this command "ssh-add ~/.ssh/{ssh_name}.pub".
6. In terminal do this command "ssh-add -l" to add the ssh-key to agent.
7. In terminal do this command to copy the ssh.public key 
    for default path and ssh name do this "cat ~/.ssh/id_rsa.pub",

    Now go to your bitbucket account.
8. Setting -> Personal Bitbucket Setting -> SSH Keys-> Add Key
9. Choose a Label name and for Key copy the ssh key from line "7".


# Installing Docker environment and Project.
1. Inside ".env" file set domain and project name.
2. Clone project into "www" folder within Docker directory.
3. Run "make env" to set environment.
4. Run "bin/start" to start containers.
5. Run "bin/composer install" to dependencies.
6. Run "bin/mysql < {db_name}.sql" to import the database.
7. Add media files to "./www/pub/media".
   For Magento 2.3.2:
8. Run "make install-old" for installation.
   For other versions:
9. Run "make install" for installation.

# Xdebug
1. Install "Xdebug helper" browser extension.
2. Configure "Xdebug helper" Set IDE Key to PhpStorm and choose Debug mode.
4. In your project, navigate to Settings > PHP > CLI Interpreter.
5. Click the three dots -> "+" -> "From Docker".
6. Set Server to "docker" and Image to "{project name}-phpfpm".
7. Set Name to your project name and click "OK".
8. Navigate to Settings -> PHP -> Servers. 
9. Click "+" and set name and Host to your full project URL for example "example.local". 
10. Enable "Use path mappings" and map your "www" folder to "/var/www/html".
11. Go to Settings -> PHP -> Debug. 
12. Ensure that the 4 checkboxes under Port are unchecked and 2 checkboxes above are also unchecked.
13. Navigate to Run -> Edit Configurations. 
14. Click "+" > "PHP Remote Debug". 
16. Click the telephone icon to start listening for PHP Debug connections and the bug icon to start debugging.

To test it do
1. Set a breakpoint at "$bootstrap->run($app)" in "pub/index.php". 
2. Enter your project's URL in your web browser.
