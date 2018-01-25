use v6;

use Test;

use-ok('Supply::Timeout');

my $sup = Supply::Timeout.new;

isa-ok($sup, 'Supply::Timeout');

done-testing;
