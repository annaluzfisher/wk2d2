class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

 attr_reader :guess_word, :attempted_chars , :remaining_incorrect_guesses

  def DICTIONARY
    Array
  end

  def self.random_word
      DICTIONARY.sample
  end

  def initialize
   @random_word = Hangman.random_word
   @secret_word = @random_word
   @guess_word = Array.new(@secret_word.length,"_")
   @attempted_chars = []
   @remaining_incorrect_guesses = 5
  end

  def already_attempted?(c)
    @attempted_chars.include?(c) ? true : false
  end
  
  def get_matching_indices(c)
      arr =[]
    @secret_word.each_char.with_index do |char ,i|
      if c == char 
       arr << i
       end
      end
  arr
  end
  
  def fill_indices(c,arr)
    @guess_word.each  do |ele|
      arr.each do |idx|
        @guess_word[idx] = c 
      end
    end
  end
  
  def try_guess(c)
    arr = get_matching_indices(c)
    fill_indices(c,arr)
   @remaining_incorrect_guesses -= 1 if arr.length == 0
    if already_attempted?(c)
      puts "that has already been attempted"
       return false
    else
      @attempted_chars << c 
      return true
    end
  end

  def ask_user_for_guess
    puts "Enter a char:"
    try = gets.chomp
    unless try.length == 1 && try.match?(/[a-z]/)
      raise ArgumentError.new "only a single, lowercase character is allowed"
      end 
      try_guess(try)
  end

  def win?
    if @guess_word.join("") != @secret_word
      return false
    elsif @guess_word.join("") == @secret_word
    puts "WIN"
    return true
    end
  end

 def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    else
      return false
    end
  end
  
  def game_over?
    if  self.lose? || self.win?
       puts @secret_word
        return true
    else
        return false
    end
  end

end