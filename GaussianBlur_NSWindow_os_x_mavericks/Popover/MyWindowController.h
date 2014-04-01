#import <Cocoa/Cocoa.h>
@interface MyWindowController : NSWindowController <NSPopoverDelegate>{
@private
    NSPopover *myPopover;
    NSMenu *dynamicMenu;
    IBOutlet NSButton *checkBoxAction;
    IBOutlet NSWindow *detachedWindow;
    IBOutlet NSWindow *windows;
    IBOutlet NSViewController *popoverViewController;
    IBOutlet NSViewController *detachedWindowViewController;
}
- (IBAction)showPopoverAction:(id)sender;
@property (retain) NSPopover *myPopover;
@end
@interface Window : NSButton {
    NSPoint lastDragLocation;
}
- (void)mouseEntered:(NSEvent *)theEvent;
- (void)mouseExited:(NSEvent *)theEvent;
- (void)mouseDown:(NSEvent *)ev;
- (void)mouseDragged:(NSEvent *)theEvent;
@end