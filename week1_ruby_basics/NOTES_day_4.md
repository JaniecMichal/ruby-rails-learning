# Ruby — Proc and Lambda Explained

---

## 🎯 Purpose
Understand:
- why Proc and lambda exist
- how they differ from blocks
- when to use Proc vs lambda
- why Rails prefers lambdas
- how `return` behaves differently

---

## 🧩 Why Proc and Lambda Exist

### Problem with blocks
- A block is **not an object**
- It cannot be stored in a variable
- It cannot be passed around freely
- It can only be executed immediately via `yield`

```ruby
def run
  yield
end

This works only if execution is immediate.

🧱 Proc — Block as an Object
Creating a Proc
logger = Proc.new { |msg| puts "[LOG] #{msg}" }

Calling a Proc
logger.call("Started")

What Proc gives you

can be stored in a variable

can be passed to methods

can be reused multiple times

behaves like a flexible callback

Characteristics

loose argument checking (arity)

return exits the surrounding method

good for simple callbacks

🧱 Lambda — Proc That Behaves Like a Method
Creating a Lambda (arrow syntax)
greet = ->(name) { "Hello #{name}" }

Calling a Lambda
greet.call("Michał")

Characteristics

strict argument checking

behaves like a normal method

return exits only the lambda

🔍 Key Differences
1️⃣ Argument handling (arity)

Proc (loose):

p = Proc.new { |a, b| a }
p.call(1)        # OK
p.call(1, 2, 3)  # OK


Lambda (strict):

l = ->(a, b) { a }
l.call(1)        # ArgumentError
l.call(1, 2)     # OK

2️⃣ return behavior (VERY IMPORTANT)
Proc — dangerous return
def test_proc
  p = Proc.new { return "from proc" }
  p.call
  "after proc"
end

test_proc
# => "from proc"


return exits the entire method.

Lambda — safe return
def test_lambda
  l = -> { return "from lambda" }
  l.call
  "after lambda"
end

test_lambda
# => "after lambda"


return exits only the lambda.

🧠 When to Use What
Use lambda when:

logic behaves like a function

argument correctness matters

return is used

writing business logic

working in Rails (scopes, callbacks)

Use Proc when:

writing simple callbacks

arity is not important

return is not needed

flexibility is preferred

🚀 Rails Examples
Scopes (always lambdas)
scope :completed, -> { where(completed: true) }

Callbacks
before_save -> { self.updated_at = Time.current }

Authorization / Policies
can :update, Task, ->(task) { task.user == user }

🔗 Symbol to Proc (&:method_name)
tasks.select(&:completed?)


Equivalent to:

tasks.select { |task| task.completed? }


How it works:

:completed? → Symbol

& converts it to a Proc

Proc is passed as a block

🧠 Mental Model

Block → one-time executable code

Proc → block wrapped as an object

Lambda → Proc that behaves like a method

✅ Key Takeaways

Blocks are not objects

Proc = flexible callback

Lambda = safe, method-like function

return inside Proc can exit a method

Rails strongly prefers lambdas