//
//  ForecastViewController.m
//  WeatherCatcher
//
//  Created by Daniel Breves Ferreira on 23/08/17.
//  Copyright © 2017 Daniel Breves Ferreira. All rights reserved.
//

#import "ForecastViewController.h"
#import "ForecastService.h"

static CGFloat const kCardCornerRadius = 4.0f;
static CGFloat const kCardShadowRadius = 2.0f;
static CGFloat const kCardShadowOpacity = 2.0f;
static CGFloat const kCardShadowOffsetX = 0;
static CGFloat const kCardShadowOffsetY = 1;
static CGFloat const kAnimationDuration = 0.5f;

@interface ForecastViewController ()

@end

@implementation ForecastViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self adjustButtonLayout];
    [self callForecast];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)callForecast {
    
    [self hideLabels];
    [self.activityIndicator startAnimating];
    ForecastService *forecastService = [ForecastService new];
    [forecastService getCurrentForecastSuccess:^(NSDictionary *response) {
        [self setValuesToLabels:response];
        [self.activityIndicator stopAnimating];
        [self showLabels];
    } Error:^(NSInteger response) {
        NSLog(@"%ld", (long)response);
        [self.activityIndicator stopAnimating];
        self.errorMessage.alpha = 1;
    }];
}

- (void)setValuesToLabels:(NSDictionary *)forecastData {
    
    NSNumber *temperature = [[forecastData objectForKey:@"main"] objectForKey:@"temp"];
    [self setBackgroundImageByTemperature:temperature];
    self.temperatureLabel.text = [NSString stringWithFormat:@"%ld °C",[temperature integerValue]];
    self.cityNameLabel.text = [forecastData objectForKey:@"name"];
    self.countryNameLabel.text = [[forecastData objectForKey:@"sys"] objectForKey:@"country"];
}

- (void)hideLabels {
    
    self.countryNameLabel.alpha = 0;
    self.cityNameLabel.alpha = 0;
    self.temperatureLabel.alpha = 0;
    self.refreshButton.alpha = 0;
    self.errorMessage.alpha = 0;
}

- (void)showLabels {
    
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.countryNameLabel.alpha = 1;
        self.cityNameLabel.alpha = 1;
        self.temperatureLabel.alpha = 1;
        self.refreshButton.alpha = 1;
    }];
}

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

- (void)adjustButtonLayout {
    
    self.refreshButton.layer.cornerRadius = kCardCornerRadius;
    self.refreshButton.layer.shadowColor = [UIColor grayColor].CGColor;
    self.refreshButton.layer.masksToBounds = NO;
    self.refreshButton.layer.shadowOffset = CGSizeMake(kCardShadowOffsetX, kCardShadowOffsetY);
    self.refreshButton.layer.shadowRadius = kCardShadowRadius;
    self.refreshButton.layer.shadowOpacity = kCardShadowOpacity;
}

- (IBAction)refreshForecast:(id)sender {
    
    [self callForecast];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
