class ToursController < ApplicationController

    def index
        @tours = Tour.all
    
        render json: @tours
    end

    def show
        @tour = Tour.find_by_id(params[:id])
        render json: @tour
    end

    def create
        @tour = Tour.new(tour_params)
    
        if @tour.save
          render json: @tour, status: :created, location: @tour
        else
          render json: @tour.errors, status: :unprocessable_entity
        end
    end

    def update
        @tour = Tour.find(params[:id])
        if @tour.update(tour_params)
          render json: @tour
        else
          render json: @tour.errors, status: :unprocessable_entity
        end
    end
    
    def destroy
        @tour = Tour.find(params[:id])
        @tour.destroy
    end
    
    private
       
    def set_tour
        @tour = Tour.find(params[:id])
    end
    
    def tour_params
        params.require(:tour).permit(:name, :duration, :location, :image, :cost, :description)
    end
end
