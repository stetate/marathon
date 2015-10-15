//
//  Marathon_mapViewViewController.h
//  marathon
//
//  Created by Parents on 2013-04-24.
//  Copyright (c) 2013 Stephen Tate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface Marathon_mapViewViewController : UIViewController
{
    CLLocation* gpsLocation;
    IBOutlet MKMapView* mapView;
}

@property (strong, nonatomic) CLLocation *gpsLocation;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

-(void)setLocation:(CLLocation *)location;

@end
