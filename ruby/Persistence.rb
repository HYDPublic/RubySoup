module Persistence

  def load sFileName
    puts "load code to read #{sFileName} contents into my_data"
  end

  def save sFileName
    puts "Uber code to persist #{@my_data} to #{sFileName}"
  end
  
end