module ActiveRecord
  def create(*args)
    @data.concat(args[0])
  end

  def all
    @data 
  end

  def find(args)
    filter_lambda = ->(item) { args.all? { |key, value| item[key] == value } }
    @data.select(&filter_lambda)
  end
  
end

class BookCollection

  include ActiveRecord
  def initialize(books = [])
    @data = books 
  end

end

collection = BookCollection.new([
  {title: "Ruby Programming", author: "Matz", genre: "Programming", year: 2008, price: 30, available: true, level: 0},
  {title: "Design Patterns", author: "Gang of Four", genre: "Programming", year: 1994, price: 45, available: false},
  {title: "Clean Code", author: "Robert Martin", genre: "Programming", year: 2008, price: 40, available: true},
  {title: "Harry Potter", author: "J.K. Rowling", genre: "Fantasy", year: 1997, price: 25, available: true}
])
# collection.create([
#   {title: "Ruby Programming", author: "Matz", genre: "Programming", year: 2008, price: 30, available: true},
#   {title: "Design Patterns", author: "Gang of Four", genre: "Programming", year: 1994, price: 45, available: false},
#   {title: "Clean Code", author: "Robert Martin", genre: "Programming", year: 2008, price: 40, available: true},
#   {title: "Harry Potter", author: "J.K. Rowling", genre: "Fantasy", year: 1997, price: 25, available: true}
# ])

# puts collection.all.inspect
# puts collection.find(title: "Ruby Programming").inspect
# puts collection.find(author: "Gang of Four").inspect
puts collection.find(genre: "Programming", year: 1994).inspect
# puts collection.find(year: 2008).inspect
# puts collection.find(price: 40).inspect
# puts collection.find(available: true).inspect