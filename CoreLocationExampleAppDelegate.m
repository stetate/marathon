//
//  CoreLocationExampleAppDelegate.m
//  CoreLocationExample
//
//  Created by Matt Tuzzolo on 9/3/10.
//  Copyright iCodeBlog 2010. All rights reserved.
//

#import "CoreLocationExampleAppDelegate.h"
#import "LocationGetter.h"

@implementation CoreLocationExampleAppDelegate


@synthesize lastKnownLocation;


# pragma mark -
# pragma mark LocationGetter Delegate Methods

-(void)lastKnownLocationRunNew{
    // get our physical location
    LocationGetter *locationGetter = [[LocationGetter alloc] init];
    locationGetter.delegate = self;
    [locationGetter startUpdates];
}

- (void)newPhysicalLocation:(CLLocation *)location {
    
    // Store for later use
    self.lastKnownLocation = location;

    // Remove spinner from view
       
    // Alert user
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Found" message:[NSString stringWithFormat:@"Found physical location.  %f %f", self.lastKnownLocation.coordinate.latitude, self.lastKnownLocation.coordinate.longitude] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];

}

@end
