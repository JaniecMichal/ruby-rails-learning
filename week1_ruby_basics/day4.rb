# block notation in Ruby
3.times do |i|
  puts i
end

3.times { |i| puts i }

def with_logging
  puts "Start"
  yield
  puts "End"
end

with_logging do 
  puts "Inside block"
end

def repeat(n)
  n.times do |i|
    yield(i)
  end
end

repeat(3) do |i|
  puts "Iteration #{i}"
end

def maybe_call
  return unless block_given?
  yield
end

maybe_call do
  puts "Block was given!"
end

maybe_call # no block given

say_hello = Proc.new { |name| puts "Hello #{name}" }
say_hello.call("Michał")

greet = ->(name) { "Hello, #{name}!" }
puts greet.call("Marcin")

greet_two_args = ->(name, surname) { "Hello, #{name} #{surname}!" }
#puts greet_two_args.call("Marcin") # missing argument will raise an error
puts greet_two_args.call("Marcin", "Kowalski")

def time_it
  start = Time.now
  yield
  Time.now - start
end

puts time_it {sleep 1}

def run_twice(proc)
  proc.call
  proc.call
end

tasks = ["Learn Ruby", "Go Running", "Read a book"]
p tasks.map(&:to_s)

class Task
  attr_accessor :title, :completed

  def initialize(title)
    @title = title
    @completed = false
  end

  def complete!
    @completed = true
  end

  def incomplete!
    @completed = false
  end

  def completed?
    @completed
  end

  def to_s
    status = @completed ? "x" : " "
    "[#{status}] #{@title}"
  end
end

task_1 = Task.new("Learn Ruby")
task_2 = Task.new("Go Running")
task_3 = Task.new("Read a book")

def with_task_logging(task)
  puts "Starting task: #{task}"
  yield
  puts "Finished task: #{task}"
end

with_task_logging(task_1) do
  task_1.complete!
end

with_task_logging(task_2) do
  task_2.complete!
end

with_task_logging(task_3) do
  task_3.complete!
end

puts task_1
puts task_2
puts task_3