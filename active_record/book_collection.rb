module ActiveRecord
  module Query
    def self.included(base)
      base.extend(ClassMethods)
      base.include(InstanceMethods)
    end

    module ClassMethods
      attr_reader :records
      def records
        @records ||= []
      end

      def next_id
        @next_id ||= 1
      end

      def attribute(name)
        # def title
        #   @attributes[:title]
        # end
        define_method(name) do 
          @attributes[name]
        end

        # def title=(value)
        #   @attributes[:title] = value
        # end
        define_method("#{name}=") do |value|
          @attributes[name] = value
        end
      end

      def create(attributes = {})
        record = new
        record.instance_variable_set(:@attributes, attributes.merge(id: next_id))
        records << record
        @next_id += 1
        record
      end

      def find(id)
        @records.find { |record| record.id == id }
      end

      def first
        @records.first
      end

      def last
        @records.last
      end

      def where(conditions)
        @records.select do |record|
          conditions.all? { |key, value| record.send(key) == value }
        end
      end

      def pluck(column_name)
        @records.map { |record| record.send(column_name) }
      end

      def exists?(condition)
        @records.any? { |record| condition.all? { |key, value| record.send(key) == value } }
      end
    end

    module InstanceMethods
      def initialize
        @attributes = {}
      end

      def update(attributes = {})
        attributes.each do |key, value|
          self.send("#{key}=", value)
        end
      end

      def destroy
        self.class.records.delete(self)
      end
    end
  end
end

class BookCollection
  include ActiveRecord::Query

  attribute :title
  attribute :author
  attribute :id
end

book_collection = BookCollection.new
book_collection.title = "Ruby Basics"
book_collection.author = "John Doe"
puts book_collection.title

# p BookCollection.ancestors
# p BookCollection.singleton_class.ancestors


book_collection = BookCollection.create(title: "Ruby Basics", author: "John Doe")
puts book_collection.title

p BookCollection.find(1)
p BookCollection.where(title: "Ruby Basics")
p BookCollection.pluck(:title)
p BookCollection.exists?(title: "Ruby Basics")

p BookCollection.first
p BookCollection.last

book_collection = BookCollection.create(title: "Ruby Basics", author: "John Doe")
book_collection.update(title: "Ruby on Rails")
book_collection.destroy