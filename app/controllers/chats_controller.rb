require "net/http"

class ChatsController < ApplicationController
  def room
  end
  
  def new_message
    faye = URI.parse 'http://localhost:9292/faye'
    message = {:username => session[:username], :msg => params[:message]}.to_json
    Net::HTTP.post_form(faye, :message => {:channel => '/messages/public', :data => message}.to_json)
    render :nothing => true
  end
end
