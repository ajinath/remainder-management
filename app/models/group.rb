class Group < ActiveRecord::Base
  belongs_to :user
  
  INTERVAL = [30, 60, 90, 120]

  def active_members
    user.members.where('id in (?)', members)
  end

  def option_members
    user.members.map {|member| [member.name, member.id] }
  end

  def selected_members
    active_members.map { |member| member.id }
  end

  def option_templates
    user.templates.map {|template| [template.name, template.id] }
  end

  def template
    Template.find_by(id: template_id)
  end

  def send_messages
    
  end
end
