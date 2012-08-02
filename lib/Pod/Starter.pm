package Pod::Starter;
use strict;
use warnings;
use PPI;
use Class::Inspector;

sub new {
  my ($class, $file) = @_;
  bless {doc  => PPI::Document->new($file) }, $class;
}

sub methods {
  my ($self) = @_;
  my $sub_nodes =
  $self->{doc}->find(
      sub { $_[1]->isa('PPI::Statement::Sub') and $_[1]->name }
         );
  return [ map { $_->name } @$sub_nodes ];
}

sub exports {

}

1;
