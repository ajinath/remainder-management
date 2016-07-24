class Member < ActiveRecord::Base
	require 'csv'
	belongs_to :user

	def self.import(file, user_id)
		begin
			CSV.foreach(file.path, headers: true) do |row|
				row = row.to_h
				member = Member.find_or_initialize_by(contact: row['contact'], user_id: user_id)
				member.name = row['name']
				member.save
			end
		rescue Exception => e
			false
		end
		true
	end

	def send_message elapsed_minutes
    begin
      request = Clickatellsend::Request.new
      message = request.send_msg(to: contact, text: "I don't know", deliv_time: elapsed_minutes)
      puts ".................. message send successfully ................"
      status = request.get_msg_status(:apimsgid => message["ID"])
    rescue Exception => e
      "Error occured ..."
    end
  end

  # def User.send_messages
  #   start_date = DateTime.now.beginning_of_day.in_time_zone
  #   end_date = DateTime.now.end_of_day.in_time_zone
  #   current_datetime = DateTime.now.in_time_zone
  #   users = User.where("renew_date between (?) and (?)", start_date, end_date )
  #   users.each do |user|
  #     scheduled_date = user.renew_date
  #     scheduled_interval = 1
  #     elapsed_seconds = (scheduled_date - current_datetime).to_i
  #     elapsed_minutes = elapsed_seconds / 60
  #     # binding.pry
  #     user.send_message elapsed_minutes
  #     user.update(renew_date: scheduled_date + scheduled_interval.days)
  #   end
  #   "message sent : #{users.count}"
  # end

end
