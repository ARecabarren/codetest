integer_mapping = {
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I"
  }

  def integer_to_roman(dictionary, number, roman = '')
    return roman if number == 0 
    dictionary.keys.each do |divisor|
        quotient, rest = number.divmod(divisor)
        roman << dictionary[divisor] * quotient
        return integer_to_roman(dictionary, rest, roman) if quotient > 0
    end
    
  end


puts integer_to_roman(integer_mapping, 5000)
puts integer_to_roman(integer_mapping, 5427)

roman_mapping = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

def roman_to_integer(dictionary, roman, number = '')
    return number if roman.empty?
    dictionary.each do |key, value|
        quotient, rest = value.divmod(roman.count(key))
        number << quotient if quotient > 0
        return roman_to_integer(dictionary, roman[1..], number)
    end
end

roman_to_integer(roman_mapping ,'MMMMM')
roman_to_integer(roman_mapping ,'MMMMMCDXXVII')

