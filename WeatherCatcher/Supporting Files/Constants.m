//
//  Constants.m
//  WeatherCatcher
//
//  Created by Daniel Breves Ferreira on 23/08/17.
//  Copyright © 2017 Daniel Breves Ferreira. All rights reserved.
//

#import "Constants.h"

@implementation Constants

NSString *const kLatitudeKey = @"latitude";
NSString *const kLongitudeKey = @"longitude";
NSString *const kOpenWeatherURL = @"http://api.openweathermap.org/data/2.5/weather";
NSString *const kParamsOpenWeatherURL = @"%@?lat=%@&lon=%@&APPID=%@&units=metric";
NSString *const kOpenWeatherApiKey = @"";
NSString *const kMainKey = @"main";
NSString *const kTempKey = @"temp";
NSString *const kNameKey = @"name";
NSString *const kSysKey = @"sys";
NSString *const kCountryKey = @"country";

CGFloat const kCardCornerRadius = 4.0f;
CGFloat const kCardShadowRadius = 2.0f;
CGFloat const kCardShadowOpacity = 2.0f;
CGFloat const kCardShadowOffsetX = 0;
CGFloat const kCardShadowOffsetY = 1;
CGFloat const kAnimationDuration = 0.5f;

@end
