class TopicsController < ApplicationController
  before_action :check_signin, only: [:new, :create]

  def index
    @topics = Topic.all   
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
        format.json { render action: 'show', status: :created, location: @topic }
      else
        format.html { render action: 'new' }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
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
