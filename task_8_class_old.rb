=begin
Написать методы, расширяющие встроенный в Ruby класс Array

Все методы должны вызываться на объектах класса Array, т,е массивах.
    Метод square - должен возводить каждый элемент массива в квадрат и возвращать новый массив.
    Метод average - должен вернуть среднее арифметическое значение элементов массива
    (если метод вызывается на массиве строк - должен вернуть 0).
    Метод even_odd - должен вернуть разницу количества четных и нечетных чисел в массиве.
    Метод reverse_strings - должен вызываться на массиве строк и "переворачивать" все строки,
    возвращая новый массив. (Пример: ['string'].reverse_strings => ['gnirts'])

Подсказка: чтобы вызывать все методы на объектах класса Array,
достаточно просто объявить в программе класс Array и внутри него написать вышеописанные методы.

Примечание: методы не должны менять те массивы, на которых они вызываются.
Они только должны возвращать новые массивы.
=end

class Array
  def initialize(new_array)
    @array = new_array
  end

  def square
    return 0 if @array.is_a? String
    squared_array =  @array.map { |num| square = num ** 2 }
    puts "Новый массив чисел, возведенных в квадрат: #{squared_array}"
  end

  def average
    return 0 if @array.is_a? String
   # average_value = sum = 0
   # @array.each { |num| sum += num }
   # average_value = (sum.to_f / @array.length)
    average_value = @array.reduce(:+) / @array.size         #rewritten
    puts "Cреднее арифметическое значение элементов массива: #{average_value}"
  end

  def even_odd
    return 0 if @array.is_a? String
    even = odd = 0
    @array.each do |num|        
      even += 1 if num.even?
      odd += 1 if num.odd?
    end
    if even > odd
      diff = even - odd
    else diff = odd - even
    puts "Разница четных и нечетных чисел в массиве: #{diff}"
    end
  end

  def reverse_strings
    reversed = @array.map { |string| string.reverse }
    puts "Массив с перевернутыми строками: #{reversed}"
  end
end

puts "Введите массив чисел"
num_input = gets.chomp.to_s
numbers = num_input.split.map { |input| input.to_i }

puts "Введите массив строк"
str_input = gets.chomp.to_s
strings = str_input.split.map { |input| input.to_s }

number_array = Array.new(numbers)
string_array = Array.new(strings)

number_array.square
number_array.average
number_array.even_odd
string_array.reverse_strings
