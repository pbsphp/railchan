# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


# Create groups

boards_groups = BoardsGroup.create!([
  { name: "Main" },
  { name: "Long long group name" },
  { name: "IT" },
  { name: "Ur mom" },
  { name: "Another group" }
])


# Create boards and set random boards group

boards = ("c".."z").map do |board_name|
  group = boards_groups.sample
  Board.create!(name: board_name, title: "Empty", boards_group: group)
end


# Create /b/ and /a/

b = Board.create!(name: "b", title: "Random",
                  boards_group: BoardsGroup.find_by_name("Main"))

a = Board.create!(name: "a", title: "Railchan",
                  boards_group: BoardsGroup.find_by_name("Main"))
