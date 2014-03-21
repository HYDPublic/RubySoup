puts '---'
puts 'Print all modules (excluding classes)'
puts Module.constants.sort.select {|x| eval(x.to_s).instance_of? Module}

puts '---'
puts 'Print all classes (excluding exceptions)'
puts Module.constants.sort.select {|x|
  c = eval(x.to_s)
  c.is_a? Class and not c.ancestors.include? Exception
}

puts '---'
puts 'Print all exceptions'
puts Module.constants.sort.select {|x|
  c = eval(x.to_s)
  c.instance_of? Class and c.ancestors.include? Exception
}