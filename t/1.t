use strict;
use Test::More 'no_plan';#tests => 2;
BEGIN { use_ok 'URI::Collection' };

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

__END__
Next is testing of the save_as features...
