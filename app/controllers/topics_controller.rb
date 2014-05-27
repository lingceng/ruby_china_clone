class TopicsController < ApplicationController
  before_action :check_signin, only: [:new, :create]

  def index
    @topics = Topic.paginate(page: params[:page], per_page: 10)
  end

  def show
    @topic = Topic.find(params[:id])   
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_param)
    @topic.user_id = User.find_by(name: session[:username]).id

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
    
  end


  def preview
    @body = params[:body]

    respond_to do |format|
      format.json
    end
  end

  private
    def topic_param
      params.require(:topic).permit(:title, :node_id, :content)
    end


    def check_signin
      redirect_to sign_in_path unless session[:username]
    end
end
