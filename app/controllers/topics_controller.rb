class TopicsController < ApplicationController
  def index
    #includesは元々allの役割もついているのでTopic.includes(~)でも良い
    @topics = Topic.all.includes(:favorite_users)
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = current_user.topics.new(topic_params)
    
    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
    
    private
    def topic_params
      #requireとは
      params.require(:topic).permit(:image, :description)
    end
end
