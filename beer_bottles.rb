def beer_bottles(n)
    #base case
    if n == 0
        'no more bottles of beer on the wall'
    else
        puts "#{n} bottles of beer on the wall"
        return beer_bottles(n-1)
    end
end

puts beer_bottles(5)