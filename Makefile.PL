use 5.005;
use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'         => 'URI::Collection',
    'VERSION_FROM' => 'Collection.pm',
    'PREREQ_PM'    => {
        'Carp' => 0,
        'Cwd' => 0,
        'File::Spec' => 0,
        'File::Find' => 0,
        'File::Path' => 0,
        'Config::IniFiles' => 0,
        'Netscape::Bookmarks::Alias' => 0,
    },
    ($] >= 5.005
        ? (ABSTRACT_FROM => 'Collection.pm',
           AUTHOR        => 'Gene Boggs <cpan@ology.net>')
        : ()),
);
