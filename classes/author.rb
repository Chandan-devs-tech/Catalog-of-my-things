require 'securerandom'

class Author
  attr_accessor :first_name, :last_name, :items
  attr_reader :id

  def initialize(first_name, last_name)
    @id = SecureRandom.uuid
    @first_name = first_name
    @last_name = last_name
    @items = []
  end
end
