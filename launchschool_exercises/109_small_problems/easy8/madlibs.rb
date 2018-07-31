def prompt(msg)
  print "=> #{msg}"
end

prompt('Enter a noun: ')
noun = gets.chomp
prompt('Enter a verb: ')
verb = gets.chomp
prompt('Enter an adjective: ')
adj = gets.chomp
prompt('Enter an adverb: ')
adv = gets.chomp
prompt("Do you #{verb} your #{adj} #{noun} #{adv}? That's hilarious!")
