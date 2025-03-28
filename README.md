# Remind

Remind is a Ruby gem that helps manage task reminders and send notifications via Slack.

## ⚙️ Installation Guide

### Add to your Gemfile:
```ruby
gem 'tms-remind', '~> 0.1.2'
gem 'irb'
gem 'rake', '~> 13.0'
gem 'dotenv', groups: %i[development test]
gem 'whenever', require: false
gem 'thor'
gem 'tms_task_manager', '~> 0.1.6'
gem 'logger', '~> 1.7'
```
Then run:
```sh
bundle install
```

### Install as a standalone gem:
```sh
gem install tms-remind
```

## 📌 Usage

### Available Commands
```sh
remind                 # Display available commands
remind add_task INTERVAL COMMAND  # Add a task to the schedule
remind create_schedule_file       # Create a schedule file
remind help [COMMAND]             # Describe available commands or one specific command
remind list_tasks                 # List all tasks
remind remove_task COMMAND        # Remove a task from the schedule
remind set_env                    # Set SLACK_WEBHOOK_URL in .env file
remind update_cron                # Update cron job
```

---

# TmsTaskManager

TmsTaskManager provides an easy way to create, manage, and track tasks using a simple Ruby-based interface with database support.

## ⚙️ Installation Guide

### Add to your Gemfile:
```ruby
gem 'tms_task_manager', '~> 0.1.6'
```
Then run:
```sh
bundle install
```

### Install as a standalone gem:
```sh
gem install tms_task_manager
```

## 📌 Usage

### Create a new task:
```sh
tms_task_manager create 'title' --desc 'description' --start 'DD-MM-YY' --end 'DD-MM-YY'
```

### List all tasks:
```sh
tms_task_manager list
```

### Get task by ID:
```sh
tms_task_manager get (id)
```

### Remove task by ID:
```sh
tms_task_manager remove (id)
```

### Delete all tasks:
```sh
tms_task_manager delete_all
```

### Update a task:
```sh
tms_task_manager update (id) --status 'completed'
```

---

## 📢 Contributing
We welcome contributions! Feel free to open issues or submit pull requests.

## 📝 License
This project is licensed under the MIT License.

