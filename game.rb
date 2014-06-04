# An implementation for a guessing game
# The game interface for the guessing game
class Game
  def initialize
    @q = Player.new
    @a = Player.new
    @round = nil
    @max = nil
    setup
    lets_play
  end # initialize

  def setup
    welcome
    set_max     # largest possible number
    set_guesser # is the guess from human or cpu
    set_round   # how many guesses
    @a.number = rand(1..100)
  end # setup

  def welcome
    puts '<---------Welcome to my guessing game--------->'
    puts 'The goal is to guess the correct number in as few guesses as possible'
  end # welcome

  def set_max
    puts 'What should the largest possible number be? '
    @max = gets.to_i
  end # set_range

  def set_guesser
    print "Would you like a computer to show you how it's done?('no' to play) "
    @q.type = (gets.chomp.downcase == 'no')
  end # set_guesser

  def set_round
    print 'How many guesses would you like? '
    @round = gets.to_i
  end # set_round

  def lets_play
    @low = 0
    @high = @max
    while @round > 0
      guess
      if @q.number == @a.number
        5.times { puts '!!!WINNER!!!' }
        break
      else
        compare(@q.number, @a.number)
      end # if
    end # while

    return if @q.number == @a.number

    unless @q.number == @a.number
      puts 'Too bad, you lost'
      puts 'It was obviously ' + @a.number.to_s
    end # if
  end # lets_play

  def guess
    if @q.type ==  true # true is human
      puts 'You have ' + @round.to_s + ' attempts left.'
      print 'Guess a number: '
      @q.number = (gets.to_i)
    else
      r = @q.number = ((@low + @high) / 2)
      puts r
      r
    end # if
  end # guess

  def compare(q, a)
    @round -= 1
    if q > a
      @high = q
      # these should both return false as well as print
      puts '---TOO-LARGE---TOO-LARGE---'
      # false
    else
      @low = q
      puts '---TOO-SMALL---TOO-SMALL---'
    end # if
  end # compare
end # class game

# I used Player objects to hold my values
class Player
  # type (getter)
  attr_reader :number, :type
  # self.type = VAR  (setter)
  attr_writer :number, :type

  def initialize
    @number = nil
    @type = nil
    self.type = nil
  end # initialize

  def s_rand(max)
    self.number = ((rand * max).to_i)
  end # self.numberrand(max)
end # class player

Game.new
