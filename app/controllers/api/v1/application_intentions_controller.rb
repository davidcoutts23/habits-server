# frozen_string_literal: true

module Api
  module V1
    class ApplicationIntentionsController < ApplicationController
      before_action :authenticate_request!

      # Post /application_intentions
      def create
        @application_intention = ApplicationIntention.new(application_intention_params)
        if @application_intention.save
          application_intention_json = ApplicationIntentionBlueprint.render_as_json ApplicationIntention.find(@application_intention.id)
          render json: application_intention_json, status: :created
        else
          application_intention_json = @application_intention.errors
          render json: application_intention_json, status: :unprocessable_entity
        end
      end

      # Put /application_intentions/id
      def update
        get_application_intention.update(
          behaviour:application_intention_params[:behaviour],
          time:application_intention_params[:time],
          location:application_intention_params[:location]
        )
        application_intention_json = ApplicationIntentionBlueprint.render_as_json get_application_intention
        render json: application_intention_json, status: :ok
      end

      def destroy
        get_application_intention.destroy
      end
        
      private

      def application_intention_params
        params.permit(:behaviour, :time, :location, :habit_id)
      end

      def get_application_intention
       @application_intention = ApplicationIntention.find(params[:id])
     end
    end
  end
end
