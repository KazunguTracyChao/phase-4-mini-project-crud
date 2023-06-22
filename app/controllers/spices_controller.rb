class SpicesController < ApplicationController
    wrap_parameters format:[]
    # rescue_with ApplicationRecord::RecordNotFound, with: :render_not_found_response


    def index
        spices = Spice.all
        render json: spices, except: [:created_at, :updated_at]
      end
    
      # def show
      #   spice = find_spice
      #   render json: spice, except: [:created_at, :updated_at], status: :ok
      # end
    
      def create
        spice = Spice.create(spice_params)
        render json: spice, except: [:created_at, :updated_at], status: :created
      end
    
      def update
        spice = find_spice
        spice.update(spice_params)
        render json: spice, except: [:created_at, :updated_at]
      end
    
      def destroy
        spice = find_spice
        spice.destroy
        head :no_content
      end
    
      private
      def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
      end
    
      def find_spice
        Spice.find(params[:id])
      end
    
      def render_not_found_response
        render json: { error: "spice not found" }, status: :not_found
      end
    
    end