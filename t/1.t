use strict;
use Test::More 'no_plan';#tests => 2;
BEGIN { use_ok 'URI::Collection' };

$| = 1;

# Blank collection.
my $c = URI::Collection->new;
isa_ok $c, 'URI::Collection', 'with no arguments';
is_deeply $c->fetch_items(category => '.*', title => '.*'), {},
    'no links';

# Bookmark collection.
$c = URI::Collection->new(
#    debug => 1,
    links => 'eg/Bookmarks-Netscape.html',
);
isa_ok $c, 'URI::Collection', 'with bookmarks';
my $items = {
    'Perl' => [ { 'Perl Mongers' => 'http://www.perl.org/' } ]
};
is_deeply $c->fetch_items(title => 'perl'), $items,
    'fetched bookmark items';

# Favorites collection.
$c = URI::Collection->new(
#    debug => 1,
    links => 'eg/Favorites-WinIE',
);
isa_ok $c, 'URI::Collection', 'with favorites';
$items = {
    'cs/perl' => [
        { 'CPAN' => 'http://www.cpan.org/' },
        { 'YAPC' => 'http://www.yapc.org/' }
    ]
};
is_deeply $c->fetch_items(category => 'perl'), $items,
    'fetched favorite items';

# Bookmark and Favorites collection.
$c = URI::Collection->new(
#    debug => 1,
    links => [ 'eg/Bookmarks-Netscape.html', 'eg/Favorites-WinIE' ],
);
isa_ok $c, 'URI::Collection', 'with bookmarks and favorites';
$items = {  # {{{
    'foo/baz/blah' => [
        { 'CPAN' => 'http://www.cpan.org/' },
        { 'YAPC' => 'http://www.yapc.org/' }
    ],
    'foo/bar' => [
        { 'Google' => 'http://www.google.com/' }
    ]
};  # }}}
is_deeply $c->fetch_items(url => '[^\s]', category => 'foo'), $items,
    'fetched bookmark and favorite items';

$items = {  # {{{
    'Hardware' => [
        { 'Cisco Connection Online by Cisco Systems, Inc.' => 'http://www.cisco.com/' },
        { 'O\'Reilly & Associates' => 'http://www.oreilly.com/' },
        { 'Amazon.com--Earth\'s Biggest Selection' => 'http://www.amazon.com/exec/obidos/subst/home/home.html/002-1250643-7915022' }
    ],
    'foo/baz/blah' => [
        { 'CPAN' => 'http://www.cpan.org/' },
        { 'YAPC' => 'http://www.yapc.org/' }
    ],
    'foo/bar' => [ { 'Google' => 'http://www.google.com/' } ],
    'Perl' => [
        { 'Geek Stuff' => 'http://www.geekstuff.com/' },
        { 'Perl Mongers' => 'http://www.perl.org/' },
        { 'Welcome to Stonehenge!' => 'http://www.stonehenge.com/' }
    ],
    'Public radio' => [
        { 'From WBEZ in Chicago | This American Life' => 'http://www.thislife.org/' },
        { 'NPR Online' => 'http://www.npr.org/' }
    ],
    'Links' => [ { 'Google' => 'http://www.google.com/' } ],
    'Diving' => [
        { 'Global Underwater Explorers' => 'http://www.gue.com/' },
        { 'Halcyon' => 'http://www.halcyon.com/' }
    ],
    'Favorites' => [
        { 'ShorterLink.com' => 'http://shorterlink.com/' },
        { 'Thesaurus.com' => 'http://thesaurus.com/' }
    ],
    'cs/perl' => [
        { 'CPAN' => 'http://www.cpan.org/' },
        { 'YAPC' => 'http://www.yapc.org/' }
    ]
};  # }}}
is_deeply $c->fetch_items, $items, 'fetched all links';

ok $c->is_item('google.com'), 'is link';
ok !$c->is_item('xgoogle.com'), 'is not link';

ok length ($c->as_bookmark_file), 'returned bookmarks string';
ok keys %{ $c->as_favorite_directory } == 9, 'returned favorites structure';

ok -f $c->as_bookmark_file(save_as => 't/test.html'), 'saved bookmark file';
ok -d $c->as_favorite_directory(save_as => 't/test'), 'saved favorite directory';
