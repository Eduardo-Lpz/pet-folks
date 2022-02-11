class SheltersController < ApplicationController
  before_action :set_shelter, only: %i[edit update]

  def new
    @shelter = Shelter.new
    @shelter.users.build
  end

  def create
    @shelter = Shelter.new secure_shelter_params

    lonlat = secure_shelter_params.dig(:users_attributes, "0", :lonlat).split(",").map(&:to_f)
    if lonlat.size.eql?(2) && lonlat.first&.between?(-180, 180) && lonlat.last&.between?(-90, 90)
      @shelter.users.first.lonlat = RGeo::Geographic.spherical_factory(srid: 4326).point(*lonlat)
    end

    if @shelter.save
      redirect_to new_user_session_path, notice: t(".success")
    else
      @shelter.users.first.address = ""
      @shelter.users.first.lonlat = nil
      @shelter.valid?

      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    params_lonlat = secure_shelter_params.dig(:users_attributes, "0", :lonlat)

    unless @shelter.users.first.lonlat.to_s.eql? params_lonlat
      new_lonlat = params_lonlat.split(",").map(&:to_f)
      if new_lonlat.size.eql?(2) && new_lonlat.first&.between?(-180, 180) && new_lonlat.last&.between?(-90, 90)

        secure_shelter_params.tap do |params|
          params[:users_attributes]["0"].delete("lonlat")
          @shelter.users.first.update!(*params[:users_attributes]["0"])
          params.delete(:users_attributes)
          @shelter.update!(*params)
        end

        @shelter.users.first.update!(lonlat: RGeo::Geographic.spherical_factory(srid: 4326).point(*new_lonlat))

        return redirect_to edit_user_shelter_path, notice: t("notifications.notice.updated")
      end
    end

    secure_shelter_params.tap do |params|
      params[:users_attributes]["0"].delete("lonlat")
      @shelter.users.first.update!(*params[:users_attributes]["0"])
      params.delete(:users_attributes)
      @shelter.update!(*params)
    end

    redirect_to edit_user_shelter_path, notice: t("notifications.notice.updated")
  rescue
    redirect_to edit_user_shelter_path, alert: t("notifications.alert.updated")
  end

  private

  def set_shelter
    @shelter = Shelter.find(params[:id])
  end

  def secure_shelter_params
    params.require(:shelter).permit(:name, :link, :description, users_attributes: [:email, :password, :password_confirmation, :address, :lonlat, :phone])
  end
end
