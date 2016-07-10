class WelcomeController < ApplicationController
	def index
  	@latest = Post.last(5)
  	redirect_to posts_path
  end
end
