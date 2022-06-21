class GuessingGame
   attr_reader :num_attempts 
 def initialize(min,max)
    @min = min
    @max = max
     unless max > min
    raise ArgumentError.new "Max number must be greater than min!! Try something bigger"
  end
    @secret_num = rand(min..max)
    @num_attempts = 0
    @game_over = false
 end
  
    def game_over?
        @game_over
    end

    def check_num(n)
        @num_attempts +=1
        @game_over = true if n == @secret_num
        puts "you win" if @game_over == true
        if n > @secret_num 
             puts "too big" 
             else
                puts "too small"
             end
    end
    
    def ask_user
        print "enter a number"
        number = gets.chomp.to_i
        check_num(number)
    end
end
