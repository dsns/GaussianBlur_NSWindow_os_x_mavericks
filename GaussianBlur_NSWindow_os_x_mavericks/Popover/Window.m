#import "Window.h"
#import "MyWindowController.h"
@implementation Window
- (id)initWithFrame:(NSRect)frameRect  {
    self = [super initWithFrame:frameRect];
    if(self != nil) {
      //  NSView *aa=[targetWindow frame]  ;
        //    NSView *aa = [[NSView alloc] initWithFrame:NSMakeRect(100, 100, 100, 100)];
        // NSView *aa= [[targetWindow self] view] ;
        NSView *aa = [[NSView alloc] initWithFrame:[targetWindow frame]];
        lastDragLocation = [[self superview] convertPoint:NSMakePoint(800, 800) fromView:aa];
    }
    NSView *aa = [[NSView alloc] initWithFrame:[targetWindow frame]];
    lastDragLocation = [[self superview] convertPoint:NSMakePoint(800, 800) fromView:aa];
    return self;
}
- (void)mouseEntered:(NSEvent *)theEvent{
    [self setNeedsDisplay];
}
- (void)mouseExited:(NSEvent *)theEvent{
    [self setNeedsDisplay];
}
- (BOOL) acceptsFirstMouse:(NSEvent *)e {return YES;}
- (void)mouseDown:(NSEvent *)theEvent {
    
 [self relock:theEvent];
    
    [self setNeedsDisplay:YES];
}
- (void)relock:theEvent{
    
    NSPoint newDragLocation = [[self superview] convertPoint:[theEvent locationInWindow] fromView:nil];
    NSPoint thisOrigin = [targetWindow frame].origin;
    thisOrigin.x +=  newDragLocation.x-410;
    thisOrigin.y +=  newDragLocation.y-790;
    [targetWindow setFrameOrigin:thisOrigin];
    lastDragLocation = newDragLocation;
}
- (void)mouseDragged:(NSEvent *)theEvent {
    [self relock:theEvent];
    lastDragLocation = [[self superview] convertPoint:[theEvent locationInWindow] fromView:nil];
}
@end