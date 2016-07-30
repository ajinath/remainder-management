desc "This task is called by the Heroku scheduler add-on"

task :send_reminders => :production do
  puts "Updating feed..."
  Group.todays_send_messages
  Member.first.send_message 0
  puts "done."
end