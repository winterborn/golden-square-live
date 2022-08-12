Single-Class Programs Design Recipe

1. Describe the Problem
   Typically you will be given a short statement that does this called a user story. In industry, you may also need to ask further questions to clarify aspects of the problem.

As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them.

2. Design the Class Interface
   The interface of a class includes:

```ruby

class = MusicApp

    def initialize
    # ...
    # some sort of list / array
    end

    def add(track)
    # unless track has not been listened to, do not add to list?
    end
    # track will be a string of the song name.

    def list
    # show list of tracks
    end
end


```

3. Create Examples as Tests
   These are examples of the class being used with different initializer arguments, method calls, and how it should behave.

```ruby
# 1
it "fails due to empty track name"
music_app = MusicApp.new
expect(music_app.add("")).to raise_error "Cannot have empty track name."

# 2
context "add one track to list."
it "adds track to list."
music_app = MusicApp.new
expect(music_app.list).to eq ["Beat It"]

# 3
context "add two tracks to list."
it "adds tracks to list."
music_app = MusicApp.new
music_app.add("Beat It")
music_app.add("Triller")
expect(music_app.list).to eq ["Beat It", "Triller"]

# 4
context "show track names."
it "show all track names."
music_app = MusicApp.new
expect(music_app.list).to eq ["Beat It", "Triller"]
```

4. Implement the Behaviour
   For each example you create as a test, implement the behaviour that allows the class to behave according to your example.

At this point you may wish to apply small-step test-driving to manage the complexity. This means you only write the minimum lines of the example to get the test to fail (red), then make it pass (green) and refactor, before adding another line to the test until it fails, then continue.

Then return to step 3 until you have addressed the problem you were given. You may also need to revise your design, for example if you realise you made a mistake earlier.
