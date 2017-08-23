//
//  LocationService.h
//  WeatherCatcher
//
//  Created by Daniel Breves Ferreira on 23/08/17.
//  Copyright © 2017 Daniel Breves Ferreira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import <CoreLocation/CoreLocation.h>

@interface LocationService : NSObject

- (NSDictionary *)getCurrentLocation;

@end
