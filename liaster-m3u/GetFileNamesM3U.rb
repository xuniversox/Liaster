
dir_path = '.'

capture_digit_from_bracket_regex = /\[(\d+)\]/
remove_crap_regex = /^\.\/|\.(rb|lua|bat)| \(\[\]\)/

filenames = Dir.glob(File.join(dir_path, '**/*'))
.reject { | path | File.directory?(path) }
.map { | path | [path, File.basename(path, '.*').scan(capture_digit_from_bracket_regex).map(&:to_i)] }

sorted_filenames = filenames.sort_by { |path, nums | nums }

removed_crap_filenames = sorted_filenames.map{ |path, nums| [path.gsub(remove_crap_regex , ''), nums] }

cleaned_filenames = removed_crap_filenames.join("\n")

cleaned_filenames.gsub(/\s+\(.*\)$/, "")

puts '#EXTM3U'

puts cleaned_filenames