//
//  Marathon_SecondViewController.m
//  marathon
//
//  Created by Stephen Tate on 2013-04-21.
//  Copyright (c) 2013 Stephen Tate. All rights reserved.
//

#import "Marathon_SecondViewController.h"
#import "SunriseAndSunset.h"



@interface Marathon_SecondViewController ()
{
    NSString* dateString;
    
}



@end

@implementation Marathon_SecondViewController


@synthesize currentTime;
@synthesize riseTime;
@synthesize setTime;
@synthesize sunSetNow;


- (void)viewDidLoad
{
    
//    NSDate * current = [Marathon_SecondViewController currentDate];
//    NSTimeZone * currentZone = [Marathon_SecondViewController currentTimeZone];
    
    NSDate * rise1 = [SunriseAndSunset sunriseForDate:[Marathon_SecondViewController currentDate] lat:44.3526 lon:-79.617 timezone:[Marathon_SecondViewController currentTimeZone]];
    
    NSDate *set = [SunriseAndSunset sunsetForDate:[Marathon_SecondViewController currentDate] lat:44.3526 lon:-79.617 timezone:[Marathon_SecondViewController currentTimeZone]];
    
    bool sunSet = [SunriseAndSunset isDarkAtLat:44.3526 lon:-79.617 atTime:[Marathon_SecondViewController currentDate] timezone:[Marathon_SecondViewController currentTimeZone]];
    
    currentTime.text = [Marathon_SecondViewController displayDateasString:[Marathon_SecondViewController currentDate]];
    
    riseTime.text = [Marathon_SecondViewController displayDateasString:rise1];
    
    setTime.text = [Marathon_SecondViewController displayDateasString:set];
    
    if (sunSet) {
        sunSetNow.text = @"sun is asleep";
        
    }
    else
    {
        sunSetNow.text = @"yipee get up sleepy head";
        
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) determineSunPos
{
    
//    NSDate * rise = [SunriseAndSunset sunriseForDate:[Marathon_SecondViewController currentDate] lat:44.3526 lon:-79.617 timezone:[Marathon_SecondViewController currentTimeZone]];
    
    
    
}

+(NSTimeZone *) currentTimeZone
{
    return [NSTimeZone systemTimeZone];
}

+(NSDate*)currentDate
{
    NSDate* date = [NSDate date];
    return date;
}

+(NSString*) displayDateasString: (NSDate*) date
{
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"h:mm aa"];
    NSString *dateTime = [NSString stringWithFormat:@"%@",[outputFormatter stringFromDate:date]];
    return dateTime;
}

@end
