require 'rest-client'
require 'json'
require 'pry'
require_relative "command_line_interface.rb"

dummy_hash = {
    "count": 87,
    "next": "https://www.swapi.co/api/people/?page=3",
    "previous": "https://www.swapi.co/api/people/?page=1",
    "results": [
        {
            "name": "Anakin Skywalker",
            "height": "188",
            "mass": "84",
            "hair_color": "blond",
            "skin_color": "fair",
            "eye_color": "blue",
            "birth_year": "41.9BBY",
            "gender": "male",
            "homeworld": "https://www.swapi.co/api/planets/1/",
            "films": [
                "https://www.swapi.co/api/films/5/",
                "https://www.swapi.co/api/films/4/",
                "https://www.swapi.co/api/films/6/"
            ],
            "species": [
                "https://www.swapi.co/api/species/1/"
            ],
            "vehicles": [
                "https://www.swapi.co/api/vehicles/44/",
                "https://www.swapi.co/api/vehicles/46/"
            ],
            "starships": [
                "https://www.swapi.co/api/starships/59/",
                "https://www.swapi.co/api/starships/65/",
                "https://www.swapi.co/api/starships/39/"
            ],
            "created": "2014-12-10T16:20:44.310000Z",
            "edited": "2014-12-20T21:17:50.327000Z",
            "url": "https://www.swapi.co/api/people/11/"
        },
        {
            "name": "Wilhuff Tarkin",
            "height": "180",
            "mass": "unknown",
            "hair_color": "auburn, grey",
            "skin_color": "fair",
            "eye_color": "blue",
            "birth_year": "64BBY",
            "gender": "male",
            "homeworld": "https://www.swapi.co/api/planets/21/",
            "films": [
                "https://www.swapi.co/api/films/6/",
                "https://www.swapi.co/api/films/1/"
            ],
            "species": [
                "https://www.swapi.co/api/species/1/"
            ],
            "vehicles": [],
            "starships": [],
            "created": "2014-12-10T16:26:56.138000Z",
            "edited": "2014-12-20T21:17:50.330000Z",
            "url": "https://www.swapi.co/api/people/12/"
        },
        {
            "name": "Chewbacca",
            "height": "228",
            "mass": "112",
            "hair_color": "brown",
            "skin_color": "unknown",
            "eye_color": "blue",
            "birth_year": "200BBY",
            "gender": "male",
            "homeworld": "https://www.swapi.co/api/planets/14/",
            "films": [
                "https://www.swapi.co/api/films/2/",
                "https://www.swapi.co/api/films/6/",
                "https://www.swapi.co/api/films/3/",
                "https://www.swapi.co/api/films/1/",
                "https://www.swapi.co/api/films/7/"
            ],
            "species": [
                "https://www.swapi.co/api/species/3/"
            ],
            "vehicles": [
                "https://www.swapi.co/api/vehicles/19/"
            ],
            "starships": [
                "https://www.swapi.co/api/starships/10/",
                "https://www.swapi.co/api/starships/22/"
            ],
            "created": "2014-12-10T16:42:45.066000Z",
            "edited": "2014-12-20T21:17:50.332000Z",
            "url": "https://www.swapi.co/api/people/13/"
        },
        {
            "name": "Han Solo",
            "height": "180",
            "mass": "80",
            "hair_color": "brown",
            "skin_color": "fair",
            "eye_color": "brown",
            "birth_year": "29BBY",
            "gender": "male",
            "homeworld": "https://www.swapi.co/api/planets/22/",
            "films": [
                "https://www.swapi.co/api/films/2/",
                "https://www.swapi.co/api/films/3/",
                "https://www.swapi.co/api/films/1/",
                "https://www.swapi.co/api/films/7/"
            ],
            "species": [
                "https://www.swapi.co/api/species/1/"
            ],
            "vehicles": [],
            "starships": [
                "https://www.swapi.co/api/starships/10/",
                "https://www.swapi.co/api/starships/22/"
            ],
            "created": "2014-12-10T16:49:14.582000Z",
            "edited": "2014-12-20T21:17:50.334000Z",
            "url": "https://www.swapi.co/api/people/14/"
        },
        {
            "name": "Greedo",
            "height": "173",
            "mass": "74",
            "hair_color": "n/a",
            "skin_color": "green",
            "eye_color": "black",
            "birth_year": "44BBY",
            "gender": "male",
            "homeworld": "https://www.swapi.co/api/planets/23/",
            "films": [
                "https://www.swapi.co/api/films/1/"
            ],
            "species": [
                "https://www.swapi.co/api/species/4/"
            ],
            "vehicles": [],
            "starships": [],
            "created": "2014-12-10T17:03:30.334000Z",
            "edited": "2014-12-20T21:17:50.336000Z",
            "url": "https://www.swapi.co/api/people/15/"
        },
        {
            "name": "Jabba Desilijic Tiure",
            "height": "175",
            "mass": "1,358",
            "hair_color": "n/a",
            "skin_color": "green-tan, brown",
            "eye_color": "orange",
            "birth_year": "600BBY",
            "gender": "hermaphrodite",
            "homeworld": "https://www.swapi.co/api/planets/24/",
            "films": [
                "https://www.swapi.co/api/films/4/",
                "https://www.swapi.co/api/films/3/",
                "https://www.swapi.co/api/films/1/"
            ],
            "species": [
                "https://www.swapi.co/api/species/5/"
            ],
            "vehicles": [],
            "starships": [],
            "created": "2014-12-10T17:11:31.638000Z",
            "edited": "2014-12-20T21:17:50.338000Z",
            "url": "https://www.swapi.co/api/people/16/"
        },
        {
            "name": "Wedge Antilles",
            "height": "170",
            "mass": "77",
            "hair_color": "brown",
            "skin_color": "fair",
            "eye_color": "hazel",
            "birth_year": "21BBY",
            "gender": "male",
            "homeworld": "https://www.swapi.co/api/planets/22/",
            "films": [
                "https://www.swapi.co/api/films/2/",
                "https://www.swapi.co/api/films/3/",
                "https://www.swapi.co/api/films/1/"
            ],
            "species": [
                "https://www.swapi.co/api/species/1/"
            ],
            "vehicles": [
                "https://www.swapi.co/api/vehicles/14/"
            ],
            "starships": [
                "https://www.swapi.co/api/starships/12/"
            ],
            "created": "2014-12-12T11:08:06.469000Z",
            "edited": "2014-12-20T21:17:50.341000Z",
            "url": "https://www.swapi.co/api/people/18/"
        },
        {
            "name": "Jek Tono Porkins",
            "height": "180",
            "mass": "110",
            "hair_color": "brown",
            "skin_color": "fair",
            "eye_color": "blue",
            "birth_year": "unknown",
            "gender": "male",
            "homeworld": "https://www.swapi.co/api/planets/26/",
            "films": [
                "https://www.swapi.co/api/films/1/"
            ],
            "species": [
                "https://www.swapi.co/api/species/1/"
            ],
            "vehicles": [],
            "starships": [
                "https://www.swapi.co/api/starships/12/"
            ],
            "created": "2014-12-12T11:16:56.569000Z",
            "edited": "2014-12-20T21:17:50.343000Z",
            "url": "https://www.swapi.co/api/people/19/"
        },
        {
            "name": "Yoda",
            "height": "66",
            "mass": "17",
            "hair_color": "white",
            "skin_color": "green",
            "eye_color": "brown",
            "birth_year": "896BBY",
            "gender": "male",
            "homeworld": "https://www.swapi.co/api/planets/28/",
            "films": [
                "https://www.swapi.co/api/films/2/",
                "https://www.swapi.co/api/films/5/",
                "https://www.swapi.co/api/films/4/",
                "https://www.swapi.co/api/films/6/",
                "https://www.swapi.co/api/films/3/"
            ],
            "species": [
                "https://www.swapi.co/api/species/6/"
            ],
            "vehicles": [],
            "starships": [],
            "created": "2014-12-15T12:26:01.042000Z",
            "edited": "2014-12-20T21:17:50.345000Z",
            "url": "https://www.swapi.co/api/people/20/"
        },
        {
            "name": "Palpatine",
            "height": "170",
            "mass": "75",
            "hair_color": "grey",
            "skin_color": "pale",
            "eye_color": "yellow",
            "birth_year": "82BBY",
            "gender": "male",
            "homeworld": "https://www.swapi.co/api/planets/8/",
            "films": [
                "https://www.swapi.co/api/films/2/",
                "https://www.swapi.co/api/films/5/",
                "https://www.swapi.co/api/films/4/",
                "https://www.swapi.co/api/films/6/",
                "https://www.swapi.co/api/films/3/"
            ],
            "species": [
                "https://www.swapi.co/api/species/1/"
            ],
            "vehicles": [],
            "starships": [],
            "created": "2014-12-15T12:48:05.971000Z",
            "edited": "2014-12-20T21:17:50.347000Z",
            "url": "https://www.swapi.co/api/people/21/"
        }
    ]
}

def get_character_movies_from_api(character)
  #make the web request
  #Commenting out the below while the API is down#
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  response_hash["results"].each do |character_hash|
    if character_hash["name"] == character
        character_hash["films"].map do |film_api|
          response_string = RestClient.get(film_api)
          response_hash = JSON.parse(response_string)
        end
    end
  end

  # NOTE: in this demonstration we name many of the variables _hash or _array.
  # This is done for educational purposes. This is not typically done in code.


  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end
#test the get_character_movies_from_api method#
puts get_character_movies_from_api("Luke Skywalker")

def print_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies
  welcome
  character = get_character_from_user
  #films_array = get_character_movies_from_api(character)
  #print_movies(films_array)
end



## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
