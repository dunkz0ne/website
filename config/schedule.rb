# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

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
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

every 5.minute do
  command "cd /home/cristian/Desktop/Dunkzone_2/website && bundle exec bin/rails runner -e development 'BannedUser.cleanup_expired_bans' >> /home/cristian/Desktop/Dunkzone_2/website/cron.log 2>&1"
end


# whenever --update-crontab  to update the crontab
