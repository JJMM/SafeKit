//
//  SKMainViewController.m
//  SafeKitExample
//
//  Created by zhangyu on 14-3-20.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "SKMainViewController.h"

#import "SafeKit.h"
#import "QEDTextView.h"

@interface SKMainViewController () <UITextViewDelegate>

@property (nonatomic, strong) QEDTextView *textView;

@end

@implementation SKMainViewController

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
    @"// No.It work very well.\n";
    
    UITextField *tt = [[UITextField alloc] initWithFrame:CGRectMake(10, 200, 300, 50)];
    tt.backgroundColor = [UIColor redColor];
    [self.view addSubview:tt];
}

@end
