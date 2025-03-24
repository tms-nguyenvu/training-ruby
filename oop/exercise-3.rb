class MagicObject
  def method_missing(name, *args)
    puts "Bạn vừa gọi #{name}"
  end

  def respond_to_missing?(name, include_private = false)
    true  # Xử lý mọi method thông qua method_missing
  end
end

magic = MagicObject.new
magic.hello_world  # => "Bạn vừa gọi hello_world"
magic.some_method  # => "Bạn vừa gọi some_method"

puts magic.respond_to?(:hello_world)  # => true
puts magic.respond_to?(:some_method)  # => true
puts magic.respond_to?(:to_s)         # => true (do Ruby đã có sẵn method này)
