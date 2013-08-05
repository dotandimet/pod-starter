use Test::More;
use Pod::Starter::Template;

my $str = Pod::Starter::Template->fill(
{
  CLASS => 'Foo::Bar',
  BRIEF => 'who you gonna bar?',
  SYNOPSIS => <<'EOT',
  use Foo::Bar;

  my $a = Foo::Bar->fing();
  print "Got $a for this fing\n";

# in another file:

  use Foo::Bar;

  my $b = Foo::Bar->fang('skeedoo');

EOT

  DESCRIPTION => 'The module for doing stuff',

  METHODS => [{ name => 'fing', description => "Does it's own fing" }, { name => 'fang', description => 'Does another fang' }]
}
);



done_testing();
