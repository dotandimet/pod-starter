package Pod::Starter::Extract;
use strict;
use warnings;
use PPI;
use Class::Inspector;
use Class::Load qw(load_class);


sub new {
    my ($class, %args) = @_;
    bless {methods => {}, %args}, ref $class || $class;
}

sub extract {
    my ($self, @classes) = @_;
    @classes = (scalar @classes) ? @classes : @{ $self->{classes} };
    foreach my $class (@classes) {
    load_class($class);
    my $expanded_methods = Class::Inspector->methods($class, 'expanded');
    $self->{'methods'}{$class} = { '__self__' => [], '__base__' => {} };
    foreach my $method (@$expanded_methods) {
        my ($fullname, $package, $name, $code) = @$method;
        if ($package eq $class) {
            push @{$self->{'methods'}{$class}{'__self__'}}, $name;
        }
        else {
            $self->{'methods'}{$class}{'__base__'}{$package} ||= [];
            push @{$self->{'methods'}{$class}{'__base__'}{$package}}, $name;
        }
   }
   }
}

sub class_methods {
    my ($self, $class) = @_;
    return sort @{$self->{'methods'}{$class}{'__self__'}};
}

sub base_classes {
    my ($self, $class) = @_;
    return sort keys %{$self->{'methods'}{$class}{'_base__'}};
}

sub inherited_methods {
    my ($self, $class, $base) = @_;
    return sort @{$self->{'methods'}{$class}{'_base__'}{$base}};
}

1;




