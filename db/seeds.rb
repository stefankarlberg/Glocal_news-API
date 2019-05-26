category_list = [
  [ "Politics" ],
  [ "Opinion" ],
  [ "Tech" ],
  [ "Science" ],
  [ "Health" ],
  [ "Sport" ],
  [ "Arts" ],
  [ "Books" ],
  [ "Style" ],
  [ "Food" ],
  [ "Travel" ],
  [ "Real State" ]
]

category_list.each do |name|
  Category.create( name: name )
end
