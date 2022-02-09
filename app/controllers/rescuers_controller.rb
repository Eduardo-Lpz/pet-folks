class RescuersController < ApplicationController
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

  private

  def secure_rescuer_params
    params.require(:rescuer).permit(:name, :address, :lonlat, :phone, users_attributes: [:email, :password, :password_confirmation])
  end
end
