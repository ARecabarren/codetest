def iterative_fibo(n)
    numbers = []
    n.times do |time|
        if time == 0 || time == 1
            numbers << time
        else
            numbers << numbers[-2..-1].reduce {|num, total| total + num}
        end
    end
    numbers

end

def fibs_rec(n)
    return [0] if n == 0
    return [0, 1] if n == 1
  
    array = fibs_rec(n - 1)
    array << array[-2] + array[-1]
end

# p fibs_rec(3)
# p iterative_fibo(8)