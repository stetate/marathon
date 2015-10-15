//
//  CoreLocationExampleAppDelegate.h
//  CoreLocationExample
//
//  Created by Matt Tuzzolo on 9/3/10.
//  Copyright iCodeBlog 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationGetter.h"

@class CoreLocationExampleViewController;

@interface CoreLocationExampleAppDelegate : NSObject <UIApplicationDelegate, LocationGetterDelegate> {
    CLLocation *lastKnownLocation;
}
-(void)lastKnownLocationRunNew;

@property (nonatomic, retain) CLLocation *lastKnownLocation;

@end

