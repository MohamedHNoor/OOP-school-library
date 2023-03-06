require_relative './person.rb'

class Student < person
  def initialize(age, classroom, name: "Unknown", parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

end