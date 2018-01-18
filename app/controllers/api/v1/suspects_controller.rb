module Api
  module V1
    class SuspectsController < ApiController
      before_action :set_suspect, only: [:show, :update]

      # GET /api/v1/suspects
      def index
         @suspects = []
         Suspect.all.each do |suspect|
           @suspects << suspect.survivor unless suspect.nil?
         end
         render json: @suspects
      end

      # GET /api/v1/suspects/1
      def show
        render json: @suspect.survivor
      end

      # POST /api/v1/suspects
      def create
        @suspect = Suspect.new(suspect_params)
        if @suspect.survivor.suspects.count >= 3
          @suspect.survivor.update(infected: true)
        end
        if @suspect.save
          render json: @suspect, status: :created
        else
          render json: @suspect.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/suspects/1
      # def update
      #   if @suspect.update(suspect_params)
      #     render json: @suspect
      #   else
      #     render json: @suspect.errors, status: :unprocessable_entity
      #   end
      # end

      # DELETE /api/v1/suspects/1
      # def destroy
      #   @suspect.destroy
      # end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_suspect
          @suspect = Suspect.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def suspect_params
          params.require(:suspect).permit(:survivor_id)
        end
     end
   end
end
