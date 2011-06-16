package RT::Extension::AutoLink;
use strict;
use warnings;

our $VERSION = '0.01';

1;

__END__

=head1 NAME

RT::Extension::AutoLink - automatically add RefersTo links for URLs in messages

=head1 INSTALLATION

    perl Makefile.PL
    make
    make install

    # edit RT_SiteConfig.pm to modify your Set(@Plugins, ...) line to
    # include RT::Extension::AutoLink

=head1 AUTHORS

Shawn M Moore C<< <sartak@bestpractical.com> >>

=cut

