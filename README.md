✍️ Remind is a Ruby gem that helps manage task reminders and send notifications via Slack.

⚙️ Hướng dẫn cài đặt:

*Gemfile: 
  gem 'tms-remind', '~> 0.1.2'
  
  gem "irb"
  
  gem "rake", "~> 13.0"
  
  gem 'dotenv', groups: %i[development test]
  
  gem 'whenever', require: false
  
  gem 'thor'
  
  gem 'tms_task_manager', '~> 0.1.6'
  
  gem 'logger', '~> 1.7'

-> bundle install

*Install: gem install tms-remind


📌 Hướng dẫn sử dụng:

╰$ remind                 
Commands:
  remind add_task INTERVAL COMMAND  # Add a task to the schedule
  remind create_schedule_file       # Create a schedule file
  remind help [COMMAND]             # Describe available commands or one specific command
  remind list_tasks                 # List all tasks
  remind remove_task COMMAND        # Remove a task from the schedule
  remind set_env                    # Set SLACK_WEBHOOK_URL in .env file
  remind update_cron                # Update cron job


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

✍️ TmsTaskManager provides an easy way to create, manage, and track tasks using a simple Ruby-based interface with database support.


⚙️ Hướng dẫn cài đặt:

*Gemfile: gem 'tms_task_manager', '~> 0.1.6'

*Install: gem install tms_task_manager


📌 Hướng dẫn sử dụng:

1) Thêm task:

  tms_task_manager create 'title' --desc 'description' --start 'DD-MM-YY' --end 'DD-MM-YY'

2) Lấy danh sách task:

  tms_task_manager list

3) Lấy task bằng id:

  tms_task_manager get (id)

4) Xóa task bằng id:

  tms_task_manager remove (id)

5) Xóa tất cả task:

  tms_task_manager delete_all

6) Cập nhật task:

  tms_task_manager update (id) --status 'completed'
