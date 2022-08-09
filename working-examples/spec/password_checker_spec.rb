require "password_checker"

RSpec.describe PasswordChecker do
  context "checks for error from password length"
  it "fails" do
    new_password = PasswordChecker.new
    expect {
      new_password.check("abcdefg")
    }.to raise_error "Invalid password, must be 8+ characters."
  end
end
