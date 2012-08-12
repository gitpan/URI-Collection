package URI::Collection;
BEGIN {
  $URI::Collection::AUTHORITY = 'cpan:GENE';
}
# ABSTRACT: RETIRED Input and output link collections in different formats

our $VERSION = '0.0802_1';

1;

=head1 NAME

URI::Collection - RETIRED Input and output link collections in different formats

=head1 SYNOPSIS

  use Something::Else qw(:for_now);

=head1 DESCRIPTION

C<URI::Collection> is a module that used to input and output link collections in
different formats.  That was before JSON emerged.

I'll have to re-visit this, handle "all versions of all possible browsers" and
intelligently munge bookmarks (e.g. deduplicated by category).

=head1 AUTHOR

Gene Boggs E<lt>gene@cpan.orgE<gt>

=head1 COPYRIGHT

Copyright 2012, Gene Boggs

=head1 LICENSE

This program is free software; you can redistribute or modify it under the same
terms as Perl itself.

=cut
