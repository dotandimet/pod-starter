#!/usr/bin/env perl

use Class::Load qw(load_class);
use Class::Inspector;
use Data::Dumper;

my $class = shift;
load_class($class);
my $methods = Class::Inspector->methods($class, q(expanded));
my $functions = Class::Inspector->functions($class);
foreach my $meth (@$methods) {
    $packages{$meth[1]} ||= {};
    $packages{$meth[1]}{$meth[2]} ||= $meth[0];
}

foreach my $clz (keys %packages) {
    
}
print Dumper([sort map { @{]);
