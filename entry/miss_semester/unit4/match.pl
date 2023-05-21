#!/usr/bin/perl
use strict;
use warnings;

open(WORD, "</usr/share/dict/words") or die "Can't open this file.";
my $i = 0;
my @word3;
my $count = 0;
while(<WORD>){
    if($_ =~ m/((.*a.*){4,})/){         # regular matching a word containing three a's;
        my $word1 = "$1\n";             # store to $word1;
        if($word1 !~ m/('s)\b/){        # regular matching a word that do not end in "'s";
            my $word2 = "$1\n";         # store to $word2;
            $count = $count + 1;
            if($word2 =~ m/(..)\b/){    # regular matching the two letters at the end of each word;
                @word3[$i] = "$1";      # store the result in array @word3;
                $i = $i + 1;
            }
        }
    }
}

#print "The Last Two Letters of These Words are \"@word3\"\n";
print "The Number of Words that meet the requirements is $count.\n";

# Find out 3 words with the highest frequency of the last 2 letters
my %fre;
foreach my $element (@word3){           # set the value of array @word3 to the key in the hash %fre;
    if(exists $fre{$element}){
        $fre{$element}++;
    }
    else{
        $fre{$element} = 1;
    }
}

my @Top3ofEle;
for (my $i = 0; $i < 3; $i++){
    my $MostEle;
    my $MostEleCnt = -1;
    foreach my $element (keys %fre){
        if($fre{$element} > $MostEleCnt){
            $MostEle = $element;
            $MostEleCnt = $fre{$element};
        }
    }
    push @Top3ofEle, $MostEle;                  # add the $MostEle to the array @Top3ofEle
    delete $fre{$MostEle};                      # delete the element which processed;
}

print "The three combination of the last two letters that appears most frequently are \"@Top3ofEle\".\n";

close(WORD) || die "Can't close this file.";