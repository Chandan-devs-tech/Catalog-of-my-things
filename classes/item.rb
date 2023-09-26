require 'securerandom'
require 'date'

class Item
  attr_accessor :genres, :authors, :labels, :source, :publish_date, :archived
  attr_reader :id

  def initialize(_source, publish_date, archived: false)
    @id = SecureRandom.uuid
    @genres = []
    @authors = []
    @labels = []
    @source = []
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    current = Time.now.year - Date.parse(@publish_date).year
    current > 10
  end

  def move_to_archive?
    @archived = true if can_be_archived?
  end
end
