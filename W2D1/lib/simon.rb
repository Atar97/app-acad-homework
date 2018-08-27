require 'byebug'
require 'colorize'
require 'colorized_string'

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
    @challenge = false
  end

  def play
    start_game
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def start_game
    system('clear')
    print_instructions
    print "Would you like to try challenge mode (y/n)?"
    @challenge = gets.chomp == 'y'
    puts "Memorize the word, not the color!" if @challenge
    puts "Ready".colorize(:red)
    sleep(0.5)
    puts "Set".colorize(:yellow)
    sleep(0.5)
    puts "GO!!!!".colorize(:green)
    sleep(1)
    system("clear")
    sleep(1)
  end

  def print_instructions
    puts "Welcome the Simon Memory Game".colorize(:orange)
    colored_colors = COLORS.map do |color|
      color.colorize(color.to_sym)
    end
    puts "Colors will appear on the screen and you must memorize the sequence " \
    "then repeat it back to the computer."
    print "The colors are : "
    colored_colors.each {|el| print el + " "}
    sleep(6)
    system('clear')
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      print "Color: ".colorize(:white)
      sleep(0.5)
      if @challenge
        puts color.colorize(COLORS.sample.to_sym)
      else
        puts color.colorize(color.to_sym)
      end
      sleep(1)
      system('clear')
    end
  end

  def require_sequence
    print "Enter color 1: "
    for i in (0...@sequence_length)
      input = gets.chomp
      if input == @seq[i]
        puts "Nice!"
        print "Next color: "
      else
        @game_over = true
        return
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "You completed round #{@sequence_length}!"
    sleep(2)
    system("clear")

  end

  def game_over_message
    puts "YOU FAILED".colorize(:red)
  end

  def reset_game
    @game_over = false
    @sequence_length = 1
    @seq = []
  end
end

game = Simon.new
game.play
