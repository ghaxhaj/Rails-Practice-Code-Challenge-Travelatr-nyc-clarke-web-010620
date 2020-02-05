class DestinationsController < ApplicationController

    def index
        @destinations= Destination.all 
    end
    
    def show
        @destination = Destination.find(params[:id])
        @posts = @destination.posts  
        @most = @posts.sort_by{|post| post.created_at}.reverse.first(5)
        @like = @posts.sort_by{|post| post.likes}.last
    end 
    
    def new 
        @destination = Destination.new
    end
    
    def create
        @destination = Destination.create(destination_params)
        redirect_to destination_path(@destination.id)
    end
    
    def edit 
        @destination = Destination.find(params[:id])
    end
    
    def update 
        @destination = Destination.find(params[:id])
        @destination.update(destination_params)
        redirect_to destination_path(@destination.id)
    end
    
    def destroy
        @destination = Destination.find(params[:id])
        @destination.destroy
        redirect_to destinations_path
    end
    
    private 
    
    def destination_params
    params.require(:destination).permit(:name, :country)
    end
    
    end