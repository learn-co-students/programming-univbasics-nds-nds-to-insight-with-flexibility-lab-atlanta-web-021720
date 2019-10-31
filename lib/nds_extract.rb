# Provided, don't edit

require 'directors_database'
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
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point
#require 'pp'
#pp directors_database

def movies_with_director_key(name, movies_collection)
  index = 0 
  dir_mov_array = []
  
  while index < movies_collection.length do
    dir_mov_array << movie_with_director_name(name, movies_collection[index])
    
    index += 1
  end
  dir_mov_array
end


def gross_per_studio(collection)
  index = 0
  new_hash = {}

  while index < collection.length do
    studio_name = collection[index][:studio]
    sub_gross = collection[index][:worldwide_gross]
    
    if !new_hash[studio_name]
      new_hash[studio_name] = sub_gross
    else
      new_hash[studio_name] += sub_gross
    end
    index += 1
  end
new_hash
end

def movies_with_directors_set(source)
  index = 0
  new_array = []
  
  while index < source.length do
    name = source[index][:name]
    movies = source[index][:movies]
    new_array << movies_with_director_key(name, movies)
    index += 1
  end
  new_array
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
