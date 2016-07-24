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

  def Group.todays_send_messages
    start_date = DateTime.now.beginning_of_day.in_time_zone
    end_date = DateTime.now.end_of_day.in_time_zone
    current_datetime = DateTime.now.in_time_zone
    groups = Group.where("renew_date between (?) and (?)", start_date, end_date )
    groups.each do |group|
      group.active_members.each do |member|
        elapsed_seconds = (group.renew_date - current_datetime).to_i
        elapsed_minutes = elapsed_seconds / 60
        member.send_message elapsed_minutes
      end
      group.update(renew_date: group.renew_date + group.interval.days
    end
  end
  
end
