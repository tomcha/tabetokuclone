package Getprizedata;

use strict;
use warnings;

use Web::Query;
use URI;

sub geturl{
  my $i = 1;
  my @array;
  for my $i (1..10){
    my $uri = "http://tabetoku.com/index.asp?pg=$i&class=&keyword=";
    wq($uri)->find('tr')->each(sub{ 
        my ($i, $trelem) = @_;
        my @trelem;
        $trelem->find('b')->each(sub{
            my ($j, $tdelem) = @_;
            if ($tdelem->as_html =~ /href="(.+?)" target=".*?">(.+)<\/a><\/b>/){
              push @trelem, [$2, 'tabetoku.com/'.$1];
            }
          });
        push @array, \@trelem if @trelem > 0;
      });
  }
return \@array;
}
1;
