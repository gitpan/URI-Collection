#!/usr/bin/perl -w
use strict;

use Test::More tests => 4;

use_ok 'URI::Collection';

my $c = URI::Collection->new( 
               links => ['eg/Bookmarks-Netscape.html', 'eg/Favorites-WinIE'] );
isa_ok $c, 'URI::Collection';

## Get this with 
#      use Data::Dump qw(dump);
#      print dump($c->{cat_links});
# !!! Check if it's correct and make a test result with it.
#

#-------------------------------------------------------------
my $cat_links = $c->{cat_links};
is_deeply $c->fetch, $cat_links, 'fetch without arguments';

#--------------------------------------------------------------
my $fetched = $c->fetch(url => '[^\s]', category => 'foo');
my $items = 
[
    $c->{cat_links}->[0],
    {
    "foo/bar" => $c->{cat_links}->[1]->{'foo/bar'},
    "foo/baz/blah" => $c->{cat_links}->[1]->{'foo/baz/blah'}
    }
];

is_deeply $fetched, $items, 'fetch w/ arguments';

#--------------------------------------------------------------
$fetched = $c->fetch(category => '\.');
$items = 
[
    $c->{cat_links}->[0],
    {
    "." => $c->{cat_links}->[1]->{'.'}
    }
];

is_deeply $fetched, $items, 'fetch root level cat.';

#--------------------------------------------------------------
$fetched = $c->fetch(category => '\.');
$c->set( [ $fetched->[0], { 'New category' => $fetched->[1]->{'.'} } ] );
$items =
[
    $fetched->[0],
    { 'New category' => $fetched->[1]->{'.'} }
];

is_deeply $c->fetch, $items, 'set';

__END__

