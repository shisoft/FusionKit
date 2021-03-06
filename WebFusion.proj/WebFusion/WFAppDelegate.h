//
//  WFAppDelegate.h
//  WebFusion
//
//  Created by Maxthon Chan on 13-3-4.
//
//

#import <Cocoa/Cocoa.h>
#import <FusionKit/FusionKit.h>
#import "WFLoginWindowController.h"
#import <FusionApps/FusionApps.h>

@interface WFAppDelegate : NSObject <NSApplicationDelegate, WFApplicationServicesDelegate>

@property NSMutableArray *windowControllers;
@property FKConnection *connection;
@property BOOL override;

- (void)showWindowController:(NSWindowController *)windowController;
- (void)releaseWindowController:(NSWindowController *)windowController;

- (void)finishLoginWithConnection:(FKConnection *)connection;

- (void)closeAllWindowControllerWithClass:(Class)class;

- (IBAction)delegateSignOut:(id)sender;
- (IBAction)delegateClearSession:(id)sender;
- (IBAction)showAbout:(id)sender;
- (IBAction)showPreferences:(id)sender;

- (IBAction)showMainWindow:(id)sender;
- (void)startMainWindow;
- (void)stopMainWindow;

@end
