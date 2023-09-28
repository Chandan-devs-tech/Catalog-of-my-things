require_relative 'classes/game'
require_relative 'classes/author'
require 'json'

class App
  attr_accessor :games, :authors

  def initialize
    @games = []
    @authors = []
  end

  def ask_multiplayer
    print 'Is the game multiplayer [Y/N] : '
    loop do
      input = gets.chomp.downcase
      case input
      when 'y'
        return true
      when 'n'
        return false
      else
        print "Please enter a valid input 'Y' or 'N': "
      end
    end
  end

  def add_author
    puts 'Please add an Author'
    print "Write the Author's first name : "
    first_name = gets.chomp
    print "Write the Author's last name : "
    last_time = gets.chomp
    author = Author.new(first_name, last_time)
    @authors << author
  end

  def add_game
    puts 'Please add a Game'
    print 'Write the publish date of your Game [yyyy/mm/dd] : '
    publish = gets.chomp
    multiplayer = ask_multiplayer
    print 'Last the Game was played [yyyy/mm/dd] : '
    last_time = gets.chomp
    game = Game.new(publish, multiplayer, last_time)
    @games << game
    add_author
    puts 'The Game is added sucessfully!'
  end

  def list_games
    puts 'No game added' if @games.empty?
    @games.each_with_index do |game, index|
      print "Game #{index + 1} - "
      print " Publish Date: #{game.publish_date}, "
      print " Multiplayer: #{game.multiplayer}, "
      print " Last played at: #{game.last_played_at}\n"
    end
  end

  def list_authors
    if @authors.empty?
      puts 'No author added'
    else
      @authors.each_with_index do |author, index|
        puts "Author #{index + 1} - Fullname : #{author.first_name} #{author.last_name}"
      end
    end
  end

  def save_data
    save_games
    save_authors
  end

  def load_data
    load_games
    load_authors
  end

  def save_games
    File.open('data/game.json', 'w') do |file|
      data = @games.map do |game|
        {
          'publish_date' => game.publish_date,
          'multiplayer' => game.multiplayer,
          'last_played_at' => game.last_played_at
        }
      end
      file.write(JSON.generate(data))
    end
  end

  def load_games
    if File.exist?('data/game.json')
      data = JSON.parse(File.read('data/game.json'))
      @games = data.map { |game| Game.new(game['publish_date'], game['multiplayer'], game['last_played_at']) }
    else
      []
    end
  end

  def save_authors
    File.open('data/author.json', 'w') do |file|
      data = @authors.map do |author|
        {
          'first_name' => author.first_name,
          'last_name' => author.last_name
        }
      end
      file.write(JSON.generate(data))
    end
  end

  def load_authors
    if File.exist?('data/author.json')
      data = JSON.parse(File.read('data/author.json'))
      @authors = data.map { |author| Author.new(author['first_name'], author['last_name']) }
    else
      []
    end
  end
end
