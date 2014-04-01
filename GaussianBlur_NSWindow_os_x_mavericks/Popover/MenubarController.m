#import "MenubarController.h"
#import "MyWindowController.h"
@interface MenubarController (){
}
@end
@implementation MenubarController

- (id)init{
    CGFloat height = [NSStatusBar systemStatusBar].thickness;
 //   popup_bender_top_step=height;
  //  popup_bender_left_step=height;
    self = [super initWithFrame:NSMakeRect(0, 0, height, NSVariableStatusItemLength)];
    if (self != nil){
        [self removeAllToolTips];
     //   statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
     //   statusItemView = [[StatusItemView alloc] initWithStatusItem:statusItem];
    }
    return self;
}
- (void)drawRect:(NSRect)dirtyRect{
    [[NSColor selectedMenuItemColor] setFill];
    NSRectFill(dirtyRect);
    [[NSColor clearColor] setFill];
    NSRectFill(dirtyRect);
}
- (void)mouseDown:(NSEvent *)theEvent{
}
- (void)mouseUp:(NSEvent *)theEvent{ [self setActive:NO]; }
- (void)setActive:(BOOL)active{ }
- (void)setSetupChecked:(BOOL)checkedSetup{  }
- (BOOL)hasActiveIcon{ return YES;[self setActive:YES]; }
- (void)setHasActiveIcon:(BOOL)flag{ [self setActive:flag]; }
- (NSStatusItem *)statusItem{ return nil; }
@end
//   NSLog(@"toggleJsses 💠 display jsses screen ➿🛂🛃🛅🛄🅿️❎✅®❌⭕️☑️🎫🚧🚂🚀⚓️📇📊📋📈📖📔⚡️🌀💫👓💬💭👥👤");