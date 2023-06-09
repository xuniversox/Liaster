my @files = grep { /\.(webm|mp4)$/i } glob("*"); # get all .webm and .mp4 files in current directory

@files = grep { /\.webm$|\.mp4$|\.m3u8$ / } @files;

# sort files numerically based on any groups of numbers in the filename
@files = sort {
    my @a_num = $a =~ /(\d+)/g; # extract all groups of numbers in filename
    my @b_num = $b =~ /(\d+)/g;
  #  print "Comparing groups of numbers in filenames $a and $b:\n";
    for (my $i = 0; $i < @a_num && $i < @b_num; $i++) {
        # print "  Group $i: $a_num[$i] <=> $b_num[$i]\n";
        my $cmp = $a_num[$i] <=> $b_num[$i];
        return $cmp if $cmp != 0;
    }
    return @a_num <=> @b_num; # sort by number of groups if numbers are equal
} @files;


 


print "Enter the filename of the M3U8 file: ";
chomp(my $variable = <STDIN>);

my $output_file = $variable . ".m3u8";

open(my $fh, '>', $output_file) or die "Cannot Open File '$output_file' $!";

   print $fh "#EXTM3U\n";

# print sorted filenames
foreach my $file (@files) {
    print "$file\n";
    print $fh "$file\n";
}

system("mpv -ontop -playlist $variable.m3u8");


print "Variable has been saved to '$output_file' .";
