#!/usr/bin/perl -w
use strict;
use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME' => 'URI::Collection',
    'VERSION_FROM' => 'lib/URI/Collection.pm',
    'PREREQ_PM' => {
        'File::Spec' => 0,
        'File::Find' => 0,
        'File::Path' => 0,
        'IO::String' => 0,
        'Config::IniFiles' => 0,
        'Netscape::Bookmarks' => '2.0_01',
        # NOTE: Prereq of Netscape::Bookmarks but not included in the Makefile.
        'HTTP::SimpleLinkChecker' => '1.08',
        # NOTE: The disro of Module::Info (which is a prereq) is totally broken but can be rebuilt by hand...
    },
    ($] >= 5.005
        ? (ABSTRACT_FROM => 'lib/URI/Collection.pm',
           AUTHOR => 'Gene Boggs <gene@cpan.org>')
        : ()),
);
