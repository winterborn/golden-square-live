Single-Method Programs Design Recipe

1. Describe the Problem
   Typically you will be given a short statement that does this called a user story. In industry, you may also need to ask further questions to clarify aspects of the problem.

   As a user
   So that I can keep track of my tasks
   I want to check if a text includes the string #TODO.

2. Design the Method Signature
   The signature of a method includes:

```ruby
includes_todo = task_tracker(string)

# string is string of text with words in it.
# includes_todo is a boolean depending on whether it checks out.
```

3. Create Examples as Tests
   These are examples of the method being called with particular arguments, and what the method should return in each situation.

```ruby
# 1
task_tracker("")
#  => fail "Empty string."

# 2
task_tracker("#TODO: Buy milk")
#  => true

# 3
task_tracker("Clean car #TODO")
#  => true

# 4
task_tracker("#todo: Pick up dry cleaning")
#  => false (#TODO not capitalized)

# 5
task_tracker("Text friends")
#  => false (#TODO not present)

# 6
task_tracker("#TODO")
#  => true
```

4. Implement the Behaviour
   For each example you create as a test, implement the behaviour that allows the method to return the right value for the given arguments.

Then return to step 3 until you have addressed the problem you were given. You may also need to revise your design, for example if you realise you made a mistake earlier.
