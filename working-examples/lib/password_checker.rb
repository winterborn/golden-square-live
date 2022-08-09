class PasswordChecker
  def check(password)
    if password.length >= 8
      return true
    else
      fail "Invalid password, must be 8+ characters."
    end
  end
end

# new_password = PasswordChecker.new
# new_password.check("abcdefg")
# puts new_password.check
