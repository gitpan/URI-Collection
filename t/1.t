use strict;
use Test::More 'no_plan';#tests => 2;
BEGIN { use_ok 'URI::Collection' };

# Blank collection.
my $c = URI::Collection->new;
isa_ok $c, 'URI::Collection', 'with no arguments';
is_deeply $c->fetch_items(name => '.*'), [], 'no links';

$c = URI::Collection->new(
#    debug => 1,
    file  => 'eg/Bookmarks.html',
);
isa_ok $c, 'URI::Collection', 'with bookmarks';
my $items = [  # {{{
    'Perl', {
        'title' => 'Perl Mongers',
        'obj' => bless({
            'LAST_VISIT'    => '938494387',
            'ADD_DATE'      => '938494410',
            'ALIASOF'       => undef,
            'TITLE'         => 'Perl Mongers',
            'LAST_MODIFIED' => '938494387',
            'DESCRIPTION'   => undef,
            'ALIASID'       => undef,
            'HREF'          => bless([ bless(do {\(my $o = 'http://www.perl.org/')}, 'URI::http'), undef ], 'URI::URL')
        }, 'Netscape::Bookmarks::Link')
    }
];  # }}}
is_deeply $c->fetch_items(name => 'perl'), $items, 'fetched bookmark items';

$c = URI::Collection->new(
#    debug => 1,
    directory => 'eg/Favorites-WinIE',
);
isa_ok $c, 'URI::Collection', 'with favorites';
$items = [  # HOLY CRAP FAVORITES ARE BLOATED {{{
    {
        'Links' => [
            {
                'title' => 'Google',
                'obj' => bless( {
                    'pCMT' => {
                        'InternetShortcut' => {
                            'Modified' => [],
                            'IconIndex' => [],
                            'IconFile' => [],
                            'URL' => []
                        },
                        'DEFAULT' => { 'BASEURL' => [] }
                    },
                    'group' => {},
                    'line_ends' => undef,
                    'parms' => {
                        'InternetShortcut' => [ 'URL', 'Modified', 'IconFile', 'IconIndex' ],
                        'DEFAULT' => [ 'BASEURL' ]
                    },
                    'sects' => [ 'DEFAULT', 'InternetShortcut' ],
                    'allowed_comment_char' => ';#',
                    'nocase' => 0,
                    'sCMT' => {
                        'InternetShortcut' => [],
                        'DEFAULT' => []
                    },
                    'cf' => 'Google.url',
                    'firstload' => 0,
                    'file_mode' => '100440',
                    'v' => {
                        'InternetShortcut' => {
                            'Modified' => '8085EA6EC8F6C101DD',
                            'IconIndex' => '1',
                            'IconFile' => 'http://www.google.com/favicon.ico',
                            'URL' => 'http://www.google.com/'
                        },
                        'DEFAULT' => {
                            'BASEURL' => 'http://www.google.com/'
                        }
                    },
                    'imported' => [],
                    'comment_char' => '#',
                    'default' => '',
                    'startup_settings' => {
                        '-file' => 'Google.url'
                    }
                }, 'Config::IniFiles' )
            }
        ]
    }
];  # }}}
is_deeply $c->fetch_items(category => 'Links'), $items, 'fetched favorites items';

__END__

Next is testing of the save_as features...
