package RT::Extension::AutoLink;
use strict;
use warnings;
use Regexp::Common qw(URI);

our $VERSION = '0.01';

no warnings 'redefine';
use RT::Ticket;
my $orig = RT::Ticket->can('_RecordNote');
*RT::Ticket::_RecordNote = sub {
    my $self = shift;
    my %args = @_;

    my @ret = $self->$orig(@_);

    $self->AddRefersToLinksFromText($args{Content} || $args{MIMEObj}->stringify_body);

    return @ret;
};

sub RT::Ticket::AddRefersToLinksFromText {
    my $self = shift;
    my $text = shift;

    while ($text =~ /($RE{URI}{HTTP}{-keep}{-scheme => 'https?'}(?:#\S+)?)/g) {
        $self->AddLink(
            Target => $1,
            Type   => 'RefersTo',
        );
    }
}


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

