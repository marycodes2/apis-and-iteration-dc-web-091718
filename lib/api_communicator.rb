require 'rest-client'
require 'json'
require 'pry'

def send_request(url)
  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)
end

def get_character_movies_from_api
  #make the web request
  send_request('http://www.swapi.co/api/people/')

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

def create_list_of_apis(films_hash, character)
  film_array = []
  films_hash["results"].each do |character_hash|
    if character_hash["name"] == character
        film_array = character_hash["films"].map do |film_api|
          send_request(film_api)
        end
    end
end
film_array
end

def print_movies(film_array)
  film_array.each do |film|
    puts film["title"]
  end
end

def show_character_movies(character)
  hash_of_names = get_character_movies_from_api
  films_array = create_list_of_apis(hash_of_names, character)
  print_movies(films_array)
end



## BONUS
#  Modularization
# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
