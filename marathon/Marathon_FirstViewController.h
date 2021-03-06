//
//  Marathon_FirstViewController.h
//  marathon
//
//  Created by Stephen Tate on 2013-04-21.
//  Copyright (c) 2013 Stephen Tate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationGetter.h"
#import <MapKit/MapKit.h>

@interface Marathon_FirstViewController : UIViewController <CLLocationManagerDelegate>

{
    CLLocationManager *LocationManager;
    __weak IBOutlet MKMapView *instantMap;
}

@property (retain, nonatomic) CLLocationManager *locationManager;
@property (nonatomic, retain) CLLocation *lastKnownLocation;
@property (weak, nonatomic) IBOutlet UITextField *longitude;
@property (weak, nonatomic) IBOutlet UITextField *latitude;
@property (weak, nonatomic) IBOutlet MKMapView *instantMap;



-(void)newPhysicalLocation:(CLLocation *)location;

@end
