# frozen_string_literal: true

require 'thor'
require 'pry'
require_relative '../configs/database'
require_relative '../services/task'
require_relative '../services/task_list'
module TmsTaskManager
  module Cli
    class Command < Thor
      desc "create task --desc 'Mô tả' --start 'YYYY-MM-DD' --end 'YYYY-MM-DD' --status 'pending'", 'Thêm task'
      option :desc, required: true, type: :string
      option :start, required: true, type: :string
      option :end, required: true, type: :string
      option :status, required: false, type: :string, default: 'pending'

      def create(title)
        Configs::Database.setup
        TmsTaskManager::Services::TaskList.create(
          title, options[:desc], options[:start], options[:end], options[:status]
        )
      end

      desc 'list', 'Danh sách task'
      def list
        TmsTaskManager::Services::TaskList.list
      end

      desc 'remove id', 'Xoa task'
      def remove(id)
        TmsTaskManager::Services::TaskList.remove(id)
      end

      desc "update id --status 'in_progress'", 'Cập nhật trạng thái task'
      option :status, required: true, type: :string
      def update(id)
        TmsTaskManager::Services::Task.update_status(id, options[:status])
      end

      desc 'delete_all', 'Xóa tất cả task'
      def delete_all
        TmsTaskManager::Services::TaskList.delete_all
      end

      desc 'get id', 'Lấy task'
      def get(id)
        TmsTaskManager::Services::TaskList.get(id)
      end
    end
  end
end
