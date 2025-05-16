# REST API Security with Node-Express-PostgreSQL-Oauth2 

## Environnement prerequisites
- install nodejs
- install postgresql
- add a user to your postgresql database
- add a database for the app and set the user you created in the last step as owner

## Start the app
1. Edit the file config/config.json to match the user and database you created in environnement setup
2. run `npm install`
3. run `npx sequelize-cli db:migrate`
4. run `npm run dev`
