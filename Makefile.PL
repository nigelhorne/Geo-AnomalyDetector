use ExtUtils::MakeMaker;

WriteMakefile(
    NAME         => 'Geo::AnomalyDetector',
    VERSION_FROM => 'lib/Geo/AnomalyDetector.pm',
    AUTHOR       => 'Nigel Horne <njh@nigelhorne.com>',
    ABSTRACT     => 'Detect anomalies in geospatial coordinate datasets',
    LICENSE      => 'perl',
    PREREQ_PM    => {
        'Statistics::Basic' => 0,
        'Math::Trig'        => 0,
    },
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 6.64,
    },
    TEST_REQUIRES => {
    	'Test::Most' => 0,
    },
    dist => {
        COMPRESS => 'gzip -9f',
        SUFFIX   => 'gz',
    },
    clean => {
        FILES => 'Geo-AnomalyDetector-*'
    },
);
