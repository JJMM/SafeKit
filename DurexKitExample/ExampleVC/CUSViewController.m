//
//  CUSViewController.m
//  CUSLayout
//
//  Created by zhangyu on 14-2-21.
//
//

#import "CUSViewController.h"

@interface CUSViewController ()

@end

@implementation CUSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
        
        self.navigationController.navigationBar.barTintColor = [UIColor grayColor];
        self.tabBarController.tabBar.barTintColor = [UIColor grayColor];
        
        self.navigationController.navigationBar.translucent = NO;
        self.tabBarController.tabBar.translucent = NO;
    }
#endif
}


@end
