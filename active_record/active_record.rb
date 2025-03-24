require 'pry'
module ActiveModel
  module Query
    # Phương thức này được gọi khi module được include vào một class
    def self.included(base)
      base.extend(ClassMethods)        # Thêm các class methods
      base.class_eval do
        include InstanceMethods        # Thêm các instance methods
        @records = []                  # Khởi tạo array rỗng để lưu records
        @next_id = 1                  # ID tự động tăng, bắt đầu từ 1
      end
    end

    # Các phương thức ở cấp độ class (Class Methods)
    module ClassMethods
      attr_reader :records            # Cho phép đọc @records từ bên ngoài

      # Định nghĩa một thuộc tính cho model
      # Ví dụ: attribute :name sẽ tạo ra các methods name và name=
      def attribute(name)

        # Đây là kỷ thuật Meta Programming
        define_method(name) do
          @attributes[name]           # Getter: trả về giá trị của thuộc tính
        end

        # Đây là kỷ thuật Meta Programming
        define_method("#{name}=") do |value|
          @attributes[name] = value   # Setter: gán giá trị cho thuộc tính
        end
      end

      # Tạo một record mới và lưu vào mảng @records
      # Ví dụ: User.create(name: "John", age: 20)
      def create(attributes = {})
        record = new
        record.instance_variable_set(:@attributes, attributes.merge(id: @next_id))
        @records << record
        @next_id += 1
        record
      end

      # Trả về tất cả records
      # Ví dụ: User.all
      def all
        @records
      end

      # Tìm kiếm records theo điều kiện
      # Ví dụ: User.where(name: "John", age: 20)
      def where(conditions)
        @records.select do |record|
          conditions.all? { |key, value| record.send(key) == value }
        end
      end

      # Tìm record theo ID
      # Ví dụ: User.find(1)
      def find(id)
        @records.find { |record| record.id == id }
      end

      # Lấy record đầu tiên
      # Ví dụ: User.first
      def first
        @records.first
      end

      # Lấy record cuối cùng
      # Ví dụ: User.last
      def last
        @records.last
      end
    end

    # Các phương thức ở cấp độ instance (Instance Methods)
    module InstanceMethods
      def initialize
        @attributes = {}              # Khởi tạo hash rỗng để lưu các thuộc tính
      end

      # Xóa record hiện tại khỏi mảng @records
      # Ví dụ: user.destroy
      def destroy
        self.class.records.delete(self)
      end
    end
  end
end

# Demo sử dụng với class User
class User
  include ActiveModel::Query          # Include module để sử dụng các tính năng

  # Khai báo các thuộc tính của User
  attribute :id
  attribute :name
  attribute :age
  attribute :gender
end

# 1. Tạo records
User.create(name: "John", age: 20, gender: 1)
User.create(name: "Jane", age: 21, gender: 2)

# 2. Query
user = User.first                    # Lấy user đầu tiên

# Các operations khác có thể thử:
User.all                          # Lấy tất cả users
User.where(name: "Jane")          # Tìm users có tên "Jane"
User.find(2)                      # Tìm user có id = 2
user = User.last                  # Lấy user cuối cùng
puts user.name                    # In ra tên của user


# Demo sử dụng với class Post
class Post
  include ActiveModel::Query

  attribute :id
  attribute :title
  attribute :content
end

# 1. Tạo records
Post.create(title: "Post 1", content: "Content 1")
Post.create(title: "Post 2", content: "Content 2")

# 2. Query
post = Post.first
post.destroy