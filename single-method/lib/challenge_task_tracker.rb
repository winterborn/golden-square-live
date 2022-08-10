def task_tracker(string)
  fail "Empty string." if string.empty?
  if string.include?("#TODO")
    return true
  else
    return false
  end
end

# p task_tracker("#todo test test test")
# p task_tracker("test test test")
