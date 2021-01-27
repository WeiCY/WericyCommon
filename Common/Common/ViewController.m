//
//  ViewController.m
//  Common
//
//  Created by CityDoWCY on 2020/12/1.
//

#import "ViewController.h"

#import "WeicyCommon/WeicyCommon.h"

#import "UIView+Animation_yf.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, assign) NSInteger *index;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.redColor;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor blueColor];
    
    button.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:button];
    self.btn = button;
    
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.btn moveTo:CGPointMake(100, 300) duration:2 option:UIViewAnimationOptionBeginFromCurrentState];
    [self.btn curlDown:0.3];
}

@end
