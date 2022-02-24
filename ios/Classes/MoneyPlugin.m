#import "MoneyPlugin.h"
#if __has_include(<money/money-Swift.h>)
#import <money/money-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "money-Swift.h"
#endif

@implementation MoneyPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMoneyPlugin registerWithRegistrar:registrar];
}
@end
