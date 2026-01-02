# Ruby Basics — Day 3 Summary  
## Classes, Objects, State, and Domain Modeling

---

## 🎯 Goal of the Day
- Understand how classes and objects work in Ruby
- Learn how to model domain concepts using classes
- Use attribute accessors properly
- Encapsulate behavior and state inside objects
- Prepare foundations for Rails models

---

## 🧱 Classes vs Objects

- A **class** is a blueprint describing data and behavior.
- An **object** is an instance created from a class.
- Ruby is fully object-oriented — everything is an object.

```ruby
class Task
end

task = Task.new

🛠 Object Initialization (initialize)

initialize is called automatically when .new is invoked.

Used to set the initial state of an object.

class Task
  def initialize(title)
    @title = title
    @completed = false
  end
end


@title, @completed are instance variables

Instance variables belong to a specific object, not the class

🔑 Attribute Accessors

Ruby does not expose instance variables directly.

Common helpers:

attr_reader → generates getter

attr_writer → generates setter

attr_accessor → generates both

class Task
  attr_accessor :title, :completed
end


This generates:

task.title

task.title = "New title"

🔄 Instance Methods and Object State

Instance methods define behavior of an object

They can read and modify instance variables

class Task
  def complete!
    @completed = true
  end
end

! Convention

Methods ending with ! mutate object state or have side effects

It is a convention, not a language rule

Example pattern in Ruby:

sort → returns new array

sort! → mutates array in place

❓ Predicate Methods (?)

Methods ending with ? return boolean values

Used to express object state clearly

def completed?
  @completed
end


Very common in Ruby and Rails.

🧾 String Representation (to_s)

to_s defines how an object is represented as a string

Automatically used by puts

def to_s
  status = completed ? "x" : " "
  "[#{status}] #{title}"
end


Useful for debugging and CLI output.

🧩 Modeling Collections with Classes

Instead of using raw arrays, Ruby encourages wrapping collections
inside domain-specific classes.

Example:

Task → represents a single task

TaskList → represents a collection of tasks

class TaskList
  def initialize
    @tasks = []
  end
end


Benefits:

Better encapsulation

Clear responsibilities

Easier to extend later (filters, persistence, UI)

🧠 Key Takeaways

Classes model domain concepts

Objects hold state and behavior together

attr_accessor is the Ruby way to expose attributes

! indicates mutation by convention

Domain modeling is central to Ruby and Rails design
