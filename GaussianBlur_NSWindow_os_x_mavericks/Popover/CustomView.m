#import "CustomView.h"
#import "MyWindowController.h"
@implementation CustomView
@synthesize initialLocation;
/**
- (id) initWithContentRect: (NSRect) contentRect
                 styleMask: (NSUInteger) aStyle
                   backing: (NSBackingStoreType) bufferingType
                     defer: (BOOL) flag{
    if (![super initWithContentRect: contentRect 
                          styleMask: NSBorderlessWindowMask 
                            backing: bufferingType 
                              defer: flag]) return nil;
    [self setBackgroundColor: [NSColor clearColor]];
    [self setOpaque:NO];
    [NSApp activateIgnoringOtherApps:YES];
    return self;
}

- (void)mouseDragged:(NSEvent *)theEvent {
    NSRect screenVisibleFrame = [[NSScreen mainScreen] visibleFrame];
    NSRect windowFrame = [self frame];
    NSPoint newOrigin = windowFrame.origin;
    NSPoint currentLocation = [theEvent locationInWindow];
    newOrigin.x += (currentLocation.x - initialLocation.x);
    newOrigin.y += (currentLocation.y - initialLocation.y);
    if ((newOrigin.y + windowFrame.size.height) > (screenVisibleFrame.origin.y + screenVisibleFrame.size.height)) {
        newOrigin.y = screenVisibleFrame.origin.y + (screenVisibleFrame.size.height - windowFrame.size.height);
    }
    [self setFrameOrigin:newOrigin];
}

- (void)mouseDown:(NSEvent *)theEvent {
    self.initialLocation = [theEvent locationInWindow];
}

**/





- (id)initWithFrame:(NSRect)frameRect  {
    self = [super initWithFrame:frameRect];
    if(self != nil) {
        NSLog(@"btn init");
    }
    return self;
}


- (void)mouseEntered:(NSEvent *)theEvent{
    NSLog(@"mouseEntered");
    [self setImage:[NSImage imageNamed:@"a.png"]];
    [self setNeedsDisplay];
}
- (void)mouseExited:(NSEvent *)theEvent{
    [self setImage:[NSImage imageNamed:@"a.png"]];
    NSLog(@"mouseExited");
    [self setNeedsDisplay];
}
- (BOOL) acceptsFirstMouse:(NSEvent *)e {
    return YES;
}
- (void)mouseDown:(NSEvent *)theEvent {
    NSImage *pic = [NSImage imageNamed:@"a.png"];
    NSSize dragOffset = NSMakeSize(0.0, 0.0);
    NSPasteboard *pboard = [NSPasteboard pasteboardWithName:NSDragPboard];
    [pboard declareTypes:[NSArray arrayWithObject:NSStringPboardType]  owner:self];
    [pboard writeObjects:[NSArray arrayWithObject:@"ARRAY"]];
    NSPoint btnMiddle = NSMakePoint(2,2);
    //   NSPoint picOrigin = NSMakePoint(btnMiddle.x - pic.size.width/2, btnMiddle.y + pic.size.height/2);
    //   self.image = nil;
    
    //  [self dragImage:pic at:picOrigin offset:dragOffset event:theEvent pasteboard:pboard source:self slideBack:YES];
    
    [self setNeedsDisplay:YES];
    // Convert to superview's coordinate space
    lastDragLocation = [[self superview] convertPoint:[theEvent locationInWindow] fromView:nil];
    NSPoint newDragLocation = [[[[NSButton alloc] init] superview] convertPoint:[theEvent locationInWindow] fromView:nil];
    NSPoint thisOrigin = [[[NSButton alloc] init] frame].origin;
    thisOrigin.x += (-lastDragLocation.x + newDragLocation.x);
    thisOrigin.y += (-lastDragLocation.y + newDragLocation.y);
    [self setFrameOrigin:thisOrigin];
    lastDragLocation = newDragLocation;
    
}

- (void)mouseDragged:(NSEvent *)theEvent {
    NSPoint newDragLocation = [[self superview] convertPoint:[theEvent locationInWindow] fromView:nil];
    NSPoint thisOrigin = [[[NSButton alloc] init] frame].origin;
    thisOrigin.x += (-lastDragLocation.x + newDragLocation.x);
    thisOrigin.y += (-lastDragLocation.y + newDragLocation.y);
    [self setFrameOrigin:thisOrigin];
    lastDragLocation = newDragLocation;
}

@end