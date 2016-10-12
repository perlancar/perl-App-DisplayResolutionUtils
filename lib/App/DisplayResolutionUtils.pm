package App::DisplayResolutionUtils;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our %SPEC;

$SPEC{list_display_resolution_names} = {
    v => 1.1,
    summary => 'List known display resolution names',
    args => {
        query => {
            schema => 'str*',
            pos => 0,
        },
    },
    result => {
        schema => ['hash*', of=>'str*'],
    },
    result_naked => 1,
};
sub list_display_resolution_names {
    require Display::Resolution;

    my %args = @_;

    my $q = lc($args{query} // '');

    my $res0 = Display::Resolution::list_display_resolution_names();
    my $res = {};

    for (keys %$res0) {
        if (length $q) {
            next unless index(lc($_), $q) >= 0 ||
                index(lc($res0->{$_}), $q) >= 0;
        }
        $res->{$_} = $res0->{$_};
    }

    $res;
}

1;
# ABSTRACT: CLI utilities related to display resolution

=head1 DESCRIPTION

This distribution includes several utilities:

#INSERT_EXECS_LIST


=head1 SEE ALSO

L<Display::Resolution>
