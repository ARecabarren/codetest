def fattlens_recursive(array, flatten = [])
    array.each do |ele|
        if ele.is_a?(Numeric)
            flatten.push(ele)
        else
            fattlens_recursive(ele,flatten)
        end
    end
    flatten
end

p fattlens_recursive([[1, 2], [3, 4]])
p fattlens_recursive([[1, [8, 9]], [3, 4]])
