# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
require File.expand_path('../..//config/environment.rb', __FILE__)
# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#

every :day, :at => '04:30pm' do
  command "cd #{Rails.root} && whenever --update-crontab store" 
  rake "Schedule:sms" 
end

# Learn more: http://github.com/javan/whenever
