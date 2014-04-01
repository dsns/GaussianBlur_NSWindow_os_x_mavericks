#import <AppKit/AppKit.h>

@interface CustomView : NSWindow{
    NSPoint lastDragLocation;
}

@property (assign) NSPoint initialLocation;
- (void)mouseEntered:(NSEvent *)theEvent;
- (void)mouseExited:(NSEvent *)theEvent;
- (void)mouseDown:(NSEvent *)ev;
- (void)mouseUp:(NSEvent *)theEvent;
- (void)mouseDragged:(NSEvent *)theEvent;
@end