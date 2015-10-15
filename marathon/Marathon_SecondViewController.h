//
//  Marathon_SecondViewController.h
//  marathon
//
//  Created by Stephen Tate on 2013-04-21.
//  Copyright (c) 2013 Stephen Tate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SunriseAndSunset.h"    

@interface Marathon_SecondViewController : UIViewController
{
    __weak IBOutlet UILabel *currentTime;
    
    __weak IBOutlet UILabel *riseTime;
    
    __weak IBOutlet UILabel *setTime;
    
    __weak IBOutlet UILabel *sunSetNow;
}

+(NSDate*)currentDate;
+(NSTimeZone *) currentTimeZone;
+(NSString*) displayDateasString: (NSDate*) date;

-(void) determineSunPos;


@property (weak, nonatomic) IBOutlet UILabel *currentTime;
@property (weak, nonatomic) IBOutlet UILabel *riseTime;
@property (weak, nonatomic) IBOutlet UILabel *setTime;
@property (weak, nonatomic) IBOutlet UILabel *sunSetNow;


@end
