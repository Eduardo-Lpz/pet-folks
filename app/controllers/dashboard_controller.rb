class DashboardController < ApplicationController
  include Pagy::Backend
  def index
    @pets = []

    if params[:commit].present?
      distance_param = Pet.distances[params[:distance]]
      specie_param = Pet.species[params[:specie]]
      gender_param = Pet.genders[params[:gender]]
      age_param = Pet.ages[params[:age]]
      size_param = Pet.sizes[params[:size]]

      return flash.now.alert = t("notifications.alert.index.values") if [distance_param, specie_param, gender_param, age_param, size_param].all? { |p| p.nil? }

      scope = distance_param.present? ?
                Pet.joins(:user).where("ST_DWithin(users.lonlat, ? , ?)", current_user.lonlat, distance_param) :
                Pet.all

      scope.where!(specie: specie_param) unless specie_param.blank?
      scope.where!(gender: gender_param) unless gender_param.blank?
      scope.where!(age: age_param) unless age_param.blank?
      scope.where!(size: size_param) unless size_param.blank?

      return flash.now.alert = t("notifications.alert.index.not_found_html") if scope.count.zero?
      @pagy, @pets = pagy(scope, items: 15)
    end
  end
end
