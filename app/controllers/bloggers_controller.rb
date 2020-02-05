class BloggersController < ApplicationController

def index
    @bloggers = Blogger.all 
end

def show
    @blogger = Blogger.find(params[:id])
    @posts = @blogger.posts
    @likes = @posts.map{|post| post.likes}.sum
    @p = @posts.sort_by{|post| post.likes}.last
end 

def new 
    @blogger = Blogger.new
end

def create
    @blogger = Blogger.create(blogger_params)

    if @blogger.valid?
        redirect_to blogger_path(@blogger)
    else
        flash[:errors]= @blogger.errors.full_messages
        redirect_to new_blogger_path
end
end

def edit 
    @blogger = Blogger.find(params[:id])
end

def update 
    @blogger = Blogger.find(params[:id])
    @blogger.update(blogger_params)
    if @blogger.valid?
    redirect_to blogger_path(@blogger.id)
    else
    flash[:errors]= @blogger.errors.full_messages
    redirect_to edit_blogger_path
    end
end

def destroy
    @blogger = Blogger.find(params[:id])
    @blogger.destroy
    redirect_to bloggers_path
end


private 

def blogger_params
params.require(:blogger).permit(:name, :age, :bio)
end

end