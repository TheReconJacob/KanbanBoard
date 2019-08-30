require_relative "../lib/users.rb"
require_relative "../lib/tasks.rb"
require_relative "../lib/boards.rb"

board = Board.create(title: "To_do")
bob = User.create(name: "Bob")
bill = User.create(name: "Bill")
Task.create(board_id: board.id, user_id: bob.id, title: "jacob sort it", description: "remove inappropriate background")
Task.create(board_id: board.id, user_id: bill.id, title: "front end job", description: "sort out front end")
