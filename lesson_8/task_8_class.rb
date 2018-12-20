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

  def square
    squared_array = self.map { |num| num ** 2 }
    puts "Новый массив чисел, возведенных в квадрат: #{squared_array}"
  end

  def average
    return 0 if self.map { |elem| elem.is_a? String }.include?(true)
    average_value = (self.reduce(:+).to_f / self.size)
    puts "Cреднее арифметическое значение элементов массива: #{average_value}"
  end

  def even_odd
    even = self.select { |num| num.even? }.size
    odd = self.select { |num| num.odd? }.size
    puts "Разница четных и нечетных чисел в массиве: #{even - odd}"
  end

  def reverse_strings
    reversed = self.map { |string| string.reverse }
    puts "Массив с перевернутыми строками: #{reversed}"
  end
end

puts "Введите массив чисел"
num_input = gets.chomp.to_s
numbers = num_input.split.map { |input| input.to_i }

puts "Введите массив строк"
str_input = gets.chomp.to_s
strings = str_input.split.map { |input| input.to_s }

numbers.square
numbers.average
numbers.even_odd
strings.reverse_strings
