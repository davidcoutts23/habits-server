# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def create
        @user = User.new(user_params)
        if @user.save
          user_json = UserBlueprint.render_as_json User.find(@user.id)
          render json: user_json, status: :created
        else
          user_json = @user.errors
          render json: user_json, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
