class PagesController < ApplicationController
  layout :resolve_layout
  before_action :authenticate_user!, only: [:home]
  before_action :set_group, only: [:home]

  def index
  end
  
  def home
    # binding.pry
  	# layout 'admin'
  end

  def search
  end

  private 
  	def resolve_layout
  		action_name == "home" ? "admin" : "home"
  	end

    def set_group
      if params[:search].present?
        search = params[:search].split("-")
        start_date = search[0]
        end_date = search[1]                                                                                                    
        @groups = current_user.groups.where("last_send between (?) AND (?)", start_date, end_date )
      else
        @groups = current_user.groups
      end
    end
end
