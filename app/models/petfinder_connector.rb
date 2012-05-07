class PetfinderConnector
  attr_accessor :zip, :animal

  def initialize
    @page = 1
    @type = 'animals'
    @limit = 100
    @client = Petfinder::Client.new
  end

  def find_pets
    if zip && animal
      pets = @client.find_pets(animal, zip)
      pets.each do |pet|
        pet_data = transform(pet)
        Pet.create(pet_data) if Pet.where(:remote_id => pet_data[:remote_id], :provider => pet_data[:provider]).empty?
      end
    end
  end

  def transform(data)
    {
      :provider => 'petfinder',
      :name => data.name,
      :species => data.animal,
      :breed => data.breeds.join(' '),
      :gender => data.sex,
      :photo => data.pictures.first.to_s, #transform to 235 x 230
      :zip => zip_from_result(data),
      :remote_id => data.id,
      :description => data.description,
      :age => data.age,
      :contact_email => contact_email(data)
    }
  end

  def shelter(data)
    @shelter ||= @client.shelter(data.shelter_id)
  end

  def zip_from_result(data)
    shelter(data)
    if @shelter
      @shelter.zip
    end
  rescue => e
    puts e
    #do nothing
  end

  def contact_email(data)
    shelter(data)
    if @shelter

    end
  end


end