require_relative "./base-decorator"
require_relative "./person"
require_relative "./capitalize-decorator"

class TrimmerDecorator < Decorator
  def initialize(nameable)
    super(nameable)
    @nameable = nameable
  end

  def correct_name
    trimmed_name = @nameable.correct_name
    trimmed_name = trimmed_name.slice(0, 10) if trimmed_name.length > 10
    trimmed_name
  end
end

person = Person.new(22, 'maximilianus')

puts person.correct_name

capitalizedPerson = CapitalizeDecorator.new(person)

puts capitalizedPerson.correct_name

capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
  
puts capitalizedTrimmedPerson.correct_name