//
//  CUSMainViewController.m
//  CUSPadFrameSample
//
//  Created by zhangyu on 13-4-3.
//  Copyright (c) 2013年 zhangyu. All rights reserved.
//

#import "CUSMainViewController.h"
#import "DurexKit.h"
#import "QEDTextView.h"

@interface CUSMainViewController () <UITextViewDelegate>

@property (nonatomic, strong) QEDTextView *textView;

@end

@implementation CUSMainViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"DurexKit";
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    QEDTextView *textView = [[QEDTextView alloc] initWithFrame:self.view.bounds];
    textView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    textView.delegate = self;
    textView.editable = NO;
    self.textView = textView;
    [self.view addSubview:textView];
    
    //Array
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"aa",@"bb",nil];
    [array addObject:nil];
    [array removeObjectAtIndex:4];
    
    //Dictionary
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"a",@"key1",@"b",@"key2", nil];
    [dictionary setObject:nil forKey:nil];
    [dictionary removeObjectForKey:nil];
    
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
    [button addTarget:self action:@selector(noonnonoSelector:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
@end
