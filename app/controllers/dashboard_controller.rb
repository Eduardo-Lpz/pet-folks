class DashboardController < ApplicationController
  include Pagy::Backend
  def index
    # valid_fields = params.slice(:specie, :gender, :age, :size).delete_if { |k, v| v.blank? }

    specie_param = params[:specie]
    gender_param = params[:gender]
    age_param = params[:age]
    size_param = params[:size]

    @pets = []

    return if specie_param.blank? && gender_param.blank? && age_param.blank? && size_param.blank?
    # return if valid_fields.blank?

    # scope = Pet.all
    scope = specie_param.blank? ? Pet.all : Pet.where(specie: specie_param)
    scope.tap do |s|
      s.or(scope.where(specie: specie_param)) unless specie_param.blank?
      s.or(scope.where(gender: gender_param)) unless gender_param.blank?
      s.or(scope.where(age: age_param)) unless age_param.blank?
      s.or(scope.where(size: size_param)) unless size_param.blank?
    end

    @pagy, @pets = pagy(scope, items: 15)
  end
end
