def recursive_fibonacci(n)
    #base cases
    if n == 0
        0
    elsif n == 1
        1
    else
        recursive_fibonacci(n-1) + recursive_fibonacci(n-2)
    end
end

puts recursive_fibonacci(0)
puts recursive_fibonacci(1)
puts recursive_fibonacci(2)
puts recursive_fibonacci(5)
puts recursive_fibonacci(6)



