//
//  Marathon_mapViewViewController.m
//  marathon
//
//  Created by Parents on 2013-04-24.
//  Copyright (c) 2013 Stephen Tate. All rights reserved.
//

#import "Marathon_mapViewViewController.h"
#define METERS_PER_MILE 1609.344
//1609.344

@class Marathon_mapViewViewController;
@interface Marathon_mapViewViewController ()
{

}
@property (nonatomic, strong) CLLocationManager *locationManager;
@end

@implementation Marathon_mapViewViewController

@synthesize mapView = _mapView;

@synthesize gpsLocation;

//-(void)setLocation:(CLLocation *)location;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)requestAlwaysAuthorization
{
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    NSLog(@"just authorizing");
    // If the status is denied or only granted for when in use, display an alert
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse || status ==        kCLAuthorizationStatusDenied) {
        NSString *title;
        title = (status == kCLAuthorizationStatusDenied) ? @"Location services are off" :   @"Background location is not enabled";
        NSString *message = @"To use background location you must turn on 'Always' in the Location Services Settings";
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                            message:message
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:@"Settings", nil];
        [alertView show];
    }
    // The user has not enabled any location services. Request background authorization.
    else if (status == kCLAuthorizationStatusNotDetermined) {
        [self.locationManager requestAlwaysAuthorization];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        // Send the user to the Settings for this app
        NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication] openURL:settingsURL];
    }
}

-(void)setLocation:(CLLocation *)location
{
    
    
    self.gpsLocation = location;
    [self.mapView setCenterCoordinate:[location coordinate]];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self requestAlwaysAuthorization];
    
    CLLocationCoordinate2D zoomLocation = [self.gpsLocation coordinate];
    
    NSLog(@"This is what the map recieved lat = %f long= %f", zoomLocation.longitude, zoomLocation.latitude);
    
    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(self.gpsLocation.coordinate, 100, 100)];
    

}


-(void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    if (gpsLocation.coordinate.latitude == 0.000) {
        NSLog(@"your not pasing anything in ");
        
    }


}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

