# Super Docker Magento
Before proceeding, ensure that you have the database inside the docke folder and project repository.

Follow these steps to set up the project:

1. Open the .env file and provide the desired domain and project name.
2. Clone your project into a new folder named www within the Docker directory.
3. 'make env' To set the project env and set the wanted host.
5. 'bin/start' To start the project containers.
6. 'bin/composer install' To install project dependencies.
7. 'bin/mysql < db.sql' To import the database.
# If you have any media files to add, add it now to ./www/pub/media
8. 'make install' To complete the installation process.

#If project is 2.3.2 version do steps 1-7 and then do this:
8. 'make install-old' To complete the installatin procces.