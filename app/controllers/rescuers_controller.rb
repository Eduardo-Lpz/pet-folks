class RescuersController < ApplicationController
  before_action :set_rescuer, only: %i[edit update]

  def new
    @rescuer = Rescuer.new
    @rescuer.users.build
  end

  def create
    @rescuer = Rescuer.new secure_rescuer_params

    lonlat = secure_rescuer_params[:lonlat].split(",").map(&:to_f)
    if lonlat.size.eql?(2) && lonlat.first&.between?(-180, 180) && lonlat.last&.between?(-90, 90)
      @rescuer.lonlat = RGeo::Geographic.spherical_factory(srid: 4326).point(*lonlat)
    end

    if @rescuer.save
      redirect_to new_user_session_path, notice: t(".success")
    else
      @rescuer.address = ""
      @rescuer.lonlat = nil
      @rescuer.valid?

      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    unless @rescuer.lonlat.to_s.eql? secure_rescuer_params[:lonlat]
      lonlat = secure_rescuer_params[:lonlat].split(",").map(&:to_f)
      if lonlat.size.eql?(2) && lonlat.first&.between?(-180, 180) && lonlat.last&.between?(-90, 90)
        @rescuer.update! secure_rescuer_params.reject { |k| k["lonlat"] }
        @rescuer.update!(lonlat: RGeo::Geographic.spherical_factory(srid: 4326).point(*lonlat))
      end

    end

    @rescuer.update! secure_rescuer_params.reject { |k| k["lonlat"] }

    redirect_to edit_user_rescuer_path, notice: t("notifications.notice.updated")
  rescue
    redirect_to edit_user_rescuer_path, alert: t("notifications.alert.updated")
  end

  private

  def set_rescuer
    @rescuer = Rescuer.find(params[:id])
  end

  def secure_rescuer_params
    params.require(:rescuer).permit(:name, :address, :lonlat, :phone, users_attributes: [:email, :password, :password_confirmation])
  end
end
