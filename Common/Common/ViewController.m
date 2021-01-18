//
//  ViewController.m
//  Common
//
//  Created by CityDoWCY on 2020/12/1.
//

#import "ViewController.h"

#import "WeicyCommon/WeicyCommon.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign) NSInteger *index;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(100, 100, 100, 100);
    [button1 setBackgroundColor:UIColor.redColor];
    [button1 weicy_setBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        NSLog(@"ddd");
    }];
    [self.view addSubview:button1];
    
    // Do any additional setup after loading the view.
}

@end
