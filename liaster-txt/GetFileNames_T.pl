my @files = grep { /\.(webm|mp4|mkv)$/i } glob("*"); # get all .webm, .mp4 and .mkv files in current directory


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


    
# print sorted filenames
foreach my $file (@files) {
    print "$file\n";
}
