#import <Cocoa/Cocoa.h>
#import <ApplicationServices/ApplicationServices.h>
NSButton *targetButton;
NSWindow *targetWindow;
NSPoint lastDragLocation;
int main(int argc, char *argv[])
{
    lastDragLocation = NSMakePoint(0, 0);
    targetWindow=nil;
    targetButton=nil;
    NSView *aa = [[NSView alloc] initWithFrame:[targetWindow frame]];
    lastDragLocation = [[[NSView alloc] superview] convertPoint:NSMakePoint(0, 0) fromView:aa];
    return NSApplicationMain(argc, (const char **)argv);
}
