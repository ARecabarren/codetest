def is_palindrome?(string)
    #pre-process string first
    string.downcase! ; string.delete!(' ') ; string.gsub!(/[^a-zA-Z]/, "")

    #base case
    if string.length == 1 || 0
        true
    elsif string[0] == string [-1]
        return is_palindrome?(string[1..-2])
    else
        false
    end
end

# puts is_palindrome?('Ana')
# puts is_palindrome?('Arenera')
puts is_palindrome?('no soy un palindromn')

# puts is_palindrome?('Seres')
# puts is_palindrome?('Radar')
# puts is_palindrome?('Salas')



