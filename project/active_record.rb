
require 'pry'
module ActiveRecord
  module Query
    def self.included(base)
      base.extend(ClassMethods)
      base.include(InstanceMethods)
      base.setup_db
    end

    module ClassMethods
      def setup_db
        @db = SQLite3::Database.new("student_management.db")
        @db.results_as_hash = true
      end

      def db
        @db
      end

      def table_name
        @table_name
      end

      def attribute(name)
        define_method(name) do
          @attributes[name]
        end

        define_method("#{name}=") do |value|
          @attributes[name] = value
        end
      end 

      def create(attributes = {})
        keys = attributes.keys.join(", ")
        values = attributes.values.map { |v| "'#{v}'" }.join(", ")

        db.execute <<~SQL
          INSERT INTO #{table_name} (#{keys}) VALUES (#{values});
        SQL
      end

      def all
        db.execute <<~SQL
          SELECT * FROM #{table_name};
        SQL
      end

      def find(id)
        row = db.get_first_row <<~SQL
          SELECT * FROM #{table_name} WHERE id = #{id} LIMIT 1;
        SQL

        record = new
        row.each { |key, value| record.instance_variable_set("@#{key}", value) }
        record
      end


    end

    module InstanceMethods
      def initialize
        @attributes = {}
      end

      def update(attributes = {})

        set_clause = attributes.map { |key, value| "#{key} = '#{value}'" }.join(", ")

        self.class.db.execute <<~SQL
          UPDATE #{self.class.table_name} SET #{set_clause} WHERE id = #{@id};
        SQL

        @attributes.merge!(attributes)
      end
    end
  end
end
