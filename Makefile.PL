use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  VERSION   => '0.01',
  PREREQ_PM => {'PPI' => '1.215'},
  test      => {TESTS => 't/*.t'}
);
