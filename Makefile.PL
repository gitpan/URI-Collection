use 5.005;
use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'         => 'URI::Collection',
    'VERSION_FROM' => 'Collection.pm',
    'PREREQ_PM'    => {
        'Cwd'                 => 2.06,
        'File::Find'          => 1.04,
        'File::Path'          => 1.05,
        'Config::IniFiles'    => 2.37,
        'Netscape::Bookmarks' => 1.2,
    },
    ($] >= 5.005
        ? (ABSTRACT_FROM => 'Collection.pm',
           AUTHOR        => 'Gene Boggs <cpan@ology.net>')
        : ()),
);
