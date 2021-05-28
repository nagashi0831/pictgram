class FavoritesController < ApplicationController
  before_action :topic_params
  
  def index
    @favorite_topics = current_user.favorite_topics
  end
  
  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id] #params[:topic_id]のデータ型はstring
    
    if !favorite.save #saveすることでparams[:topic_id]がintegerとして保存される
      redirect_to topics_path, danger: 'お気に入り登録に失敗しました'
    end
    
  end
  
  def destroy
    @favorite = Favorite.find_by(topic_id: params[:topic_id])
    @favorite.destroy
  end
  
  private
  
  def topic_params
    if params[:topic_id]
      @topic = Topic.find(params[:topic_id])
    end
  end
end