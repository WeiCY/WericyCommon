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
    
    self.view.backgroundColor = UIColor.redColor;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor blueColor];
    
    button.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:button];
    
    // Do any additional setup after loading the view.
}

@end
