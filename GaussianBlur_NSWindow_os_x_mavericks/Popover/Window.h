#import <AppKit/AppKit.h>

@interface Window : NSButton {
    NSPoint lastDragLocation;
}
- (void)mouseEntered:(NSEvent *)theEvent;
- (void)mouseExited:(NSEvent *)theEvent;
- (void)mouseDown:(NSEvent *)ev;
- (void)mouseDragged:(NSEvent *)theEvent;
@end