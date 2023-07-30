# Super Docker Magento
Maintain By Jeremy Komarov

Before proceeding, ensure that you have the database inside the docke folder and project repository.

Follow these steps to set up the project:

1. Open the .env file and provide the desired domain and project name.
2. Clone your project into a new folder named www within the Docker directory.
3. Run make env to set the project environment and host.
4. Use bin/start to start the project containers.
5. Run bin/composer install to install project dependencies.
6. Use bin/mysql < db.sql to import the database.
7. If you have any media files to add, add them now to ./www/pub/media.
For Magento version 2.3.2, use step 8B. For other versions, use step 8A.
8. A. Run make install to complete the installation process.
8. B Run make install232 to complete the installation process.

# Xdebug
1. In your project, navigate to Settings > PHP > CLI Interactor.
2. Click the three dots > "+" > "From Docker".
3. Set Server to "docker" and Image to {project name}-phpfpm.
4. Set Name to your project's name and click "OK".
5. Navigate to Settings > PHP > Servers. 
6. Click "+" and set Name and Host to your full project URL for exmaple "example.local". 
7. Enable "Use path mappings" and map your www folder to /var/www/html.
8. Go to Settings > PHP > Debug. 
9. Ensure that the 4 checkboxes under Port are unchecked and 2 checkboxes above are also unchecked
10. Navigate to Run > Edit Configurations.
11. Click "+" > "PHP Remote Debug". 
12. Set Name to your project URL, enable "Filter Debug Connection by IDE Key", 
select the server you've set up, and enter "PHPSTORM" in IDE Key
13. Click the telephone icon to start listening for PHP Debug connections and the bug icon to start debugging

To test it do
1. Set a breakpoint at $bootstrap->run($app); in pub/index.php. 
2. Enter your project's URL in your web browser.
