class Runner
  def initialize(function, page = nil)
    @function = function
    @page = page
  end

  def run_rescue_group(page)
    requester = Requester.new(RescuegroupConnector.new)
    requester.page = page
    requester.limit = 100
    requester.make_request
  end

  def run_petfinder(page = nil)
    connector = PetfinderConnector.new
    Zip.select(:zip).group(:zip).each do |zip|
      %w(dog cat).each do |animal|
        connector.animal = animal
        connector.zip = zip.zip
        connector.find_pets
      end
    end
  end

  def perform
    if @page
      send(@function.to_sym, @page.to_i)
    else
      send(@function)
    end
  end
end