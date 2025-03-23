module SimpleRecord 
  module Query
    def self.included(base)
      base.extend(ClassMethods)
      base.include InstanceMethods
    end

    module ClassMethods 
        # @records = [] # class instance variable
        # @next_id = 1  # class instance variable
      def records
        @records ||= []
      end

      def next_id
        @next_id ||= 1
      end


      # define attribute
      def attribute(name)
        # define getter
        define_method(name) do
          @attributes[name] # meta programming
        end

        # define setter
        define_method("#{name}=") do |value|
          @attributes[name] = value # meta programming
        end
      end

      # create record
      def create(attributes = {})
        record = new
        record.instance_variable_set(:@attributes, attributes.merge(id: next_id))
        records << record
        @next_id += 1
        record
      end

      # get all records
      def all
        @records
      end

      # get record by id
      def find(id)
        @records.find { |record| record.id == id }
      end
      

      # get record by conditions
      def where(conditions)
        @records.select do |record|
          conditions.all? { |key, value| record.send(key) == value }
        end
      end

      # get first record
      def first
        @records.first
      end

      # get last record
      def last
        @records.last
      end

      def count
        @records.size
      end

      def exists?(condition)
        @records.any? { |record| condition.all? { |key, value| record.send(key) == value } }
      end

      def pluck(column_name)
        @records.map { |record| record.send(column_name) }
      end
    end

    module InstanceMethods
      def initialize
        @attributes = {}
      end

      def inspect
        attr_values = @attributes.map { |key, value| "#{key}: #{value}" }.join(", ")
        "#<#{self.class} #{attr_values}>"
      end

      # delete record
      def destroy
        self.class.records.delete(self)
      end

      def update(attributes = {})
        attributes.each do |key, value|
          self.send("#{key}=", value)
        end
      end
      
    end
  end
end

class User
  include SimpleRecord::Query

  attribute :name
  attribute :age
  attribute :id
end

# Tạo user
user1 = User.create(name: "Alice", age: 25)
user2 = User.create(name: "Bob", age: 30)

user = User.find(2)
user.update(name: "Johnny", age: 25)
p user

puts User.count 

puts User.exists?(name: "Jane")  # => false
puts User.exists?(name: "Alice") # => true

puts User.pluck(:name)  # => ["Alice", "Johnny"]


# user2 = User.create(name: "Bob", age: 30)

# Lấy danh sách users
# p User.all  

# Tìm user theo ID
# p User.find(1)

# p User.first


# Lọc theo điều kiện
# p User.where(name: "Alice")  


# Xóa user
# user1.destroy



class Product

  include SimpleRecord::Query

  attribute :id
  attribute :name
  attribute :price
  attribute :stock
end


Product.create(name: "Laptop", price: 1200, stock: 5)
Product.create(name: "Phone", price: 800, stock: 10)
Product.create(name: "Tablet", price: 600, stock: 7)

puts Product.all.inspect
puts Product.where(price: 800).inspect
puts Product.first.inspect
puts Product.last.inspect