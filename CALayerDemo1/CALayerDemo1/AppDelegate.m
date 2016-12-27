//
//  AppDelegate.m
//  CALayerDemo1
//
//  Created by Debasis Das on 26/12/16.
//  Copyright © 2016 Knowstack. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSView *view1;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    

}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

-(void)awakeFromNib{
    CALayer *rootLayer = [CALayer layer];
    rootLayer.backgroundColor = [[NSColor whiteColor] CGColor];
    rootLayer.bounds = [self.view1 bounds];
    rootLayer.cornerRadius = 10.0;
    rootLayer.borderColor = [[NSColor redColor] CGColor];
    rootLayer.borderWidth = 10.0;
    rootLayer.shadowOpacity = 1.0;
    rootLayer.shadowRadius = 10.0;
    self.view1.layer = rootLayer;
    [self.view1 setWantsLayer:YES];
    
}

-(IBAction)changeColor:(id)sender{
    self.view1.layer.backgroundColor = [[NSColor colorWithRed:randFloat() green:randFloat() blue:randFloat() alpha:1.0] CGColor];
}

-(IBAction)changeBorderWidth:(id)sender{
    [self.view1.layer setBorderWidth:([self.view1.layer borderWidth] >= 10.0 ? 0.0 : 10.0)];
}

-(IBAction)changeBorderColor:(id)sender{
    self.view1.layer.borderColor = [[NSColor colorWithRed:randFloat() green:randFloat() blue:randFloat() alpha:1.0] CGColor];
    
}

-(IBAction)changeSize:(id)sender{
    CGRect layerBounds = self.view1.layer.bounds;
    layerBounds.size.height = (layerBounds.size.height == 200.0) ? 320.0 : 200.0;
    [self.view1.layer setBounds:layerBounds];
    
 }

-(IBAction)changeCornerRadius:(id)sender{
    self.view1.layer.cornerRadius = (self.view1.layer.cornerRadius == 10.0)? 20:10;
}

-(IBAction)changeOpacity:(id)sender{
    self.view1.layer.opacity = (self.view1.layer.opacity == 1.0)? 0.5:1.0;
}

-(IBAction)toggleShadow:(id)sender{
    self.view1.layer.shadowOpacity = (self.view1.layer.shadowOpacity == 1.0)?0.0:1.0;
    self.view1.layer.shadowRadius = (self.view1.layer.shadowRadius == 10.0)?0.0:10.0;
    
}

-(IBAction)changeAll:(id)sender{
    [self changeColor:self];
    [self changeBorderWidth:self];
    [self changeSize:self];
    [self changeCornerRadius:self];
    [self changeOpacity:self];
    [self toggleShadow:self];
    
}

float randFloat() {
    return (random() % 1001) / 1000.0f;
}

@end
