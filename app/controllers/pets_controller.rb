class PetsController < ApplicationController
  respond_to :html, :json

  def index
    @pets = Pet.search(params[:zip])
    if @pets.count > 0
      respond_with(@pets)
    else
      @locations = Pet.locations_with_pets
    end
  end

  def show
    @pet = Pet.find(params[:id])
    respond_with(@pet)
  end

private

  def petfinder
    @petfinder = Petfinder::Client.new
  end

end
