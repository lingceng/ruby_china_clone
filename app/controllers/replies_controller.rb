class RepliesController < ApplicationController
  before_action :check_signin, only: [:create]

  def create
    @reply = Reply.new(reply_params)
    @reply.user_id = User.find_by(name: session[:username]).id

    respond_to do |format|
      if @reply.save
        format.html {
          redirect_to topic_url(@reply.topic, anchor: dom_id(@reply)),
            notice: 'Replied Successfully.'
        }
      else
        format.html { redirect_to @reply.topic, notice: 'Replied Failed.' }
      end
    end
  end

  private

  def reply_params
    params.permit(:content, :topic_id)
  end

  def check_signin
    redirect_to sign_in_path unless session[:username]
  end


end
