class ApplicationController < ActionController::Base
  def current_shelter
    @current_shelter ||= current_user.userable
  end

  def current_pets
    @current_pets ||= current_user.pets.order(created_at: :desc)
  end

  def shelter?
    current_user.userable.is_a? Shelter
  end

  def rescuer?
    current_user.userable.is_a? Rescuer
  end

  def adopter?
    current_user.userable.is_a? Adopter
  end

  helper_method :adopter?, :rescuer?, :shelter?
end
