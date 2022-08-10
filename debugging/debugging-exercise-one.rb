# before debugging

def say_hello(name)
  return "hello #(name)"
end

# Intended output:
#
# > say_hello("kay")
# => "hello kay"

# after debugging

def say_hello(name)
  return "Hello #{name}"
end

# Intended output:
#
# > say_hello("kay")
# => "hello kay"

p say_hello("Phil")
