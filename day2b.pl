#! /usr/bin/perl

use strict;
use warnings;

my $hpos=0;
my $vpos=0;
my $finalpos;
my $aim=0;

open my $fh, "<", $ARGV[0] || die "can't open file\n";
while (<$fh>) {
  chomp();
  my ($dir,$num) = split(/ /,$_);
  if ($dir eq "forward") {
    $hpos += $num;
    if ($aim > 0) {
      $vpos += ($num * $aim);
    }
  } elsif ( $dir eq "up") {
    $aim -= $num;
  } elsif ($dir eq "down") {
    $aim += $num;
  } else {
    print "\"$_\" is an unexpected input\n";
  }
}

$finalpos = $vpos * $hpos;
print "Final position: $finalpos\n";  
