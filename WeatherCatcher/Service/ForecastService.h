//
//  ForecastService.h
//  WeatherCatcher
//
//  Created by Daniel Breves Ferreira on 23/08/17.
//  Copyright © 2017 Daniel Breves Ferreira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocationService.h"
#import <AFNetworking.h>

typedef void (^ForecastServiceSuccess)(NSDictionary *response);
typedef void (^ForecastServiceError)(NSInteger response);

@interface ForecastService : NSObject

- (void)getCurrentForecastSuccess:(ForecastServiceSuccess)success Error:(ForecastServiceError)error;

@end
