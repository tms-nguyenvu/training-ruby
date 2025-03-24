require 'pry'
class FormBuilder

  def initialize
    @fields = []
  end
  
  def text_field(name, options = {})
    @fields << build_input('text', name, options)
  end

  def password_field(name, options = {})
    @fields << build_input('password', name, options)
  end

  def email_field(name, options = {})
    @fields << build_input('email', name, options)
  end

  def submit_button(value, options = {})
    @fields << build_input('submit', value, options)
  end

  def render
    "<form>\n" + @fields.join("\n") + "\n</form>"
  end

  private
  def build_input(type, name, options)
    "<input type='#{type}' name='#{name}' #{build_options(options)}>"
  end

  def build_options(options)
    options.map { |key, value| "#{key}='#{value}'" }.join(' ')
  end
end
# Test
form = FormBuilder.new
form.text_field(:name, placeholder: "Nhập tên")
form.password_field(:password, placeholder: "Nhập mật khẩu")
form.email_field(:email, placeholder: "Nhập email")
form.submit_button("Đăng ký", class: "btn-primary")

puts form.render

