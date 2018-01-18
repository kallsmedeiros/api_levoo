module Api
  module V1
    class InventoriesController < ApiController
      before_action :set_inventory, only: [:show, :update]
      # before_action :set_inventory_exchange, only: [:exchange]

      # GET /api/v1/inventories
      # def index
      #    @inventories = []
      #    Inventory.all.each do |inventory|
      #      @inventories << inventory unless inventory.survivor.infected?
      #    end
      #    render json: @inventories
      # end

      def show
        if @inventory == nil
          render json: :infected if Inventory.find(params[:id]).survivor.infected?
        else
          render json: @inventory
        end
      end

      # POST /api/v1/inventories
      # def create
      #
      #   @inventory = Inventory.new(inventory_params)
      #   if @inventory.save
      #     render json: @inventory, status: :created
      #   else
      #     render json: @inventory.errors, status: :unprocessable_entity
      #   end
      # end

      # PATCH/PUT /api/v1/inventories/1
      def update
        if @inventory.created_at == @inventory.updated_at
          if @inventory.update(inventory_params)
            render json: @inventory
          else
            render json: @inventory.errors, status: :unprocessable_entity
          end
        else
          render json: @inventory.errors, status: :can_not_update
        end
      end

      # PATCH  /api/v1/inventories/1/exchange
      # def exchange
      #   p i1= inventory_params
      #   p i2= inventory_params_exchange
        # if @inventory.update(inventory_params)
        #   render json: @inventory
        # else
        #   render json: @inventory.errors, status: :unprocessable_entity
        # end
      # end

      # DELETE /api/v1/inventories/1
      # def destroy
      #   @inventory.destroy
      # end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_inventory
          @inventory = Inventory.find(params[:id]) unless Inventory.find(params[:id]).survivor.infected?
        end

        # Only allow a trusted parameter "white list" through.
        def inventory_params
          params.require(:inventory).permit(:hydration_liquid, :food, :medication, :ammunition)
        end

        # def inventory_params_exchange
        #  params.require(:inventory2).permit(:inventory_id2, :hydration_liquid2, :food2, :medication2, :ammunition2)
        # end

        # def set_inventory_exchange
        #   @inventory = Inventory.find(params[:id]) unless Inventory.find(params[:id]).survivor.infected?
        #   @inventory2 = Inventory.find(params[:inventory_id2]) unless Inventory.find(params[:inventory_id2]).survivor.infected?
        # end

      end
   end
end
