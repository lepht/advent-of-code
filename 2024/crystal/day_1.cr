list1 = [] of Int32
list2 = [] of Int32

File.each_line("day_1_input.txt") do |line|
    item1, item2 = line.split(/\W+/)
    list1 << item1.to_i
    list2 << item2.to_i
end

list1.sort!
list2.sort!

distance = list1.zip(list2).sum { |item1, item2| (item2 - item1).abs }
p! distance


list2_counts = Hash(Int32, Int32).new(default_value: 0)
list2.each { |item| list2_counts[item] += 1 }

similarity = 0
list1.each do |item1|
    similarity += item1 * list2_counts[item1]
end

p! similarity