directory_list  = Dir.entries('.')

sorted_directory_list = directory_list.sort_by {|directory_list| File.mtime(directory_list)}

#puts shit

puts sorted_directory_list
