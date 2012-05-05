class Pet < ActiveRecord::Base
  def self.search(zip)
    if zip
      results = where(:zip => zip)
    else
      results = self.limit(200)
    end
    self.alternate_animals(results)
  end

  def self.alternate_animals(results)
    return_values = []
    dogs = []
    cats = []

    results.each do |animal|
      if animal.species == 'dog'
        dogs << animal
      elsif animal.species == 'cat'
        cats << animal
      end
    end

    (0..dogs.length).each do
      return_values << dogs.shift if dogs.count > 0
      return_values << cats.shift if cats.count > 0
    end
    [return_values, cats].flatten
  end

end