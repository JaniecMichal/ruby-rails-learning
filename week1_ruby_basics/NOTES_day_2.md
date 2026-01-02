# Ruby Basics — Day 2 Summary  
## Methods, Arguments, Returns, Ruby Idioms

---

## 🎯 Goal of the Day
- Understand how to define methods in Ruby  
- Learn positional arguments, default values, and keyword arguments  
- Understand Ruby’s return behavior  
- Use common Ruby idioms (guard clauses, splat operator)

---

## 🧩 Method Definition

- Methods are defined using `def`
- Ruby returns the **last evaluated expression** automatically

```ruby
def greet(name)
  "Hello, #{name}"
end


🔁 Default Arguments

Arguments can have default values

Similar to JavaScript, but more idiomatic in Ruby

```
def greet(name = "Guest")
  "Hello, #{name}"
end
```

🔑 Keyword Arguments (Very Important in Rails)
- Improve readability
- Prevent bugs caused by wrong argument order
- Widely used in Rails APIs and ActiveRecord

```
def create_task(title:, completed: false, priority: 1)
  { title: title, completed: completed, priority: priority }
end
```
Rails example:
```
Task.create(title: "Workout", completed: false)

```

🔄 Return Values and Guard Clauses

- Ruby returns the last expression by default
- `return` is commonly used for early exit

```
def safe_divide(a, b)
  return "Invalid divisor" if b.zero?
  a / b
end
```
This pattern is called a guard clause and is very idiomatic in Ruby.

⭐ Splat Operator (*)
Collect arguments into an array:
```
def sum(*numbers)
  numbers.sum
end
```

Other common uses:

Array expansion
`[1, 2, *[3, 4]]  # => [1, 2, 3, 4]`
 
Passing array as arguments
```
args = [2, 3]
add(*args)
```

Multiple assignment
`first, *rest = [1, 2, 3, 4]`

🧠 Ruby Idioms Learned Today

- Prefer returning values over printing inside methods
- Use keyword arguments for clarity
- Use guard clauses to reduce nesting
- Let methods be small and expressive