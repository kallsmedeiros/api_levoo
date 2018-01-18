module Api
  module V1
    class ReportController < ApiController

      # GET /api/v1/report
      def index
        hydration_liquid = 0
        food = 0
        medication = 0
        ammunition = 0
        infected_unusable = 0
        survivor_all = Survivor.where(infected: false).count
        Inventory.all.each do |i|
          if i.survivor.infected?
            infected_unusable += i.hydration_liquid*4 unless i.hydration_liquid.nil?
            infected_unusable += i.food*3 unless i.food.nil?
            infected_unusable += i.medication*2 unless i.medication.nil?
            infected_unusable += i.ammunition*1 unless i.ammunition.nil?
          else
            hydration_liquid += i.hydration_liquid*4 unless i.hydration_liquid.nil?
            food += i.food*3 unless i.food.nil?
            medication += i.medication*2 unless i.medication.nil?
            ammunition += i.ammunition*1 unless i.ammunition.nil?
          end
        end

         @report =  [ ["infected", Survivor.where(infected: true).count],
                      ["survivor", Survivor.where(infected: false).count],
                      ["inventory",
                        ["all",
                          ["hydration_liquid", hydration_liquid],
                          ["food", food],
                          ["medication", medication],
                          ["ammunition", ammunition]
                        ],
                        ["mean",
                          ["hydration_liquid", hydration_liquid/survivor_all],
                          ["food", food/survivor_all],
                          ["medication", medication/survivor_all],
                          ["ammunition", ammunition/survivor_all]
                        ],
                        ["infected_unusable(lost_points)", infected_unusable]
                      ],
                    ]
         render json: @report
      end

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
