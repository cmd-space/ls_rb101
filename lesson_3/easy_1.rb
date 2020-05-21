# Q1
# 1
# 2
# 2
# 3
# Q2
# != is a logical check and should be used in logic checks
# !user_name is a not operator and would return the opposite of the truthiness
# ! after method usually indicates a mutation
# ? before is typically used in a logic check
# ? after something is indicative of a method that returns true or false
# !!user_name would take the truthiness and return either true or false
# Q3
# advice = 'Few things in life are as important as house training your pet dinosaur.'
# advice = advice.split.map {|word| word == 'important' ? 'urgent' : word}.join(' ')
# p advice
# advice.gsub!('important', 'urgent')
# p advice
# Q4
# numbers.delete_at(1) delete item at index 1
# numbers.delete(1) delete number 1 in array
# Q5
# p (10..100).include?(42)
# Q6
# famous_words = 'seven years ago...'
# p 'Four score and ' + famous_words
# p 'Four score and ' << famous_words
# Q7
# flintstones = ["Fred", "Wilma"]
# flintstones << ["Barney", "Betty"]
# flintstones << ["BamBam", "Pebbles"]
# flintstones.flatten!
# p flintstones
# Q8
# flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
# flintstones = flintstones.filter {|k| k == "Barney"}.to_a.flatten
# flintstones.assoc("Barney")
