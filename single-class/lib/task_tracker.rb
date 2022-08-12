# As a user
# So that I can keep track of my tasks
# I want a program that I can add todo tasks to and see a list of them.

# As a user
# So that I can focus on tasks to complete
# I want to mark tasks as complete and have them disappear from the list.

class TaskTracker

    def initialize()
        @list = []
    end

    def add(task)
        return @list.append(task)
    end

    def list()
        @list
    end

    def completed(task)
        fail "no such task" unless @list.include? task
        return @list.delete(task)
    end


end