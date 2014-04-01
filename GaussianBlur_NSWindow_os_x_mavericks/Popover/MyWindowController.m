#import "MyWindowController.h"
@implementation MyWindowController
@synthesize myPopover;
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification{
    [self alf];
    targetWindow=windows;
    detachedWindow.contentView = detachedWindowViewController.view;
    myPopover = [[NSPopover alloc] init];
    myPopover.contentViewController = popoverViewController;
    myPopover.animates = NO;
    myPopover.appearance = NSPopoverAppearanceHUD;
    [self alfs];
}
- (void)dealloc{
    [myPopover release];
    [super dealloc];
}
- (void)alfs{
    myPopover.delegate = self;
    targetButton = (id)checkBoxAction;
    self.myPopover.contentViewController = detachedWindowViewController;
    self.myPopover.animates = NO;
    self.myPopover.behavior = NSPopoverBehaviorTransient;
    self.myPopover.delegate = self;
    [self.myPopover showRelativeToRect:[targetButton bounds] ofView:targetButton preferredEdge:NSMinYEdge];
    [self alf];
}
- (void)alf{[windows setAlphaValue:0];}
- (void)popoverWillClose:(NSNotification *)notification{[self alfs];}
- (void)popoverDidClose:(NSNotification *)notification{[self alfs];}
- (IBAction)showPopoverAction:(id)sender{[self alfs];}
- (void)start:(id)sender{[targetButton performClick:self];}
@end
@implementation Window
- (id)initWithFrame:(NSRect)frameRect  {
    self = [super initWithFrame:frameRect];
    if(self != nil) {
        NSView *aa = [[NSView alloc] initWithFrame:[targetWindow frame]];
        lastDragLocation = [[self superview] convertPoint:NSMakePoint(800, 800) fromView:aa];
    }
    NSView *aa = [[NSView alloc] initWithFrame:[targetWindow frame]];
    lastDragLocation = [[self superview] convertPoint:NSMakePoint(800, 800) fromView:aa];
    return self;
}
- (void)relock:theEvent{
    NSPoint newDragLocation = [[self superview] convertPoint:[theEvent locationInWindow] fromView:nil];
    NSPoint thisOrigin = [targetWindow frame].origin;
    thisOrigin.x +=  newDragLocation.x-410;
    thisOrigin.y +=  newDragLocation.y-790;
    [targetWindow setFrameOrigin:thisOrigin];
    lastDragLocation = newDragLocation;
}
- (void)mouseEntered:(NSEvent *)theEvent{[self setNeedsDisplay];}
- (void)mouseExited:(NSEvent *)theEvent{[self setNeedsDisplay];}
- (void)mouseDown:(NSEvent *)theEvent {[self relock:theEvent];[self setNeedsDisplay:YES];}
- (void)mouseDragged:(NSEvent *)theEvent {[self relock:theEvent];lastDragLocation = [[self superview] convertPoint:[theEvent locationInWindow] fromView:nil];}
@end
