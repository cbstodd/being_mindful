class PostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy


  def index
    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: 201, acl: :public_read)
    @search = Post.search do
      fulltext params[:search]
      redirect_to root_path
    end
    @post = @search.results
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save 
      flash[:success] = "Post created!"
      redirect_to root_path
    else
      @feed_items = []
      flash[:warning] = "Your post is either too long or too short"
      render 'static_pages/index'
    end
  end

  def destroy
    @post.destroy
    @post.remove_image!
    @post.save
    flash[:info] = "Post has been deleted"
    redirect_to root_path    
  end


    
    private 

    def post_params
      params.require(:post).permit(:content, :image, :bootsy_image_gallery_id)      
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end