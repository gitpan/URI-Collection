use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME' => 'URI::Collection',
    'VERSION_FROM' => 'lib/URI/Collection.pm',
    'PREREQ_PM' => {
        'Carp' => 0,
        'Cwd' => 0,
        'File::Spec' => 0,
        'File::Find' => 0,
        'File::Path' => 0,
        'Config::IniFiles' => 0,
        'Netscape::Bookmarks::Link' => 1.1,
    },
    ($] >= 5.005
        ? (ABSTRACT_FROM => 'lib/URI/Collection.pm',
           AUTHOR => 'Gene Boggs <gene@cpan.org>')
        : ()),
);
