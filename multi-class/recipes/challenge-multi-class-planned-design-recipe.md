Challenge Multi-Class Planned Design Recipe

1. Describe the Problem
   Typically you will be given a short statement that does this called a user story. In industry, you may also need to ask further questions to clarify aspects of the problem.

   As a user
   So that I can record my experiences
   I want to keep a regular diary

   As a user
   So that I can reflect on my experiences
   I want to read my past diary entries

   As a user
   So that I can reflect on my experiences in my busy day
   I want to select diary entries to read based on how much time I have and my reading speed

   As a user
   So that I can keep track of my tasks
   I want to keep a todo list along with my diary

   As a user
   So that I can keep track of my contacts
   I want to see a list of all of the mobile phone numbers in all my diary entries

2. Design the Class System
   Design the interfaces of each of your classes and how they will work together to achieve the job of the program. You can use diagrams to visualise the relationships between classes.

   ```ruby
   class Diary
     def add(entry)
       # entry is an instance of DiaryEntry
     end
   
     def list
       # returns list of diary entries
     end
   end
   
   class DiaryEntry
     def initialize
       # ...
     end
   
     def title
       # title is a string
     end
   
     def contents
       # contents is a string
     end
   end
   
   class TaskList
     def initialize
       @all_tasks = []
     end
   
     def add(task)
       # task is an instance of Task
     end
   
     def all_tasks
       return # list of tasks
     end
   end
   
   class Task
     def initialize(todo)
       # todo is a string
     end
   
     def todo
       # todo is a string
     end
   end
   
   class PhoneBook
     def initialize(diary)
       # diary is an instance of Diary
       # see a list of all of the mobile phone numbers in all my diary entries
     end
   
     def numbers
       # list of numbers as strings
     end
   end
   
   class EntryReader
     def initialize(wpm, diary)
       # wpm = how many words a reader can read in one min
       # diary is an instance of Diary
     end
   
     def entry_readable_in_given_time(time)
       # returns instance of DiaryEntry with chunk that is readable within time, given wpm.
     end
   end
   ```

Consider pulling out the key verbs and nouns in the problem description to help you figure out which classes and methods to have.

Steps 3, 4, and 5 then operate as a cycle.

3. Create Examples as Integration Tests
   Create examples of the classes being used together in different situations and combinations that reflect the ways in which the system will be used.

```ruby
# As a user
# So that I can record my experiences
# I want to keep a regular diary

# As a user
# So that I can reflect on my experiences
# I want to read my past diary entries

# 1
diary = Diary.new
entry = DiaryEntry.new("my title", "my contents")
diary.add(entry)
expect(diary.list).to eq [entry]

# As a user
# So that I can reflect on my experiences in my busy day
# I want to select diary entries to read based on how much time I have and my reading speed

# 2 - readable within time
diary = Diary.new
entry_reader = EntryReader.new(2, diary)
entry = DiaryEntry.new("my title", "my contents")
diary.add(entry)
entry_reader.entry_readable_in_given_time(1) # 2 wpm reads 2 words in 1 min
expect(entry_reader.entry_readable_in_given_time(1)).to eq entry

# 3 - not readable within time
diary = Diary.new
entry_reader = EntryReader.new(2, diary)
entry = DiaryEntry.new("my title", "I had shreddies for breakfast.")
diary.add(entry)
entry_reader.entry_readable_in_given_time(1) # 2 wpm reads 2 words in 1 min
expect(entry_reader.entry_readable_in_given_time(1)).to eq none

# 4 - wpm = 0 - fail
diary = Diary.new
entry_reader = EntryReader.new(0, diary)
entry = DiaryEntry.new("my title", "Monday morning")
diary.add(entry)
entry_reader.entry_readable_in_given_time(1) # 2 wpm reads 2 words in 1 min
expect {
  entry_reader.entry_readable_in_given_time(1)
}.to raise_error "wpm cannot be 0."

# As a user
# So that I can keep track of my tasks
# I want to keep a todo list along with my diary

# 5 - show list of todos
task_list = TaskList.new
todo_1 = Task.new("Buy milk")
todo_2 = Task.new("Buy eggs")
todo_3 = Task.new("Buy flour")
task_list.add(todo_1)
task_list.add(todo_2)
task_list.add(todo_3)
expect(task_list).to eq [todo_1, todo_2, todo_3]

# As a user
# So that I can keep track of my contacts
# I want to see a list of all of the mobile phone numbers in all my diary entries

diary = Diary.new
phone_book = PhoneBook.new(diary)
entry_1 = DiaryEntry.new("my title", "Phil's number is 07791165000")
entry_2 = DiaryEntry.new("my title", "Kat's number is 07792235000")
diary.add(entry_1)
diary.add(entry_2)
expect(phone_book.numbers).to eq %w[07791165000 07792235000]
```

Encode one of these as a test and move to step 4.

4. Create Examples as Unit Tests
   Create examples, where appropriate, of the behaviour of each relevant class at a more granular level of detail.

Encode one of these as a test and move to step 5.

```ruby
# 1 - empty entry
diary = Diary.new
entry = DiaryEntry.new("")
diary.add(entry)
expect(diary.list).to eq [entry]

# 2 - empty task
task_list = TaskList.new
todo_1 = Task.new("")
task_list.add(todo_1)
expect(task_list).to eq [todo_1]
```

5. Implement the Behaviour
   For each example you create as a test, implement the behaviour that allows the class to behave according to your example.

Then return to step 3 until you have addressed the problem you were given. You may also need to revise your design, for example if you realise you made a mistake earlier.

```

```
