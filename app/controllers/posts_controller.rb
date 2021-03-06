class PostsController < ApplicationController
	def new
	end



	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
  		@post = Post.find(params[:id])
 
  		if @post.update(params[:post].permit(:title, :body))
    		redirect_to @post
  		else
    		render 'edit'
  		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

	def admin
		@posts = Post.all
	end

	def create
		@post = Post.new(post_params)

		@post.save
		redirect_to @post
	end

	private
		def post_params
			params.require(:post).permit(:title, :body)
		end
	

end
