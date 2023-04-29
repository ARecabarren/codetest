#On input of n elements
  # if n < 2
    # return
  # else
    # sort left half of elements
    # sort right half of elements
    # merge sorted halves
# 

def resursive_merge_sort(array)
    
    if array.length < 2
        return array
    else
        mid = (array.length-1)/2
        left_half = array.slice!(0..mid)
        right_half = array
        sorted_left = resursive_merge_sort(left_half)
        sorted_right = resursive_merge_sort(right_half)

        if sorted_left.length == 1 && sorted_right.length == 1
            if sorted_right[0] > sorted_left[0]
                sorted_left.concat(sorted_right)
            else 
                sorted_right.concat(sorted_left)
            end
        else
            merged = []
            sorted_left.clone.each_with_index do |vleft, index_left|
                sorted_right.clone.each_with_index do |vright, index_right|

                    if vleft < vright
                        #add left value
                        sorted_left.delete(vleft)
                        merged.push(vleft)
                        break
                    else
                        #add right value
                        sorted_right.delete(vright)
                        merged.push(vright)
                        next
                    end  
                end
            end
            if sorted_left.empty?
                merged.concat(resursive_merge_sort(sorted_right))
            else
                merged.concat(resursive_merge_sort(sorted_left))
            end
        end
    end
        
end

arr = [6,5,3,1,8,7,2,4]
p resursive_merge_sort(arr)
p resursive_merge_sort([2,1])
p resursive_merge_sort([4, 3, 2, 1])
p resursive_merge_sort([1, 1, 1, 1, 1])
