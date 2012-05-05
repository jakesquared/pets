class Runner
  def self.run_rescue_group(page)
    requester = Requester.new(RescuegroupConnector.new)
    requester.page = page
    requester.limit = 100
    requester.make_request
  end

  def self.run_petfinder
    connector = PetfinderConnector.new
    Zip.select(:zip).group(:zip).each do |zip|
      %w(dog cat).each do |animal|
        connector.animal = animal
        connector.zip = zip.zip
        connector.find_pets
      end
    end
  end
end