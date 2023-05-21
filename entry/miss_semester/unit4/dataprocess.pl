#!/usr/bin/perl
use v5.10;
use strict;
use warnings;

open('table', "<./table-1.csv") or die "Can't open this file.";

my $count = 0;
my @seg1;
my @sub;
my $i = 0;
my @order;

print "the sub of the second col subtracting the third col are :\n";

while(<table>){
    $count++;
    if ($count >= 37 and $count <= 56){
        @seg1 = split /"/, "$_";
        my @seg21 = split /,/, "$seg1[1]";
        my @seg22 = split /,/, "$seg1[3]";
        my $seg31 = $seg21[0].$seg21[1].$seg21[2];
        my $seg32 = $seg22[0].$seg22[1].$seg22[2];
        my @sub = $seg31 - $seg32;
        @order[$i] = $seg32;
        $i++;
        print " $i - @sub\n";
    }
}

@order = sort {$a <=> $b} @order; 
print "the order num of the third colume are @order.\n";



close('table') || die "Can't close this file.";