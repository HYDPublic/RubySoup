module MetaFoo
  class << Object
    def bar
	  puts "@MetaFoo.bar;"
      puts caller.first # <== the magic...
      # puts caller.[1] # <== the magic... 
    end
  end
end