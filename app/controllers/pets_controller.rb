class PetsController < ApplicationController
  respond_to :html, :json

  def index
    @pets = Pet.search(params[:zip])
    respond_with(@pets)
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
