require 'thor'
require 'pry'
require_relative 'database'
require_relative 'task_list'
require_relative 'task'
module TmsTaskManager
  class CLI < Thor

    desc "create task --desc 'Mô tả' --start 'YYYY-MM-DD' --end 'YYYY-MM-DD' --status 'pending'", "Thêm task"
    option :desc, required: true, type: :string
    option :start, required: true, type: :string
    option :end, required: true, type: :string
    option :status, required: false, type: :string, default: "pending"

    def create(title)
      Database.setup
      TaskList.create(
        title, options[:desc], options[:start], options[:end], options[:status]
      )
    end

    desc "list", "Danh sách task"
    def list
      TaskList.list
    end

    desc "remove id", "Xoa task"
    def remove(id)
      TaskList.remove(id)
    end

    desc "update id --status 'in_progress'", "Cập nhật trạng thái task"
    option :status, required: true, type: :string
    def update(id)
      Task.update_status(id, options[:status])
    end

    desc "delete_all", "Xóa tất cả task"
    def delete_all
      TaskList.delete_all
    end

    desc "get id", "Lấy task"
    def get(id)
      TaskList.get(id)
    end
  end
end