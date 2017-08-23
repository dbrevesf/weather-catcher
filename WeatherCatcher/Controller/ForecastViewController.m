//
//  ForecastViewController.m
//  WeatherCatcher
//
//  Created by Daniel Breves Ferreira on 23/08/17.
//  Copyright © 2017 Daniel Breves Ferreira. All rights reserved.
//

#import "ForecastViewController.h"
#import "ForecastService.h"

@interface ForecastViewController ()

@end

@implementation ForecastViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self adjustButtonLayout];
    [self callForecast];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

/* This method calls the service to obtain the temperature based on the user's location.
 * Besides that, it hides all the UI components and shows an activiry indicator which
 * works as a working feedback to the user. After the service ends, the componets are shown
 * again.
 */
- (void)callForecast {
    
    [self hideLabels];
    [self.activityIndicator startAnimating];
    ForecastService *forecastService = [ForecastService new];
    [forecastService getCurrentForecastSuccess:^(NSDictionary *response) {
        [self setValuesToLabels:response];
        [self.activityIndicator stopAnimating];
        [self showLabels];
    } Error:^(NSInteger response) {
        [self.activityIndicator stopAnimating];
        self.errorMessage.alpha = 1;
        self.refreshButton.alpha = 1;
    }];
}

/* This method set the values to the labels. It receives a NSDictionary as a parameter
 * containing all the forecast data from the service. Then, it obtain the specific data
 * and put it in the determined label.
 */
- (void)setValuesToLabels:(NSDictionary *)forecastData {
    
    NSNumber *temperature = [[forecastData objectForKey:kMainKey] objectForKey:kTempKey];
    [self setBackgroundImageByTemperature:temperature];
    self.temperatureLabel.text = [NSString stringWithFormat:@"%ld °C",(long)[temperature integerValue]];
    self.cityNameLabel.text = [forecastData objectForKey:kNameKey];
    self.countryNameLabel.text = [[forecastData objectForKey:kSysKey] objectForKey:kCountryKey];
}

/* This method hides the labels and it's called when the forecast service is running in order 
 * to show the activity indicator.
 */
- (void)hideLabels {
    
    self.countryNameLabel.alpha = 0;
    self.cityNameLabel.alpha = 0;
    self.temperatureLabel.alpha = 0;
    self.refreshButton.alpha = 0;
    self.errorMessage.alpha = 0;
}

/* This method shows the labels after the service is finished. It's shown with animation 
 * so the transition between a request becomes more visually enjoyable.
 */
- (void)showLabels {
    
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.countryNameLabel.alpha = 1;
        self.cityNameLabel.alpha = 1;
        self.temperatureLabel.alpha = 1;
        self.refreshButton.alpha = 1;
    }];
}

/* This method changes the background color according to the temperature. It was made to turn the
 * temperature changes more visible to the user. Not only the temperature value changes. The 
 * background color changes as well.
 */
- (void)setBackgroundImageByTemperature:(NSNumber *)temperature {
    
    CGFloat floatTemperature = [temperature floatValue];
    UIColor *backgroundColor = [UIColor whiteColor];
    if(floatTemperature < 0) {
        backgroundColor = [UIColor blueColor];
    } else if (floatTemperature >= 0 && floatTemperature < 10) {
        backgroundColor = [UIColor whiteColor];
    } else if (floatTemperature >= 10 && floatTemperature < 20) {
        backgroundColor = [UIColor yellowColor];
    } else if (floatTemperature >=20 && floatTemperature < 30) {
        backgroundColor = [UIColor orangeColor];
    } else if (floatTemperature >= 30 && floatTemperature < 40) {
        backgroundColor = [UIColor redColor];
    } else {
        backgroundColor = [UIColor magentaColor];
    }
    self.view.backgroundColor = backgroundColor;
}

/* This method sets the shadow and the corner to the refresh button.
 */
- (void)adjustButtonLayout {
    
    self.refreshButton.layer.cornerRadius = kCardCornerRadius;
    self.refreshButton.layer.shadowColor = [UIColor grayColor].CGColor;
    self.refreshButton.layer.masksToBounds = NO;
    self.refreshButton.layer.shadowOffset = CGSizeMake(kCardShadowOffsetX, kCardShadowOffsetY);
    self.refreshButton.layer.shadowRadius = kCardShadowRadius;
    self.refreshButton.layer.shadowOpacity = kCardShadowOpacity;
}


/* This method calls the forecast service to refresh the temperature value
 */
- (IBAction)refreshForecast:(id)sender {
    
    [self callForecast];
}

@end
