package Geo::AnomalyDetector;

use strict;
use warnings;
use Statistics::Basic qw(mean stddev);
use Math::Trig qw(great_circle_distance deg2rad);

our $VERSION = '0.01';

sub new {
    my ($class, %args) = @_;
    my $self = {
        threshold => $args{threshold} || 3,
        unit      => $args{unit} || 'kilometers',
    };
    bless $self, $class;
    return $self;
}

sub detect_anomalies {
    my ($self, $coordinates) = @_;
    
    my @distances;
    my $mean_lat = mean(map { $_->[0] } @$coordinates);
    my $mean_lon = mean(map { $_->[1] } @$coordinates);
    
    foreach my $coord (@$coordinates) {
        my ($lat, $lon) = @$coord;
        my $distance = great_circle_distance(
            deg2rad($lon), deg2rad(90 - $lat),
            deg2rad($mean_lon), deg2rad(90 - $mean_lat),
            $self->{unit}
        );
        push @distances, $distance;
    }
    
    my $mean_dist = mean(@distances);
    my $std_dist  = stddev(@distances);
    
    my @anomalies;
    for my $i (0 .. $#distances) {
        if (abs($distances[$i] - $mean_dist) > $self->{threshold} * $std_dist) {
            push @anomalies, $coordinates->[$i];
        }
    }
    
    return \@anomalies;
}

1;
__END__

=head1 NAME

Geo::AnomalyDetector - Detect anomalies in geospatial coordinate datasets

=head1 SYNOPSIS

  use Geo::AnomalyDetector;
  
  my $detector = Geo::AnomalyDetector->new(threshold => 3);
  my $coords = [ [37.7749, -122.4194], [40.7128, -74.0060], [35.6895, 139.6917] ];
  my $anomalies = $detector->detect_anomalies($coords);
  print "Anomalies: " . join ", ", map { "($_->[0], $_->[1])" } @$anomalies;

=head1 DESCRIPTION

This module analyzes latitude and longitude data points to identify anomalies based on their distance from the mean location.

=head1 AUTHOR

Your Name

=head1 LICENSE

This module is released under the same terms as Perl itself.
