class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  attr_accessor :guesses, :word, :wrong_guesses
  
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end
  
  def new(word)
   @hangpersonGame = HangpersonGame.new(word)
  end
  
  def guess(letter)
    raise ArgumentError if letter.nil? || letter.empty? || letter =~ /[^A-Za-z]/
    letter = letter.downcase  
    if (@guesses.include?(letter)) || (@wrong_guesses.include?(letter))
      false 
    else
      if @word.include?(letter)
        @guesses.concat(letter)
        true
      else
        @wrong_guesses.concat(letter)
        true
      end
    end
  end
  
  def word_with_guesses
    (@guesses.empty?) ? ("-"*@word.size) : (@word.gsub(/[^#{@guesses}]/, "-")) 
   
  end
  
  def check_win_or_lose
    if  @word == self.word_with_guesses
      :win
    elsif @wrong_guesses.size == 7
      :lose
    else
      :play
    end
  end
  
 
   
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end
end