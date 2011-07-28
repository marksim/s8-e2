module SpaceTruckin
  class Helper
    def self.menu(title, *values)
      input = nil
      values = values.flatten
      until input.to_i > 0 and input.to_i <= values.length
        puts title
        puts "------------------------------------"
        i = 1
        values.each do |value|
          puts "#{i}) #{value}"
          i+=1
        end
        puts ""
        puts "^C) Exit Game"
        puts "------------------------------------"
        print "> "
        input = gets
      end
      values[(input.to_i)-1]
    end
  end
end