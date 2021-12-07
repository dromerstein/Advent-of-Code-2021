#! /usr/bin/perl

use strict;
use warnings;

open my $fh, "<", $ARGV[0] || die "can't open file\n";
my @list=<$fh>;
close $fh;

my $current=-1;
my $count=0;
while (@list) {
   my $remaining=scalar @list;
   last if ($remaining < 3);
   my $a = shift(@list);
   my $total=$a+$list[0]+$list[1];
   if ($current != -1) {
      $count++ if ($total > $current);
   }
   $current=$total
}
print "$count increases\n";
