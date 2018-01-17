module Api
  module V1
    class SurvivorsController < ApiController
     before_action :set_survivor, only: [:show, :update, :destroy]

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

       @survivor = Survivor.new(survivor_params)
       if @survivor.save
         render json: @survivor, status: :created
       else
         render json: @survivor.errors, status: :unprocessable_entity
       end
     end

     # PATCH/PUT /api/v1/survivors/1

     def update
       if @survivor.update(survivor_params)
         render json: @survivor
       else
         render json: @survivor.errors, status: :unprocessable_entity
       end
     end

     # DELETE /api/v1/survivors/1
     def destroy
       @survivor.destroy
     end

     private
       # Use callbacks to share common setup or constraints between actions.
       def set_survivor
         @survivor = survivor.find(params[:id])
       end

       # Only allow a trusted parameter "white list" through.
       def survivor_params
         params.require(:survivor).permit(:name, :age, :gender, :infected, :latitude, :longitude, :inventary_id)
       end
     end
   end
end
