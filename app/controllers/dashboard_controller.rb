class DashboardController < ApplicationController
  include Pagy::Backend
  def index
    specie_param = params[:specie]
    gender_param = params[:gender]
    age_param = params[:age]
    size_param = params[:size]

    @pets = []

    return if specie_param.blank? && gender_param.blank? && age_param.blank? && size_param.blank?

    if specie_param.blank?
      scope = Pet.where(gender: gender_param).or(Pet.where(age: age_param)).or(Pet.where(size: size_param))
    else
      scope = Pet.where(specie: specie_param)
      scope.where(gender: gender_param).or(scope.where(age: age_param)).or(scope.where(size: size_param))
    end

    @pagy, @pets = pagy(scope, items: 15)
  end
end
