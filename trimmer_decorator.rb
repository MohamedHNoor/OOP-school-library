require_relative './base_decorator'
require_relative './person'
require_relative './capitalize_decorator'

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

capitalized_person = CapitalizeDecorator.new(person)

puts capitalized_person.correct_name

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)

puts capitalized_trimmed_person.correct_name
