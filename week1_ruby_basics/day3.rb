"hello".class
5.class
[].class

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

task = Task.new("Buy groceries")
p task
puts task

task2 = Task.new("Do ruby exercises")
task2.complete!
puts task2

task3 = Task.new("Go to shopping mall")
task3.complete!
puts task3
task3.completed?
puts task3.completed?  # => true
task3.incomplete!
puts task3
task3.completed?
puts task3.completed?  # => false

class ToDoList
  def initialize
    @tasks = []
  end

  def add_task(task)
    @tasks << task
  end

  def all_tasks
    @tasks
  end

  def completed
    @tasks.select(&:completed?)
  end

  def pending
    @tasks.reject(&:completed?)
  end
end

todo_list_for_today = ToDoList.new

t1 = Task.new("Learn Ruby")
t2 = Task.new("Recovery workout (stretching and rolling)")

t2.complete!

todo_list_for_today.add_task(t1)
todo_list_for_today.add_task(t2)

puts "ALL tasks:"
todo_list_for_today.all_tasks.each { |task| puts task }

puts "COMPLETED tasks:"
todo_list_for_today.completed.each { |task| puts task }

puts "PENDING tasks:"
todo_list_for_today.pending.each { |task| puts task }