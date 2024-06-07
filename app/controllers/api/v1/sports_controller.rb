# app/controllers/api/v1/sports_controller.rb
module Api
  module V1
    class SportsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_sport, only: %i[show update destroy]

      def index
        @sports = Sport.all
        render json: @sports
      end

      def show
        render json: @sport
      end

      def create
        @sport = Sport.new(sport_params)
        if @sport.save
          render json: @sport, status: :created
        else
          render json: @sport.errors, status: :unprocessable_entity
        end
      end

      def update
        if @sport.update(sport_params)
          head :no_content
        else
          render json: @sport.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @sport.destroy
        head :no_content
      end

      private

      def set_sport
        @sport = Sport.find(params[:id])
      end

      def sport_params
        params.require(:sport).permit(:name)
      end
    end
  end
end
