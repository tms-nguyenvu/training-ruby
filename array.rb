names = ["Hùng", "Hà", "Dân"]
puts names[2]                       
names[2] = "Nguyễn Văn Dân"        
puts names[2]                       


arr=[1, 1.2, "Abc"]
arr << 10  # thêm một phần tử cuối, có giá trị 10
arr.push(10) # thêm một phần tử cuối, có giá trị 10
arr.insert(0,100) # chèn vào vị trí đầu tiên phần tử có giá trị 100

arr2 = [1,2,"A", "B"]
a = arr2.pop                 # xóa phần tử cuối, đồng thời lưu lại vào a
b = arr2.delete_at(1)        # xóa phần tử chỉ số 1, đồng thời lưu lại vào b
puts arr2


arr = [1,3,5,7,9,11]
subarr = arr[1..4]
puts subarr.inspect


a = [1, 2, 3, 4]
b = [4, 5]

c = a + b
print c.inspect

a = [1,2,3]
puts (a * 3).inspect
# [1, 2, 3, 1, 2, 3, 1, 2, 3]


a = [2, 3, 7, 8]
b = [2, 7, 9]

print a & b
# [2, 7]

a = [2, 3, 7, 8]
b = [2, 7, 9]

print a | b
# [2, 3, 7, 8, 9]


arr = [1, 2, 3]
puts arr.reverse.inspect


arr = [3,5,6,78]
for x in arr
  puts "Giá trị: #{x}"
end


a = [ "a", "b", "c" ]
a.each {
    |x|                 # định nghĩa biến lưu phần tử mảng khi duyệt qua
    print x, " -- "
}


a = [ "a", "b", "c" ]
a.each_index {
    |index|
    puts "phần tử #{index} có giá trị #{a[index]}"
}


a = [[1,2,3], [4,5,6]]
puts a[1][2]  