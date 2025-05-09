# NAME

Geo::AnomalyDetector - Detect anomalies in geospatial coordinate datasets

# SYNOPSIS

This module analyzes latitude and longitude data points to identify anomalies based on their distance from the mean location.

    use Geo::AnomalyDetector;

    my $detector = Geo::AnomalyDetector->new(threshold => 3);
    my $coords = [ [37.7749, -122.4194], [40.7128, -74.0060], [35.6895, 139.6917] ];
    my $anomalies = $detector->detect_anomalies($coords);
    print 'Anomalies: ', join ', ', map { ($_->[0], $_->[1]) } @{$anomalies};

Each co-ordinate can be either a two element array of \[latitude, longitude\] or an object that has
`latitude` and `longitude` methods.

# VERSION

0.02

# SUBROUTINES/METHODS

## new

Creates a Geo::AnomalyDetecter object.

It takes two optional parameters:

- `threshold`

    A number to hint at what consitutues an anomaly.
    The larger the number,
    the larger the distance to be called an anomaly,
    there will be fewer matches.
    The default is 3.

- `units`

    The unit to be used internally for measurement.
    Can be `M` or `K`.
    The default is `K`,
    this should have no effect on the determination of outliers.

## detect\_anomalies

Identify outlier geographic coordinates based on their distance from the average location of a dataset.

Takes an array reference of coordinate pairs.
Each coordinate can be an array reference \[lat, lon\] or an object with latitude() and longitude() methods.

It returns a reference to an array of coordinates considered anomalous based on their distance from the mean.

# AUTHOR

Nigel Horne, `<njh at nigelhorne.com>`

# BUGS

# SEE ALSO

- [Geo::Location::Point](https://metacpan.org/pod/Geo%3A%3ALocation%3A%3APoint)
- [Math::Trig](https://metacpan.org/pod/Math%3A%3ATrig)

# SUPPORT

This module is provided as-is without any warranty.

Please report any bugs or feature requests to `bug-geo-anomalydetector at rt.cpan.org`,
or through the web interface at
[http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Geo-AnomalyDetector](http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Geo-AnomalyDetector).
I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

You can find documentation for this module with the perldoc command.

    perldoc Geo::AnomalyDetector

You can also look for information at:

- MetaCPAN

    [https://metacpan.org/dist/Geo-AnomalyDetector](https://metacpan.org/dist/Geo-AnomalyDetector)

- RT: CPAN's request tracker

    [https://rt.cpan.org/NoAuth/Bugs.html?Dist=Geo-AnomalyDetector](https://rt.cpan.org/NoAuth/Bugs.html?Dist=Geo-AnomalyDetector)

- CPAN Testers' Matrix

    [http://matrix.cpantesters.org/?dist=Geo-AnomalyDetector](http://matrix.cpantesters.org/?dist=Geo-AnomalyDetector)

- CPAN Testers Dependencies

    [http://deps.cpantesters.org/?module=Geo::AnomalyDetector](http://deps.cpantesters.org/?module=Geo::AnomalyDetector)

# LICENSE AND COPYRIGHT

Copyright 2025 Nigel Horne.

This program is released under the following licence: GPL2
