//
//  ForecastViewController.h
//  WeatherCatcher
//
//  Created by Daniel Breves Ferreira on 23/08/17.
//  Copyright © 2017 Daniel Breves Ferreira. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForecastViewController : UIViewController

@property (assign, nonatomic) NSString *temperature;
@property (assign, nonatomic) NSString *locationName;
@property (weak, nonatomic) IBOutlet UILabel *countryNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *errorMessage;
@property (weak, nonatomic) IBOutlet UIButton *refreshButton;

@end
