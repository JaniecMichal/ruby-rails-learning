# Methods in Ruby

# Methods in ruby not need return statement, the last evaluated expression is returned by default.
def greet(name)
  "Hello, My name is #{name}."
end

puts greet("Michał")

# Methods can have default parameters
def greet_with_default(name = "Guest")
  "Hello, My name is #{name}."
end

puts greet_with_default
puts greet_with_default("Anna")

# keyword arguments
def create_task(title:, completed: false, priority: 1)
  {
    title: title,
    completed: completed,
    priority: priority
  }
end

task = create_task(title: "Learn Ruby", priority: 3)
p task
puts task

# Methods with not declared arguments count 

def sum_numbers(*numbers)
  numbers.sum
end

puts sum_numbers(1, 2, 3, 4, 5)

# some cases when rerturn is used in methods

def safe_div(a, b)
  return "Division by zero is not allowed." if b.zero?

  a / b
end

puts safe_div(10, 2)
puts safe_div(10, 0)

# Guard clauses
# instead this
def process(user)
  if user
    puts "User exists"
  end
end

# in ruby we do this
def process_with_guard(user)
  return unless user

  puts "User exists"
end

# exercises

def format_task(title, completed)
  "[#{completed ? 'x' : ' '}] #{title}"
end

# def format_task(title, completed)
#  "[#{completed ? 'x' : ' '}] #{title}"
# end

# def format_task(title, completed)
#  mark = completed ? "x" : " "
#  "[#{mark}] #{title}"
# end

puts format_task("Learn Ruby", true)
puts format_task("Go running", false)

def multiply(a:, b:) 
  a * b
end

puts multiply(a: 4, b: 5)

def info (name:, role: "developer")
  "Name: #{name}, Role: #{role}"
end

puts info(name: "Michał", role: "frontend developer")
puts info(name: "Macos Antonio")

def median(sorted)
  mid = sorted.length / 2
  sorted.length.odd? ? sorted[mid] : (sorted[mid - 1] + sorted[mid]) / 2.0
end

def stats (*numbers)
  sorted = numbers.sort
  {
    min: numbers.min,
    max: numbers.max,
    average: numbers.sum / numbers.length.to_f,
    sorted: sorted,
    mediana: median(sorted)
  }
end

puts stats(9, 3, 1, 3, 0, 5, 6, 100, 992)
puts stats(-2, 0, 4, 6, 8, 10)


