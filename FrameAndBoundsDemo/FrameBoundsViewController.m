//
//  FrameBoundsViewController.m
//  FrameAndBoundsDemo
//
//  Created by jinfeng on 2021/8/11.
//

#import "FrameBoundsViewController.h"

@interface FrameBoundsViewController ()
@property (nonatomic, strong) UIView *fatherView;
@property (nonatomic, strong) UIView *sonView;
@end

@implementation FrameBoundsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.fatherView = [UIView new];
    self.fatherView.frame = CGRectMake(20, 100, 200, 200);
    self.fatherView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.fatherView];
    
    
    self.sonView = [UIView new];
    self.sonView.frame = CGRectMake(10, 10, 50, 50);
    self.sonView.backgroundColor = [UIColor redColor];
    [self.fatherView addSubview:self.sonView];
    
    [self showLog];
    
    //bounds：是以自身左上角为原点
    
    // 1: 修改子视图的bounds的原点，不影响frame
//    self.sonView.bounds = CGRectMake(10, 10, 50, 50);
//    [self showLog];
    
    // 2: 修改父视图的bounds的原点，可以看到子视图的frame没变，但是显示的布局缺变了，往左上角偏移了(-10,-10)。bounds原点的改变总是和子视图相反，也就是x增大，那么，子视图往左移，x减小，子视图往右移，y同理。
//    self.fatherView.bounds = CGRectMake(10, 10, 200, 200);
//    [self showLog];
    
    // 3: 修改子视图的bounds的size，会保持子视图的中心点不变，缩放子视图大小，修改子视图的frame
    self.sonView.bounds = CGRectMake(10, 10, 100, 100);
    [self showLog];
}

- (void)showLog {
    printf("========== begin\n");
    printf("fatherView frame=%s\n",NSStringFromCGRect(self.fatherView.frame).UTF8String);
    printf("fatherView bounds=%s\n",NSStringFromCGRect(self.fatherView.bounds).UTF8String);
    printf("sonView frame=%s\n",NSStringFromCGRect(self.sonView.frame).UTF8String);
    printf("sonView bounds=%s\n",NSStringFromCGRect(self.sonView.bounds).UTF8String);
    printf("fatherView center=%s\n",NSStringFromCGPoint(self.fatherView.center).UTF8String);
    printf("sonView center=%s\n",NSStringFromCGPoint(self.sonView.center).UTF8String);
    printf("========== end\n");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
