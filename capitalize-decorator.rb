require_relative "./base-decorator"
require_relative "./person.rb"

class CapitalizeDecorator < Decorator
  def initialize(nameable)
    super
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name.upcase
  end
end