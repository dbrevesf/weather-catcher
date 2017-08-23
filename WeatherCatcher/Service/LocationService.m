//
//  LocationService.m
//  WeatherCatcher
//
//  Created by Daniel Breves Ferreira on 23/08/17.
//  Copyright © 2017 Daniel Breves Ferreira. All rights reserved.
//

#import "LocationService.h"

@implementation LocationService

- (NSDictionary *)getCurrentLocation {
    
    CLLocationManager *locationManager = [CLLocationManager new];
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    locationManager.distanceFilter = 1000;
    [locationManager startUpdatingLocation];
    NSNumber *latitude = [NSNumber numberWithDouble:locationManager.location.coordinate.latitude];
    NSNumber *longitude = [NSNumber numberWithDouble:locationManager.location.coordinate.longitude];
    NSDictionary *location = @{kLatitudeKey:latitude,kLongitudeKey:longitude};
    return location;
}

@end
