# Discovery
Discover popular movies, tv shows, trending actors, and what's airing all thanks to this Discovery application.

<img src="app/assets/images/rdme-screenshot.png" alt="Discovery Application" width="946">

The Movie Database (TMDB) is the supporting database for all information relating to this project.

## How it works
+ The Application's controller handles request of the landing page, the search bar, and the *required* api key.

## Example of the API
The row of 'Airing Today | TV Shows'

_Get Details_
```
GET > /tv/{tv_id}
Get the primary TV show details by id.
tv_id   integer *required*
api_key string  *required*
https://api.themoviedb.org/3/tv/{tv_id}?api_key=<<api_key>>&language=en-US
```

## Dependencies
+ The application runs on Rails 5.2.3

## Installation
+ Fork Project!!
+ Open terminal
+ Inside the terminal, locate the project's folder
+ Next, run the application by starting the rails server via command line: 'rails s'
+ Open a browser window to: http://localhost:3000/
+ Click, Hover -or Search for any person, title, movie -or show! =]
