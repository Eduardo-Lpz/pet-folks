class RescuersController < ApplicationController
  before_action :set_rescuer, only: %i[edit update]

  def new
    @rescuer = Rescuer.new
    @rescuer.users.build
  end

  def create
    @rescuer = Rescuer.new secure_rescuer_params

    lonlat = secure_rescuer_params.dig(:users_attributes, "0", :lonlat).split(",").map(&:to_f)
    if lonlat.size.eql?(2) && lonlat.first&.between?(-180, 180) && lonlat.last&.between?(-90, 90)
      @rescuer.users.first.lonlat = RGeo::Geographic.spherical_factory(srid: 4326).point(*lonlat)
    end

    if @rescuer.save
      redirect_to new_user_session_path, notice: t(".success")
    else
      @rescuer.users.first.address = ""
      @rescuer.users.first.lonlat = nil
      @rescuer.valid?

      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    params_lonlat = secure_rescuer_params.dig(:users_attributes, "0", :lonlat)

    unless @rescuer.users.first.lonlat.to_s.eql? params_lonlat
      new_lonlat = params_lonlat.split(",").map(&:to_f)
      if new_lonlat.size.eql?(2) && new_lonlat.first&.between?(-180, 180) && new_lonlat.last&.between?(-90, 90)

        secure_rescuer_params.tap do |params|
          params[:users_attributes]["0"].delete("lonlat")
          @rescuer.users.first.update!(*params[:users_attributes]["0"])
          params.delete(:users_attributes)
          @rescuer.update!(*params)
        end

        @rescuer.users.first.update!(lonlat: RGeo::Geographic.spherical_factory(srid: 4326).point(*new_lonlat))

        return redirect_to edit_user_rescuer_path, notice: t("notifications.notice.updated")
      end
    end

    secure_rescuer_params.tap do |params|
      params[:users_attributes]["0"].delete("lonlat")
      @rescuer.users.first.update!(*params[:users_attributes]["0"])
      params.delete(:users_attributes)
      @rescuer.update!(*params)
    end

    redirect_to edit_user_rescuer_path, notice: t("notifications.notice.updated")
  rescue
    redirect_to edit_user_rescuer_path, alert: t("notifications.alert.updated")
  end

  private

  def set_rescuer
    @rescuer = Rescuer.find(params[:id])
  end

  def secure_rescuer_params
    params.require(:rescuer).permit(:name, users_attributes: [:email, :password, :password_confirmation, :address, :lonlat, :phone])
  end
end
