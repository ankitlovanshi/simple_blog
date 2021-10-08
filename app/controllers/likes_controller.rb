class LikesController < ApplicationController

  def create
    @like = Like.new(user_id: current_user.id, article_id: params[:article_id])

    if @like.save
      redirect_to root_path
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy

    redirect_to root_path
  end

  private

  def find_article
    @articles = Article.find(params[:article_id])
  end
end
