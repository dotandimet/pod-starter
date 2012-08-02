use strict;
use warnings;
use Test::More;
use FindBin;
diag $FindBin::Bin;
use_ok('Pod::Starter');

my $ps = Pod::Starter->new($FindBin::Bin . '/../lib/Pod/Starter.pm');
is_deeply($ps->methods, ['new', 'methods', 'exports'], 'methods ok');



done_testing();
