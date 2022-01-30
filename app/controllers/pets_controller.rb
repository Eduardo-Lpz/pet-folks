class PetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pet, only: %i[show edit update destroy]

  def index
    @pets = current_pets
    @shelter = current_shelter
  end

  def show
    # set_pet
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(secure_pet_params).tap do |p|
      p.user = current_user
    end

    # binding.irb
    if @pet.save
      if secure_pet_params[:images].present?
        secure_pet_params[:images].each do |i|
          @pet.images.attach i
        end
      end

      redirect_to polymorphic_url([current_user, current_user.userable, Pet])
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # set_pet
    # @pet = Pet.find_by id: params[:id]
    # binding.irb
  end

  def update
    @pet.update! secure_pet_params.reject { |k| k["images"] }
    # TODO: Update attachments
    redirect_to polymorphic_url([current_user, current_user.userable, Pet]), notice: "UPDATEADO" # notice: t("notifications.notice.deleted")
  rescue
    redirect_to polymorphic_url([current_user, current_user.userable, Pet]), alert: "ALERT NO UPDATEADO" # alert: t("notifications.alert.deleted")
  end

  def destroy
    @pet.destroy
    # redirect_to polymorphic_url([current_user, current_user.userable, Pet])

    # redirect_to list_list_file_logs_path(params[:list_id]), notice: t("notifications.notice.deleted")
    redirect_to polymorphic_url([current_user, current_user.userable, Pet]), notice: "BORRADO DE LA EXISTENCIA" # notice: t("notifications.notice.deleted")
  rescue
    redirect_to polymorphic_url([current_user, current_user.userable, Pet]), alert: "ALERT NO BORRADO" # alert: t("notifications.alert.deleted")
  end

  private

  def set_pet
    @pet = Pet.find_by(id: params[:id])
  end

  def secure_pet_params
    params.require(:pet).permit(:name, :specie, :breed, :gender, :age, :size, :coat, :color, :special_needs, :description, images: [])
  end
end

# class AdminsController < ApplicationController
#   before_action :set_admin, only: %i[ show edit update destroy ]

#   # GET /admins or /admins.json
#   def index
#     @admins = Admin.all
#   end

#   # GET /admins/1 or /admins/1.json
#   def show
#   end

#   # GET /admins/new
#   def new
#     @admin = Admin.new
#   end

#   # GET /admins/1/edit
#   def edit
#   end

#   # POST /admins or /admins.json
#   def create
#     @admin = Admin.new(admin_params)

#     respond_to do |format|
#       if @admin.save
#         format.html { redirect_to admin_url(@admin), notice: "Admin was successfully created." }
#         format.json { render :show, status: :created, location: @admin }
#       else
#         format.html { render :new, status: :unprocessable_entity }
#         format.json { render json: @admin.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /admins/1 or /admins/1.json
#   def update
#     respond_to do |format|
#       if @admin.update(admin_params)
#         format.html { redirect_to admin_url(@admin), notice: "Admin was successfully updated." }
#         format.json { render :show, status: :ok, location: @admin }
#       else
#         format.html { render :edit, status: :unprocessable_entity }
#         format.json { render json: @admin.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /admins/1 or /admins/1.json
#   def destroy
#     @admin.destroy

#     respond_to do |format|
#       format.html { redirect_to admins_url, notice: "Admin was successfully destroyed." }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_admin
#       @admin = Admin.find(params[:id])
#     end

#     # Only allow a list of trusted parameters through.
#     def admin_params
#       params.fetch(:admin, {})
#     end
# end
