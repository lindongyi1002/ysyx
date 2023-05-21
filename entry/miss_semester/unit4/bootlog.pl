#!/usr/bin/perl
use v5.10;
use strict;
use warnings;

use Time::Piece;

#-----------------------------------------------------------------------------#

open(BootLog, "<./bootlog.txt") or die "Can't open this file.";
my @lines;
my $len;
my @starttime = [];
my @endtime = [];
my $i = 0;
while(my $lines = <BootLog>){       #save the last 10 lines;
    push @lines, $lines;
    shift @lines if scalar @lines > 10;
    $len = scalar @lines;
}
#say @lines;

#-----------------------------------------------------------------------------#

my $j = 0;
while($len > $j){   #regex
    if($lines[$j] =~ s/(^(.){41})//){
        my $seg0 = $';
        #print $seg0;
        if($seg0 =~ s/CST—(... )//){
            if($seg0 =~ s/CST//){
                my @seg1 = split / /, "$seg0";
                #print @seg1;
                @starttime[$i] = $seg1[0]." ". $seg1[1];
                @endtime[$i] = $seg1[2]." ". $seg1[3];
                $i++;
            }
        }
    }
    $j++;
}

#-----------------------------------------------------------------------------#

my @diff_seconds;
for (0..($len-1)){      #convert time to ssecond
    my $t1 = Time::Piece->strptime($starttime[$_], "%Y-%m-%d %H:%M:%S");
    my $t2 = Time::Piece->strptime($endtime[$_], "%Y-%m-%d %H:%M:%S");
    $diff_seconds[$_] = $t2 - $t1;
}

#-----------------------------------------------------------------------------#

# average
my $sum = 0;
foreach $_ (@diff_seconds){ # add all diff
    $sum += $_;
}
my $average = $sum / scalar $len;
say "the Average of the last 10 runs is $average seconds.";

#-----------------------------------------------------------------------------#

#median
my @order = sort {$a <=> $b} @diff_seconds;
my $median;
if($len % 2 == 0){
    $median = ($order[($len / 2) - 1] + $order[($len / 2 + 1) - 1]) / 2;
}
else{
    $median = $order[(($len + 1) / 2) - 1];
}
say "the Median of the last 10 runs is $median seconds.";

#-----------------------------------------------------------------------------#
# maximum run time
say "the Maximum run time of hte last 10 runs is $order[$len - 1] seconds.";


#-----------------------------------------------------------------------------#

close(BootLog) || die "Can't close this file.";