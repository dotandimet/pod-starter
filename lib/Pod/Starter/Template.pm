package Pod::Starter::Template;
use strict;
use warnings;

use Template;

sub fill {
    my ($self, $class_desc) = @_;
    my $tt = new Template(  );
    $tt->process( \*Pod::Starter::Template::DATA, $class_desc, \my $output) || die "Error: ", $tt->error, "\n\n", $tt->error->info;
    return $output;
}



1;
__DATA__

=head1 NAME

[% CLASS %][% IF BRIEF %] - [% BRIEF %][% END %]


=head1 SYNOPSIS

[% SYNOPSIS %]

=head1 DESCRIPTION

[% DESCRIPTION %]


[% IF FUNCTIONS && FUNCTIONS.size() > 0 %]
=head1 FUNCTIONS

L<[% CLASS %]> exports the following functions.

[% FOREACH func = FUNCTIONS %]
=head2 C<[% func.name %]>

[% func.description %]
[% END %]
[% END %]

[% IF METHODS && METHODS.size() > 0 %]

=head1 METHODS

L<[% CLASS %]> implements the following methods.

[% FOREACH func = METHODS %]

=head2 C<[% func.name %]>

[% func.description %]
[% END %]
[% END %]

=head1 DEBUGGING

Debugging into

=head1 SEE ALSO

L<Other::cool::module>.

=cut

