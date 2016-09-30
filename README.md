# Boardgame-Social
Rails app to track your boardgames, play sessions with friends

## Features

* Add user
* Able to pull collection from Board Game Geek account through API if username is same as BGG account
* View collection and BGG info for each game
* Able to search users to add as friends
* Able to see friends collection
* Able to request and confirm loaning/borrowing Games

*in progress*

* Able to set up a game with friends

## Starting the App locally

Fork and Clone repo and navigate to the folder.

Get required gems `> bundle install`

Set up Database
```
> rake db:create
> rake db:migrate
```

Start server `rails s`

Go to `localhost:3000` in your browser

## Contributing

If you would like to contribute submit a pull request and I'll add you as a contributor

## Contributors

ttalhouk

Thanks to Boardgame Geek for supplying boardgame information




