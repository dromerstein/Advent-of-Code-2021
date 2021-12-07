#! /usr/bin/perl

use strict;
use warnings;

my $current="-1";
my $count=0;
open my $fh, "<", $ARGV[0] || die "can't open file\n";
while (<$fh>) {
  chomp();
  if ($current=="-1") {
     $current=$_;
     next
  }
  if ($current < $_) {
     $count++;
  }
  $current=$_;
}
close $fh;
print "$count increases\n";
