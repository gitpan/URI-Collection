use 5.005;
use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'         => 'URI::Collection',
    'VERSION_FROM' => 'Collection.pm',
    'PREREQ_PM'    => {},
    ($] >= 5.005
        ? (ABSTRACT_FROM => 'Collection.pm',
           AUTHOR        => 'Gene Boggs <cpan@ology.net>')
        : ()),
);
