# Strings and interpolation

name = "Michał"
speciality = "Frontend Developer"
puts "Hello, My name is #{name}. I am a #{speciality}. I want to learn Ruby and Rails."

# Symbols
lerning_status = :pending
p lerning_status

# Arrays
numbers = [1, 2, 3, 4, 5]
p numbers

# Hashes (Symbols are commonly used as keys)
task = {
    title: "Learn Ruby",
    completed: false,
    current_status: lerning_status,
    priority: 3
}
p task[:title]

# iterators and loops?

# each iterator without array mutation
numbers.each do |n|
  puts n * 2
end

# map iterator which return new array with mutated values
doubled = numbers.map {|n| n * 2 }
p doubled

# select - filter array based on condition
even_numbers = numbers.select {|n| n.even? }
p even_numbers

next_task = {
    title: "Running workout",
    completed: false,
    current_status: :not_started,
    priority: 2
}

puts next_task[:title]
puts next_task[:current_status]
next_task[:current_status] = :in_progress
puts next_task

def only_not_even(numbers)
  numbers.select {|n| n.odd? }
end

p only_not_even([42,93,27,64,18,55,11,123,369])