category_list = [
  "Politics",
  "Opinion",
  "Tech",
  "Science",
  "Health",
  "Sport",
  "Arts",
  "Books",
  "Style",
  "Food",
  "Travel",
  "Real Estate"
]

category_list.each do |name|
  Category.create( name: name )
end
