#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use FindBin;
use lib "$FindBin::Bin/./lib";

use open qw/:encoding(utf-8) :std/;
use v5.12;
 
use Data::Dumper;
use DDP{deparse => 1};

use Getprizedata;

my $res = Getprizedata->geturl;
p $res;
