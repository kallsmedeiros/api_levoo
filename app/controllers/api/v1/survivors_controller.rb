module Api
  module V1
    class SurvivorsController < ApiController
     before_action :set_survivor, only: [:show, :update]

     # GET /api/v1/survivors
     def index
       @survivors = Survivor.where(infected: false)
       render json: @survivors
     end

     # GET /api/v1/survivors/1
     def show
       render json: @survivor
     end

     # POST /api/v1/survivors
     def create
       @Inventory = Inventory.new
       @Inventory.save
       @survivor = Survivor.new(survivor_params.merge(inventory_id: @Inventory.id))

       if @survivor.save
         render json: @survivor, status: :created
         # redirect_to api_v1_inventories_url(@survivor.inventory_id)
       else
         render json: @survivor.errors, status: :unprocessable_entity
       end
     end

     # PATCH/PUT /api/v1/survivors/1

     def update
       if @survivor.update(survivor_params_update)
         render json: @survivor
       else
         render json: @survivor.errors, status: :unprocessable_entity
       end
     end

     # DELETE /api/v1/survivors/1
     # def destroy
     #   @survivor.destroy
     # end

     private
       # Use callbacks to share common setup or constraints between actions.
       def set_survivor
         @survivor = Survivor.find(params[:id])
       end

       # Only allow a trusted parameter "white list" through.
       def survivor_params
         params.require(:survivor).permit(:name, :age, :gender, :infected, :latitude, :longitude, :inventary_id)
       end

       def survivor_params_update
         params.require(:survivor).permit(:latitude, :longitude, :infected)
       end
     end
   end
end
