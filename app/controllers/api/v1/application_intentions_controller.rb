# frozen_string_literal: true

module Api
  module V1
    class ApplicationIntentionsController < ApplicationController
      before_action :authenticate_request!
      # Get /application_intentions
      def index
        application_intentions_json = ApplicationIntentionBlueprint.render_as_json ApplicationIntention.all
        render json: application_intentions_json
      end

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

      private

      def application_intention_params
        params.permit(:behaviour, :time, :location, :habit_id)
      end
    end
  end
end
