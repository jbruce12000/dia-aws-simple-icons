#!/usr/bin/perl -w
use strict;
use File::Find;
use Data::Dumper;

# this script was used to create the shapes and sheets originally
# if you need to run this, install img2dia and run this script
# https://github.com/ntvis/image2dia/tree/master/Image2dia

my $dir='/home/jason/tmp/aws-icons/AWS_Simple_Icons_v15.10.2';

find(\&wanted, $dir);

sub wanted {
  return unless $_=~/.*svg$/;
  my $idir=$File::Find::dir;

  chdir($idir);
  my @parts=split(/\_/,$_);
  my $sheet=shift(@parts);
  $sheet=lc($sheet);
  $sheet=~s/.svg$//;
  $sheet="aws-".$sheet;

  my $cmd= "addImage2dia.py $_ $sheet";
  print "$cmd\n";
  print `$cmd`;
  }
