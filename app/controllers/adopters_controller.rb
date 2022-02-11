class AdoptersController < ApplicationController
  before_action :set_adopter, only: %i[edit update]

  def new
    @adopter = Adopter.new
    @adopter.users.build
  end

  def create
    @adopter = Adopter.new secure_adopter_params

    lonlat = secure_adopter_params.dig(:users_attributes, "0", :lonlat).split(",").map(&:to_f)
    if lonlat.size.eql?(2) && lonlat.first&.between?(-180, 180) && lonlat.last&.between?(-90, 90)
      @adopter.users.first.lonlat = RGeo::Geographic.spherical_factory(srid: 4326).point(*lonlat)
    end

    if @adopter.save
      redirect_to new_user_session_path, notice: t(".success")
    else
      @adopter.users.first.address = ""
      @adopter.users.first.lonlat = nil
      @adopter.valid?

      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    params_lonlat = secure_adopter_params.dig(:users_attributes, "0", :lonlat)

    unless @adopter.users.first.lonlat.to_s.eql? params_lonlat
      new_lonlat = params_lonlat.split(",").map(&:to_f)
      if new_lonlat.size.eql?(2) && new_lonlat.first&.between?(-180, 180) && new_lonlat.last&.between?(-90, 90)

        secure_adopter_params.tap do |params|
          params[:users_attributes]["0"].delete("lonlat")
          @adopter.users.first.update!(*params[:users_attributes]["0"])
          params.delete(:users_attributes)
          @adopter.update!(*params)
        end

        @adopter.users.first.update!(lonlat: RGeo::Geographic.spherical_factory(srid: 4326).point(*new_lonlat))

        return redirect_to edit_user_adopter_path, notice: t("notifications.notice.updated")
      end
    end

    secure_adopter_params.tap do |params|
      params[:users_attributes]["0"].delete("lonlat")
      @adopter.users.first.update!(*params[:users_attributes]["0"])
      params.delete(:users_attributes)
      @adopter.update!(*params)
    end

    redirect_to edit_user_adopter_path, notice: t("notifications.notice.updated")
  rescue
    redirect_to edit_user_adopter_path, alert: t("notifications.alert.updated")
  end

  private

  def set_adopter
    @adopter = Adopter.find(params[:id])
  end

  def secure_adopter_params
    params.require(:adopter).permit(:name, :last_name, users_attributes: [:email, :password, :password_confirmation, :address, :lonlat, :phone])
  end
end
