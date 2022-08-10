Single-Method Programs Design Recipe

1. Describe the Problem
   Typically you will be given a short statement that does this called a user story. In industry, you may also need to ask further questions to clarify aspects of the problem.

   As a user
   So that I can improve my grammar
   I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.

2. Design the Method Signature
   The signature of a method includes:

```ruby
is_correct = check_grammar(text)

# text is a string with words in it.
# is_correct is a boolean depending on whether it checks out.
```

3. Create Examples as Tests
   These are examples of the method being called with particular arguments, and what the method should return in each situation.

```ruby
# 1
check_grammar("")
#  => fail "Not a sentence."

# 2
check_grammar("Hi, I'm Phil.")
#  => true

# 3
check_grammar("Hi, I'm Phil")
#  => false

# 4
check_grammar("hi, I'm Phil.")
#  => false

# 5
check_grammar("hi, i'm phil")
#  => false

# 6
check_grammar("Hi, I'm Phil!")
#  => true
```

4. Implement the Behaviour
   For each example you create as a test, implement the behaviour that allows the method to return the right value for the given arguments.

Then return to step 3 until you have addressed the problem you were given. You may also need to revise your design, for example if you realise you made a mistake earlier.
