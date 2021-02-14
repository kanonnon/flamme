class FavoritesController < ApplicationController
  
  def create
    post = Post.find(params[:post_id])
    p post
    current_user.favorite(post)
    post.likes += 1
    post.save
    flash[:success] = "いいねしました"
    redirect_to post
  end
  
  def destroy
    post = Post.find(params[:post_id])
    current_user.unfavorite(post)
    post.likes -= 1
    post.save
    flash[:success] = "いいねを取り消しました"
    redirect_to post
  end
end
