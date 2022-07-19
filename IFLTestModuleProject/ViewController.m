//
//  ViewController.m
//  IFLTestModuleProject
//
//  Created by erlich wang on 2022/7/14.
//

#import "ViewController.h"
//#import "IFLHomeModule/Eservice.h"
//#import "BeeHive/Beehive.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 150, 300, 80)];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor blueColor];
    [btn setTitle:@"进入homeModule组件" forState:UIControlStateNormal];
    [btn setTitle:@"进入homeModule组件" forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(enterHomeModule) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)enterHomeModule {
    Protocol *serviceProtocol = NSProtocolFromString(@"IFLMVVMServiceProtocol");
    NSLog(@"serviceProtocol = %@", serviceProtocol);
    if (!serviceProtocol) {
        NSLog(@"目标组件 - homeModule组件不存在..");
        return;
    }
    
//    id destVc = [[BeeHive shareInstance] createService:serviceProtocol];
    Class _BeeHive = NSClassFromString(@"BeeHive");
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    if ([_BeeHive respondsToSelector:@selector(shareInstance)]) {
        id _BeeHiveInstance = [_BeeHive performSelector:@selector(shareInstance)];
        if ([_BeeHiveInstance respondsToSelector:@selector(createService:)]) {
            id destVc = [_BeeHiveInstance performSelector:@selector(createService:) withObject:serviceProtocol];
            
            if ([destVc isKindOfClass:[UIViewController class]]) {
                [self presentViewController:destVc animated:YES completion:^{

                }];
            }
            
            if ([destVc respondsToSelector:@selector(setTitle:content:)]) {
                [destVc performSelector:@selector(setTitle:content:) withObject:@"我是title" withObject:@"我是content"];
            }
        }
    }
#pragma clang diagnostic pop
}

@end
