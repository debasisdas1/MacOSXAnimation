//
//  AppDelegate.m
//  AnalogClock
//
//  Created by Debasis Das on 31/12/16.
//  Copyright © 2016 Knowstack. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
{
    CALayer *hourLayer;
    CALayer *minuteLayer;
    CALayer *secondsLayer;
}
@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    CALayer *layer = [CALayer layer];
    layer.frame = [self.window.contentView frame];
    layer.contents = [NSImage imageNamed:@"ClockFace"];
    [self.window.contentView setLayer:layer];
    [self.window.contentView setWantsLayer:YES];
    
    //Draw the hours layer
    hourLayer = [CALayer layer];
    hourLayer.backgroundColor = [[NSColor blackColor] CGColor];
    hourLayer.anchorPoint = CGPointMake(0.5, 0);
    hourLayer.position = CGPointMake(self.window.contentView.frame.size.width/2, self.window.contentView.frame.size.height/2);
    hourLayer.bounds = CGRectMake(0, 0, 10, self.window.contentView.frame.size.width/2 -100);
    [layer addSublayer:hourLayer];

    minuteLayer = [CALayer layer];
    minuteLayer.backgroundColor = [[NSColor blueColor] CGColor];
    minuteLayer.anchorPoint = CGPointMake(0.5, 0);
    minuteLayer.position = CGPointMake(self.window.contentView.frame.size.width/2, self.window.contentView.frame.size.height/2);
    minuteLayer.bounds = CGRectMake(0, 0, 6, self.window.contentView.frame.size.width/2 -50);
    [layer addSublayer:minuteLayer];

    secondsLayer = [CALayer layer];
    secondsLayer.backgroundColor = [[NSColor redColor] CGColor];
    secondsLayer.anchorPoint = CGPointMake(0.5, 0);
    secondsLayer.position = CGPointMake(self.window.contentView.frame.size.width/2, self.window.contentView.frame.size.height/2);
    secondsLayer.bounds = CGRectMake(0, 0, 3, self.window.contentView.frame.size.width/2 -20);
    [layer addSublayer:secondsLayer];

    //Place the hands at correct location
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour fromDate:[NSDate date]];
    
    NSInteger seconds = dateComponents.second;
    NSInteger minutes = dateComponents.minute;
    NSInteger hours = dateComponents.hour;
    
    CGFloat hourAngle = (hours * (360/12)) + (minutes * (1.0/60) * (360/12));
    CGFloat minuteAngle = minutes * (360/60);
    CGFloat secondsAngle = seconds * 360/60;

    
    hourLayer.transform = CATransform3DMakeRotation(hourAngle /180 *M_PI, 0, 0, 1);
    minuteLayer.transform = CATransform3DMakeRotation(minuteAngle /180 *M_PI, 0, 0, 1);
    secondsLayer.transform = CATransform3DMakeRotation(secondsAngle /180 *M_PI, 0, 0, 1);
    
    CABasicAnimation *secondsAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    secondsAnimation.repeatCount = HUGE_VALF;
    secondsAnimation.duration = 60;
    secondsAnimation.removedOnCompletion = NO;
    secondsAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    secondsAnimation.fromValue = @(secondsAngle * M_PI / 180);
    secondsAnimation.byValue = @(-2 * M_PI);
    [secondsLayer addAnimation:secondsAnimation forKey:@"SecondAnimationKey"];

    CABasicAnimation *minutesAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    minutesAnimation.repeatCount = HUGE_VALF;
    minutesAnimation.duration = 60*60;
    minutesAnimation.removedOnCompletion = NO;
    minutesAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    minutesAnimation.fromValue = @(-minuteAngle * M_PI / 180);
    minutesAnimation.byValue = @(-2 * M_PI);
    [minuteLayer addAnimation:minutesAnimation forKey:@"MinutesAnimationKey"];

    CABasicAnimation *hoursAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    hoursAnimation.repeatCount = HUGE_VALF;
    hoursAnimation.duration = 60*60*12;
    hoursAnimation.removedOnCompletion = NO;
    hoursAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    hoursAnimation.fromValue = @(-hourAngle * M_PI / 180);
    hoursAnimation.byValue = @(-2 * M_PI);
    [hourLayer addAnimation:hoursAnimation forKey:@"HoursAnimationKey"];


}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
