class PetsController < ApplicationController
  include Pagy::Backend
  before_action :authenticate_user!, except: %i[show]
  before_action :set_pet, only: %i[show edit update destroy]

  def index
    @pagy, @pets = pagy(current_pets, items: 16)
    @shelter = current_shelter
  end

  def show
    # TODO: show pet info
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(secure_pet_params).tap do |p|
      p.user = current_user
    end

    if @pet.save
      if secure_pet_params[:images].present?
        secure_pet_params[:images].each do |i|
          @pet.images.attach i
        end
      end

      redirect_to polymorphic_url([current_user, current_user.userable, Pet]), notice: t(".success")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @pet.update! secure_pet_params.reject { |k| k["images"] }
    # TODO: Update attachments
    redirect_to polymorphic_url([current_user, current_user.userable, Pet]), notice: t(".success")
  rescue
    redirect_to polymorphic_url([current_user, current_user.userable, Pet]), alert: t(".alert")
  end

  def destroy
    @pet.destroy
    redirect_to polymorphic_url([current_user, current_user.userable, Pet]), notice: t("notifications.notice.deleted")
  rescue
    redirect_to polymorphic_url([current_user, current_user.userable, Pet]), alert: t("notifications.alert.deleted")
  end

  private

  def set_pet
    @pet = Pet.find_by(id: params[:id])
  end

  def secure_pet_params
    params.require(:pet).permit(:name, :specie, :breed, :gender, :age, :size, :coat, :color, :special_needs, :description, images: [])
  end
end
