package Getprizedata;

use strict;
use warnings;

use Web::Query;
use URI;

sub geturl{
  my $i = 1;
  my @res_array;
  for my $i (1..10){
    my $uri = "http://tabetoku.com/index.asp?pg=$i&class=&keyword=";
    wq($uri)->find('tr')->each(sub{ 
        my ($i, $tr_element) = @_;
        my @td_elements;
        $tr_element->find('b')->each(sub{
            my ($j, $td_element) = @_;
            if ($td_element->as_html =~ /href="(.+?)" target=".*?">(.+)<\/a><\/b>/){
              push @td_elements, [$2, 'tabetoku.com/'.$1];
            }
          });
        push @res_array, \@td_elements if @td_elements > 0;
      });
  }
return \@res_array;
}
1;
