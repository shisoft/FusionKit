//
//  WFAppDelegate.m
//  WebFusion
//
//  Created by Maxthon Chan on 13-3-4.
//
//

#import "WFAppDelegate.h"

@implementation WFAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![[defaults objectForKey:@"server"] length])
        [defaults setObject:@"https://www.shisoft.net/ajax" forKey:@"server"];
    [defaults synchronize];
    
    // Show the initial window.
    self.windowControllers = [NSMutableArray array];
    [self showWindowController:[[WFLoginWindowController alloc] init]];
}

- (void)showWindowController:(NSWindowController *)windowController
{
    [self.windowControllers addObject:windowController];
    [windowController showWindow:self];
}

- (void)releaseWindowController:(NSWindowController *)windowController
{
    [self.windowControllers removeObject:windowController];
}

- (NSWindowController *)rootWindowController
{
    return self.windowControllers[0];
}

@end