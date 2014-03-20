//
//  SKMainViewController.m
//  DurexKitExample
//
//  Created by zhangyu on 14-3-20.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "SKMainViewController.h"

#import "DurexKit.h"
#import "QEDTextView.h"
#import <objc/runtime.h>

@interface SKMainViewController () <UITextViewDelegate>

@property (nonatomic, strong) QEDTextView *textView;

@end

@implementation SKMainViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"DurexKit";
        //    setSafeKitLogType(SafeKitLogTypeNone);
        setSafeKitLogType(SafeKitLogTypeInfo | SafeKitLogTypeWarning | SafeKitLogTypeError);
    }
    return self;
}

-(void)invokeCrashCode{
    //Array
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"aa",@"bb",nil];
    [array addObject:nil];
    [array removeObjectAtIndex:4];
    
    //Dictionary
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"a",@"key1",@"b",@"key2", nil];
    [dictionary setObject:nil forKey:nil];
    [dictionary removeObjectForKey:nil];
    
    NSMutableString *str = [[NSMutableString alloc]initWithString:@"abc"];
    [str appendString:nil];
    
//    UIViewController *kvo = [[UIViewController alloc]init];
//    
//    [kvo setValue:@"aa" forKey:@"titleaaa"];
//    [kvo valueForKey:@"titleasfs"];
//    [kvo valueForUndefinedKey:@"asdfasdfadssdafasdf"];

}
- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self invokeCrashCode];
    
    QEDTextView *textView = [[QEDTextView alloc] initWithFrame:self.view.bounds];
    textView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    textView.delegate = self;
    textView.editable = NO;
    self.textView = textView;
    [self.view addSubview:textView];
    
    self.textView.text = @"// Will it crash?\n"\
    @"NSMutableArray *array = [NSMutableArray arrayWithObjects:@\"aa\",@\"bb\",nil];\n"\
    @"[array addObject:nil];\n"\
    @"[array objectAtIndex:4];\n"\
    @"// No.It work very well.\n\n"\
    
    @"// Will it crash?\n"\
    @"NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:@\"a\",@\"key1\",@\"b\",@\"key2\", nil];\n"\
    @"[dictionary setObject:nil forKey:nil];\n"\
    @"[dictionary removeObjectForKey:nil];\n"\
    @"// No.It is as safe as Durex.\n";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(50, self.view.frame.size.height - 130, 210, 30);
    [button setTitle:@"no selector button" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(noneSelector:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}


-(void)buttonClicked:(id)sender{
    setSafeKitObjectPerformExceptionCatch(SafeKitObjectPerformExceptionCatchOn);//no crash
    //    setSafeKitObjectPerformExceptionCatch(SafeKitObjectPerformExceptionCatchOff);//crash
//    NSException *e = [NSException exceptionWithName:@"TestException" reason:@"Test" userInfo:nil];
//    @throw e;
//    return [NSNumber numberWithInt:1];
}

@end
