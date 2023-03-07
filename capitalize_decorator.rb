require_relative './base_decorator'
require_relative './person'

class CapitalizeDecorator < Decorator
  def initialize(nameable)
    super
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name.upcase
  end
end
