use Test::More qw(no_plan);

my $extract = 'Pod::Starter::Extract';
use_ok($extract);
my $e = $extract->new;
$e->extract($extract);
is_deeply([$e->class_methods($extract)], [qw(base_classes class_methods extract inherited_methods load_class new)], 'class methods');
ok(scalar $e->base_classes($extract) == 0, 'no base classes');
# $e = $c->new; $e->extract($c); print join q{ }, $e->class_methods($c), ( map
# { $_, q{:}, $e->inherited_methods($_) } $e->base_classes($c) ), qq{\n};'

