require 'singleton'

class UserManager
  include Singleton

  def initialize
    @users = []
  end

  def add_user(name, email)
    @users << { name: name, email: email }
  end

  def list_users
    @users
  end

  def remove_user(email)
    @users.reject! { |user| user[:email] == email }
  end
end

# Test
manager = UserManager.instance
manager.add_user("Alice", "alice@example.com")
manager.add_user("Bob", "bob@example.com")
p manager.list_users

manager.remove_user("alice@example.com")
p manager.list_users
