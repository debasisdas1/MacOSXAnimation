//
//  AppDelegate.m
//  CALayerDemo2
//
//  Created by Debasis Das on 27/12/16.
//  Copyright © 2016 Knowstack. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSView *cView = self.window.contentView;
    CALayer *rootLayer = [CALayer layer];
    rootLayer.backgroundColor = [[NSColor blackColor] CGColor];
    rootLayer.bounds = [cView bounds];
    cView.layer = rootLayer;
    [cView setWantsLayer:YES];
    
    
    CALayer *solidColorLayer = [CALayer layer];
    solidColorLayer.backgroundColor = [[NSColor blueColor] CGColor];
    solidColorLayer.bounds = NSMakeRect(40, 40, cView.frame.size.width -80, cView.frame.size.height -80);
    solidColorLayer.position = CGPointMake([cView bounds].size.width / 2.0, [cView bounds].size.height / 2.0);
    solidColorLayer.borderWidth = 3.0;
    solidColorLayer.borderColor = [[NSColor whiteColor] CGColor];
    solidColorLayer.cornerRadius = 15.0;
    [rootLayer addSublayer:solidColorLayer];
    
    CAGradientLayer *gradientLayer;
    gradientLayer = [CAGradientLayer layer];
    
    //Create 2 colors for the gradient
    CGColorRef green = CGColorCreateGenericRGB(0.0, 1.0, 0.0, 1);
    CGColorRef blue = CGColorCreateGenericRGB(0.0, 0.0, 1.0, 1);
    
    //Package the colors in a NSArray and add it to the layer
    NSArray *colors = [NSArray arrayWithObjects:(__bridge id) green, (__bridge id) blue, nil];
    gradientLayer.colors = colors;
    
    //Release the colors
    CGColorRelease(green);
    CGColorRelease(blue);
    
    //Set the size and position of the gradient layer
    gradientLayer.bounds = CGRectMake(0, 0, 500, 300);
    gradientLayer.position = CGPointMake([solidColorLayer bounds].size.width / 2.0, [solidColorLayer bounds].size.height / 2.0);
    gradientLayer.borderWidth = 3.0;
    gradientLayer.borderColor = [[NSColor whiteColor] CGColor];
    gradientLayer.cornerRadius = 15.0;

    [solidColorLayer addSublayer:gradientLayer];


}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
