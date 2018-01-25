use v6;

module Supply::Timeout:ver<0.0.1>:auth<cono "q@cono.org.ua"> { ... }

class X::Supply::Timeout is Exception {
    method message { "Timed out" }
}

class Supply::Timeout {
    has Supply $.supply;
    has $.timeout;

    method new(:$supply = Supply.interval(0.1), :$timeout = 15) {}

    method Supply(--> Supply) {
        supply {
            my $last = now;
            whenever $!supply {
                $last = now;
                emit $_
            }
            whenever Supply.interval(0.1) {
                if now - $last > $!timeout {
                    X::Supply::Timeout.new.throw;
                }
            }
        }
    }
}
