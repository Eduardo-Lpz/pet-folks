class PetsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @pets = current_pets
    @shelter = current_shelter
  end

  def new
    @pet = Pet.new
  end

  def create
    @new_pet = Pet.new(secure_pet_params).tap do |p|
      p.shelter = current_shelter
    end

    if @new_pet.save
      redirect_to pets_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  private

  def secure_pet_params
    params.require(:pet).permit(:name, :specie, :breed, :gender, :age, :size, :coat, :color, :special_needs, :description, images: [])
  end
end