class AdoptersController < ApplicationController
  before_action :set_adopter, only: %i[edit update]

  def new
    @adopter = Adopter.new
    @adopter.users.build
  end

  def create
    @adopter = Adopter.new secure_adopter_params

    lonlat = secure_adopter_params[:lonlat].split(",").map(&:to_f)
    if lonlat.size.eql?(2) && lonlat.first&.between?(-180, 180) && lonlat.last&.between?(-90, 90)
      @adopter.lonlat = RGeo::Geographic.spherical_factory(srid: 4326).point(*lonlat)
    end

    if @adopter.save
      redirect_to new_user_session_path, notice: t(".success")
    else
      @adopter.address = ""
      @adopter.lonlat = nil
      @adopter.valid?

      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    unless @adopter.lonlat.to_s.eql? secure_adopter_params[:lonlat]
      lonlat = secure_adopter_params[:lonlat].split(",").map(&:to_f)

      if lonlat.size.eql?(2) && lonlat.first&.between?(-180, 180) && lonlat.last&.between?(-90, 90)
        @adopter.update! secure_adopter_params.reject { |k| k["lonlat"] }
        @adopter.update!(lonlat: RGeo::Geographic.spherical_factory(srid: 4326).point(*lonlat))
      end
    end

    @adopter.update! secure_adopter_params.reject { |k| k["lonlat"] }

    redirect_to edit_user_adopter_path, notice: t("notifications.notice.updated")
  rescue
    redirect_to edit_user_adopter_path, alert: t("notifications.alert.updated")
  end

  private

  def set_adopter
    @adopter = Adopter.find(params[:id])
  end

  def secure_adopter_params
    params.require(:adopter).permit(:name, :last_name, :address, :lonlat, :phone, users_attributes: [:email, :password, :password_confirmation])
  end
end
