use strict;
use warnings;

package Test::File::ShareDir::Object::Inc;
BEGIN {
  $Test::File::ShareDir::Object::Inc::AUTHORITY = 'cpan:KENTNL';
}
{
  $Test::File::ShareDir::Object::Inc::VERSION = '0.3.4';
}

use Class::Tiny {
  tempdir => sub {
    require Path::Tiny;
    require File::Temp;
    my $dir = Path::Tiny::path( File::Temp::tempdir( CLEANUP => 1 ) );
    return $dir->absolute;
  },
  module_tempdir => sub {
    my ($self) = @_;
    my $dir = $self->tempdir->child('auto/share/module');
    $dir->mkpath();
    return $dir->absolute;
  },
  dist_tempdir => sub {
    my ($self) = @_;
    my $dir = $self->tempdir->child('auto/share/dist');
    $dir->mkpath();
    return $dir->absolute;
  },
};

sub add_to_inc {
  my ($self) = @_;
  unshift @INC, $self->tempdir->stringify;
  return;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Test::File::ShareDir::Object::Inc

=head1 VERSION

version 0.3.4

=head1 AUTHOR

Kent Fredric <kentnl@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Kent Fredric <kentnl@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut