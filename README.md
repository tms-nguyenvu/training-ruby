Hướng dẫn sử dụng:

1) Thêm task:

  tms_task_manager create 'title' --desc 'description' --start 'DD-MM-YY' --end 'DD-MM-YY'

2) Lấy danh sách task:

  tms_task_manager list

3) Lấy task bằng id:

  tms_task_manager get (id)

4) Xóa task bằng id:

  tms_task_manager remove (id)

5) Xóa tất cả task:

  tms_task_manager delete_all

6) Cập nhật task:

  tms_task_manager update (id) --status 'completed'
