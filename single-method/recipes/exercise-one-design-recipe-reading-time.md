Single-Method Programs Design Recipe - Philip White, Boris Tsang

1. Describe the Problem
   Typically you will be given a short statement that does this called a user story. In industry, you may also need to ask further questions to clarify aspects of the problem.

   User Story:-
   As a user, so that I can manage my time,
   I want to see an estimate of reading time for a text,
   assuming that I can read 200 words a minute.

2. Design the Method Signature
   The signature of a method includes:

   converts text word count to time needed to read text
   assumes user reading speed is 200wpm

   Code Brainstorm:-
   need for class? = no
   method arg(s) = word count (integer)
   method body = performs following mathematical operation:-
   *converts to float first since division is occurring
   *have one line if statement for pluralisation of hour(s) and minute(s)
   time to read = words / reading speed
   unless word_total < 1 minute
   returns time to read as less than a minute, formatted in a
   message.
   elsif nothing given
   fails and returns "You didn't provide a word count!"
   elsif negative word_total given
   fails and returns "No negative word counts, please"
   elsif not a number given
   fails and returns "Please provide a number for the word count."
   elsif float given
   fails and returns "Please enter a whole number, please."
   else
   returns time to read in formatted form in hours and minutes,
   rounded up to nearest minute.
   end

3. Create Examples as Tests
   These are examples of the method being called with particular arguments, and what the method should return in each situation.

4. Implement the Behaviour
   For each example you create as a test, implement the behaviour that allows the method to return the right value for the given arguments.
