class Admin::TopController < ApplicationController

  before_action :basic_auth    
  protect_from_forgery with: :exception

  def index
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == "hoge" && password == "hoge"
    end
  end
  
end