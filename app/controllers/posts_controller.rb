class PostsController < ApplicationController

	include PostsHelper
	before_action :latest_posts

	def index
		@posts = Post.all
	end


	def show
		@post = Post.find_by_id params[:id]
	end


	def new
		if login?
			@post = Post.new
			render 'new'
		else
			redirect_to root_path
		end
	end

	def edit
		@post = Post.find_by_id params[:id]
		render 'edit'
	end


	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id if current_user

		if @post.save
  		redirect_to @post
  	else
  		render 'new'
  	end

	end

	def update
		@post = Post.find_by_id params[:id]

		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find_by_id params[:id]
		@post.destroy

		redirect_to current_user
	end


	private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def latest_posts
  	@latest = Post.last(5).reverse
  end

end
