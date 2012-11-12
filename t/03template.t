#use Test::More qw(no_plan);
use Pod::Starter::Template;

print Pod::Starter::Template->fill(
{
  CLASS => 'Foo::Bar',
  METHODS => [{ name => 'fing' }, { name => 'fang' }]
}
);
