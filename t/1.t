use strict;
use Test::More tests => 2;
BEGIN { use_ok('URI::Collection') };

# Set context.
my ($collection, $links, $location);

# Blank collection.
$collection = URI::Collection->new ();
is ref ($collection), 'URI::Collection', 'create empty collection';

__END__
# XXX These tests totally suck.  Real ones are coming shortly...

my $path = 'tmp/';

# Netscrape style bookmark file.
$links = "$path/Favorites-MacIE.html";
$collection = URI::Collection->new (file => $links);
$location = "$path/bookmarks.html";
$links = $collection->as_bookmark_file (save_as => $location);
ok length ($links) > 0, 'returned bookmarks have contents';
ok -e $location, 'saved bookmark file';

# M$ Windoze "Favorites" directory tree.
$links = "$path/Favorites-WinIE";
$collection = URI::Collection->new (directory => $links);
$location = "$path/favorites";
$collection->as_favorite_directory (save_as => $location);
ok -d $location, 'saved Favorites directory';
