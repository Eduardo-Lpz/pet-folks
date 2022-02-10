class SheltersController < ApplicationController
  before_action :set_shelter, only: %i[edit update]

  def new
    @shelter = Shelter.new
    @shelter.users.build
  end

  def create
    @shelter = Shelter.new secure_shelter_params

    lonlat = secure_shelter_params[:lonlat].split(",").map(&:to_f)
    if lonlat.size.eql?(2) && lonlat.first&.between?(-180, 180) && lonlat.last&.between?(-90, 90)
      @shelter.lonlat = RGeo::Geographic.spherical_factory(srid: 4326).point(*lonlat)
    end

    if @shelter.save
      redirect_to new_user_session_path, notice: t(".success")
    else
      @shelter.address = ""
      @shelter.lonlat = nil
      @shelter.valid?

      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    unless @shelter.lonlat.to_s.eql? secure_shelter_params[:lonlat]
      lonlat = secure_shelter_params[:lonlat].split(",").map(&:to_f)

      if lonlat.size.eql?(2) && lonlat.first&.between?(-180, 180) && lonlat.last&.between?(-90, 90)
        @shelter.update! secure_shelter_params.reject { |k| k["lonlat"] }
        @shelter.update!(lonlat: RGeo::Geographic.spherical_factory(srid: 4326).point(*lonlat))
      end
    end

    @shelter.update! secure_shelter_params.reject { |k| k["lonlat"] }

    redirect_to edit_user_shelter_path, notice: t("notifications.notice.updated")
  rescue
    redirect_to edit_user_shelter_path, alert: t("notifications.alert.updated")
  end

  private

  def set_shelter
    @shelter = Shelter.find(params[:id])
  end

  def secure_shelter_params
    params.require(:shelter).permit(:name, :address, :lonlat, :phone, :link, :description, users_attributes: [:email, :password, :password_confirmation])
  end
end
