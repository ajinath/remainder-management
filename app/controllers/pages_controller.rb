class PagesController < ApplicationController
  layout :resolve_layout
  before_action :authenticate_user!, only: [:home]

  def index
  end
  
  def home
  	# layout 'admin'
  end
  private 
  	def resolve_layout
  		action_name == "home" ? "admin" : "home"
  	end
end
