class PostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @post = current_user.posts.build(post_params)
    if @post.save 
      flash[:success] = "Post created!"
      redirect_to root_path
    else
      @feed_items = []
      render "static_pages/index"
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path    
  end


    
    private 

    def post_params
      params.require(:post).permit(:content)      
    end

    def correct_user
      @post = current_user.post.find_by(id: params[:id])
      redirect_to root_path if @post.nil?
    end
end