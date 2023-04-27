def factorial_recursive(n)
    #base case
    if n == 1
        return 1
    else
        return n * factorial_recursive(n-1)
    end
end

puts factorial_recursive(1)
puts factorial_recursive(2)
puts factorial_recursive(3)
puts factorial_recursive(4)
puts factorial_recursive(5)



