require_relative "room"

class Hotel
    attr_reader :rooms
  
    def initialize (name,hash)
        @name = name
        @rooms = Hash.new{|h,key| h[key] = 0}
      hash.each { |k, v| @rooms[k] = Room.new(hash[k]) }
    end

    def name
        @name.split(" ").map(&:capitalize).join(" ")
    end

    def room_exists?(str)
      @rooms.include?(str)
    end

    def check_in(person,rm)
      if room_exists?(rm)
            if  @rooms[rm].add_occupant(person)   
                 return puts "check in successful"
            else
                  return puts "sorry, room is full"
            end
        else puts "sorry, room does not exist"
      end
    end

    def has_vacancy?
       @rooms.each { |k,v| return true if !v.full?}
       return false
      
    end
    
    def list_rooms
      @rooms.each_key do |k|
         puts "#{k} #{@rooms[k].available_space}"
      end
    end
    
end

