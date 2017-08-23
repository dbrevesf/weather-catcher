//
//  ForecastService.m
//  WeatherCatcher
//
//  Created by Daniel Breves Ferreira on 23/08/17.
//  Copyright © 2017 Daniel Breves Ferreira. All rights reserved.
//

#import "ForecastService.h"

@implementation ForecastService

/* This method realizes the request to the OpenWeather service in order to obtain the temperature 
 * according to the user's location.
 */
- (void)getCurrentForecastSuccess:(ForecastServiceSuccess)success Error:(ForecastServiceError)error{
    
    LocationService *locationService = [LocationService new];
    NSDictionary *location = [locationService getCurrentLocation];
    NSNumber *latitude = [location objectForKey:kLatitudeKey];
    NSNumber *longitude = [location objectForKey:kLongitudeKey];
    NSString *openWeatherUrlWithParams = [NSString stringWithFormat:kParamsOpenWeatherURL, kOpenWeatherURL, latitude, longitude, kOpenWeatherApiKey];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:openWeatherUrlWithParams parameters:nil progress:nil
         success:^(NSURLSessionTask *task, id responseObject) {
             success(responseObject);
         }
         failure:^(NSURLSessionTask *operation, NSError *serviceError) {
             error(serviceError.code);
    }];
}






@end
