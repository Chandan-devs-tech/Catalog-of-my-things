require 'securerandom'

class author
    def initialize(first_name, last_name)
        @id = SecureRandom.uuid
        @first_name = first_name
        @last_name = last_name
        @items = []
    end
end