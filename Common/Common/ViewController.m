//
//  ViewController.m
//  Common
//
//  Created by CityDoWCY on 2020/12/1.
//

#import "ViewController.h"

#import "WeicyCommon/WeicyCommon.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, assign) NSInteger *index;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.redColor;
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.backgroundColor = [UIColor blueColor];
//
//    button.frame = CGRectMake(100, 100, 100, 100);
//    [self.view addSubview:button];
//    self.btn = button;
    
    UITextField *textfield = [[UITextField alloc] initWithFrame:CGRectMake(30, 150, 200, 40)];
    textfield.backgroundColor = UIColor.whiteColor;
    textfield.placeholder = @"ddddd";
//    textfield.placeholderColor = UIColor.redColor;
    textfield.font = [UIFont systemFontOfSize:12];
    
    textfield.placegolderFont = [UIFont boldSystemFontOfSize:19];
    textfield.limitCount = 4;
    [self.view addSubview:textfield];
    
    NSLog(@"%@",[WeicyFileTool weicy_listFilesInTmpDirectoryByDeep:YES]);
    NSLog(@"%@",[UIApplication sharedApplication].tmpPath);
    NSString *path = [NSString stringWithFormat:@"%@%@",[UIApplication sharedApplication].tmpPath,@"33"];
    NSLog(@"%ld",[WeicyFileTool weicy_createDirectoryAtPath:path]);
    NSLog(@"%@",[WeicyFileTool weicy_listFilesInTmpDirectoryByDeep:YES]);
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

}

@end
