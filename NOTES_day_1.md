# Ruby Notes — Day 1 Clarifications
✔️ Symbols vs Strings

A symbol is an immutable, lightweight identifier commonly used as a hash key and in Rails DSL.

Immutable means the symbol itself cannot change, but a variable referencing it can be reassigned to any other object (including a string). This is expected.

Symbols are faster and more memory-efficient than strings.

```
x = :pending   # x references a symbol
x = "done"     # x now references a string (symbol was not modified)
```

✔️ map vs each

map returns a new transformed array.
each returns the original array and is used for side effects (logging, updating external state).

```
[1,2,3].map { |n| n * 2 }  # => [2,4,6]
[1,2,3].each { |n| puts n } # => [1,2,3]
```

✔️ puts vs p

puts prints human-friendly output using to_s.
p prints debugging output using inspect, showing the object’s structure.

```
puts [1,2,3]
# 1
# 2
# 3

p [1,2,3]
# [1,2,3]
```
✔️ Ruby’s “arrow-function-like” syntax
Ruby provides lambdas, which use an arrow syntax:

```
greet = ->(name) { "Hello #{name}" }
greet.call("Michał")
```

Ruby also has Procs, which behave similarly but differ in return semantics:
```
say = Proc.new { |name| "Hello #{name}" }
```

✔️ Hash keys like title => "Value"
A hash can use any object as a key, including the value of a variable:
```
key = :title
task = { key => "My task" }
```

✔️ Useful numeric predicate methods
Ruby has many intuitive, predicate-style helper methods ending with ?.
| Method           | Meaning                                |
| ---------------- | -------------------------------------- |
| `even?`          | number is even                         |
| `odd?`           | number is odd                          |
| `positive?`      | > 0                                    |
| `negative?`      | < 0                                    |
| `zero?`          | == 0                                   |
| `nonzero?`       | returns number if not zero, else `nil` |
| `between?(a, b)` | within a given range                   |


```
5.positive?      # true
-2.negative?     # true
0.zero?          # true
10.between?(1,20) # true
```

✔️ &:method_name shorthand (Symbol-to-Proc)
Instead of:
```
numbers.select { |n| n.even? }
```

You can write:
```
numbers.select(&:even?)
```
This converts the symbol :even? into a Proc and passes it as a block — a very idiomatic Ruby trick.