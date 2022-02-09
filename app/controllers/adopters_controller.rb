class AdoptersController < ApplicationController
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

  private

  def secure_adopter_params
    params.require(:adopter).permit(:name, :last_name, :address, :lonlat, :phone, users_attributes: [:email, :password, :password_confirmation])
  end
end
