class ApplicationController < ActionController::Base
  def current_shelter
    @current_shelter ||= current_customer&.shelter
  end

  def current_pets
    @current_pets ||= current_shelter&.pets
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && customer_signed_in?
      sign_out(current_customer)
    end

    if resource.is_a?(Customer) && user_signed_in?
      sign_out(current_user)
    end

    super
  end
end
