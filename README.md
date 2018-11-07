# README

## Technology Stack

- Ruby 2.5.1
- Rails 5.2.0
- Postgres 9.5
- Capistrano

## Development

1. Create config/application.yml file and add the following variables: 
    ```
    development:
        APP_HOST: ''
        APP_PORT: ''
        
        MAIL_USERNAME: ''
        MAIL_PASSWORD: ''
        MAIL_ADDRESS: ''
        MAIL_DOMAIN: ''
        MAIL_PORT: ''
        MAIL_AUTHENTICATION: ''
        
        DATABASE_NAME: ''
        DATABASE_USERNAME: ''
        DATABASE_HOST: ''
        DATABASE_PASSWORD: ''
    ```
    For more information: [figaro gem](https://github.com/laserlemon/figaro)

2. Create config/database.yml with your DB information
 
3. Install the dependencies
    ```
    $ bundle install
    ```
4. Run the migrations
    ```
    $ rake db:migrate
    ```
5. Start the app    
    ```
    $ rails server
    ```
    
## Run with Capistrano in a server
Steps to run in a server using [Capistrano](https://github.com/capistrano/rails):
1. Create config/deploy/production.rb. And configure with your server credentials and information.
2. Create config/application.yml file and add the following variables: 
    ```
    production:
        APP_HOST: ''
        APP_PORT: ''
        
        MAIL_USERNAME: ''
        MAIL_PASSWORD: ''
        MAIL_ADDRESS: ''
        MAIL_DOMAIN: ''
        MAIL_PORT: ''
        MAIL_AUTHENTICATION: ''
        
        DATABASE_NAME: ''
        DATABASE_USERNAME: ''
        DATABASE_HOST: ''
        DATABASE_PASSWORD: ''
    ```
3. Run the setup:
    ```
    $ bundle exec cap production setup
    ```
4. Deploy to production
    ```
    $ bundle exec cap production deploy
    ```    

This steps are for production, but can be used with production, staging, etc.
More info about capistrano can be found [here](https://capistranorb.com/)