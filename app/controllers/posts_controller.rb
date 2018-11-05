class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  # @author = Author.new(author_params)
  # if @author.valid?
  #   @author.save
  #   redirect_to author_path(@author)
  # else
  #   render :new
  # end

  def update
    if Post.new(post_params).valid?
      @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
