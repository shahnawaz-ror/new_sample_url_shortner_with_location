# Sample application with Short URL generate and track the location

Simple todo app to show how to use with [Url-Shortner](https://url-short-ror.herokuapp.com/).

## Installation

Follow these easy steps to install and start the app:

### Set up Rails app

First, install the gems required by the application:

    
    ruby 2.7.2
    bundle

Next, execute the database migrations/schema setup:

	bundle exec rake db:setup #Configure the Database.yml


### Initialize ENV

    DEFAULT_URL_PROD=localhost:3000 #Please use ngrok link so You can check the locations of users also


### Start the app

Start the Rails app to see the In-Context-Editor added to the To-Do application. You're ready to localize your app:

    rails server

You can find your app now by pointing your browser to [http://localhost:3000](http://localhost:3000). If everything worked you can log into In-Context Editor with your Phrase user account or the demo login credentials:

	User: testuser@gmail.com
	Password: 12345678

## So, what next?

The free URL shortner here you can shortner your url for 30 days, and track the locations with ips where the link is access.

