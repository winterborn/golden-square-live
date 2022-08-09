# require "reminder"

# RSpec.describe Reminder do
#   context "when no task is set" do
#     it "fails" do
#       reminder = Reminder.new("Phil")
#       expect { reminder.remind() }.to raise_error "No reminder set!"
#     end
#   end

#   context "when task is set" do
#     it "reminds the user to do a task" do
#       reminder = Reminder.new("Phil")
#       reminder.remind_me_to("Buy milk")
#       result = reminder.remind()
#       expect(result).to eq "Buy milk, Phil!"
#     end
#   end
# end
