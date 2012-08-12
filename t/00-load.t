#!perl -T
use strict;
use warnings;
use Test::More 'no_plan';
BEGIN { use_ok( 'URI::Collection' ) }
diag("Testing URI::Collection $URI::Collection::VERSION, Perl $], $^X");
