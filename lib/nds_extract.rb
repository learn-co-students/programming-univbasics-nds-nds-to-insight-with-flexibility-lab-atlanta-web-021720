# Provided, don't edit
require 'directors_database'
require 'pp'
require 'pry'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  {
    :title => movie_data[:title],
    # :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end

# Your code after this point

def movies_with_director_key(name, movies_collection)
#   r =   {
#       :worldwide_gross => 2,
#       :release_year => 2014,
#       :studio => "Karbit Poodles",
#       :title => "The Fire Hydrant of Doom"
#     }
#   nameDir = "matthew"
#
#
# result =  movie_with_director_name(nameDir, r)

    result = []

    movies_collection.each do |i|

      result << movie_with_director_name(name, i)

    end

    result


  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie {}




  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
end


def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #ñ

  # test_data = [
  #   { :title => "Movie A", :studio => "Alpha Films", :worldwide_gross => 10 },
  #   { :title => "Movie B", :studio => "Alpha Films", :worldwide_gross => 30 },
  #   { :title => "Movie C", :studio => "Omega Films", :worldwide_gross => 30 }
  # ]


  #pp collection
  result = {}

  for i in 0...collection.length do
    studio_name = collection[i][:studio]
    gross_amount = collection[i][:worldwide_gross]

     if result[studio_name] == nil
        result[studio_name] = gross_amount
     elsif result[studio_name] != nil
       result[studio_name] += gross_amount
     end
  end
  result



  # pp result
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
end

def movies_with_directors_set(source)



  # let (:test_data) {
  #   [
  #     { :name => "Byron Poodle", :movies => [
  #       { :title => "At the park" },
  #       { :title => "On the couch" },
  #     ]
  #     },
  #     { :name => "Nancy Drew", :movies => [
  #       { :title => "Biting" },
  #     ]
  #     }
  #   ]
  # }
    #pp source

    #return array of hashes 
    # [[{:title => "Test", :director_name => "A"}]
    i = 0
    a_o_a_movies_by_dir = []
  
    while i < source.length do
      dir_info_hash = source[i]
      director_name = dir_info_hash[:name]
      directors_movies = dir_info_hash[:movies]
      a_o_a_movies_by_dir << movies_with_director_key(director_name, directors_movies)
      i += 1
    end
  
    a_o_a_movies_by_dir
  end


  

  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.


# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
