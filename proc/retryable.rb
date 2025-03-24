module Retryable

  def with_retry(max_attempts: 5, wait_time: 1, on_retry: nil, on_error: nil, on_success: nil)
  attempt = 1

  begin
    result = yield
  rescue => exception
    if attempt < max_attempts
      on_retry.call(attempt, exception)
      sleep(wait_time)
      attempt += 1
      retry
    else
      on_error.call(exception)
      raise
    end
  else
    on_success.call(result)
  end
end
end

require_relative 'retryable'

include Retryable

on_retry_proc = Proc.new { |attempt, exception| puts "Retry lần #{attempt} sau lỗi: #{exception.message}" }
on_error_proc = Proc.new { |exception| puts "Thất bại sau tất cả các lần thử! Lỗi: #{exception.message}" }
on_success_proc = Proc.new { |result| puts "Thành công! Kết quả: #{result}" }


result = with_retry(
  max_attempts: 3,
  wait_time: 1,
  on_retry: on_retry_proc,
  on_error: on_error_proc,
  on_success: on_success_proc
) do
  # Giả lập một API call không ổn định
  random = rand(10)
  if random < 7
    raise "Connection timeout"
  end
  "Dữ liệu từ API"
end

puts "Kết quả cuối cùng: #{result}"