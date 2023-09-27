require_relative 'spec_helper'

describe Game do
  before :each do
    @game = Game.new('2000/10/25', true, '2020/08/13')
  end

  describe '#new' do
    it 'returns instance of the Game class' do
      expect(@game).to be_an_instance_of(Game)
    end
  end

  describe '#publish_date' do
    it 'return the date which game published at' do
      expect(@game.publish_date).to eq('2000/10/25')
    end
  end

  describe '#mulitplayer' do
    it 'returning true if the game is multiplayer' do
      expect(@game.multiplayer).to be_truthy
    end
  end

  describe '#last_played_at' do
    it 'return the date which game last_played_at' do
      expect(@game.last_played_at).to eq('2020/08/13')
    end
  end

  describe '#can_be_archived?' do
    it 'reyurn true if it is more than 10 years passed of it publishing otherwise false' do
      expect(@game.can_be_archived?).to be_truthy
      game2 = Game.new('2021/09/02', true, '2021/12/20')
      expect(game2.can_be_archived?).to be_falsy
    end
  end
end
