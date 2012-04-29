class PetsController < ApplicationController
  def index
    @pets = petfinder.find_pets('dog', '94107')
  end

  def show
  end

private

  def petfinder
    @petfinder = Petfinder::Client.new
  end

end
