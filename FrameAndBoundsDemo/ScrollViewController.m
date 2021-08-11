//
//  ScrollViewController.m
//  FrameAndBoundsDemo
//
//  Created by jinfeng on 2021/8/11.
//

#import "ScrollViewController.h"

@interface SonView : UIView

@end

@implementation SonView

- (void)layoutSubviews {
    printf("++++++++++sonView frame=%s\n",NSStringFromCGRect(self.frame).UTF8String);
    printf("++++++++++sonView bounds=%s\n",NSStringFromCGRect(self.bounds).UTF8String);
}

@end

@interface ScrollViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) SonView *sonView;
@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 1000);
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    
    NSLog(@"clips=%d|%d",self.scrollView.clipsToBounds,self.scrollView.layer.masksToBounds);
    
    self.sonView = [SonView new];
    self.sonView.frame = CGRectMake(0, 100, 100, 100);
    self.sonView.backgroundColor = [UIColor redColor];
    [self.scrollView addSubview:self.sonView];
    
    self.scrollView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
    
    [self showLog];
    NSLog(@"clips=%d|%d",self.scrollView.clipsToBounds,self.scrollView.layer.masksToBounds);
}

- (void)showLog {
    printf("========== begin\n");
    printf("scrollView frame=%s\n",NSStringFromCGRect(self.scrollView.frame).UTF8String);
    printf("scrollView bounds=%s\n",NSStringFromCGRect(self.scrollView.bounds).UTF8String);
    printf("sonView frame=%s\n",NSStringFromCGRect(self.sonView.frame).UTF8String);
    printf("sonView bounds=%s\n",NSStringFromCGRect(self.sonView.bounds).UTF8String);
    printf("scrollView center=%s\n",NSStringFromCGPoint(self.scrollView.center).UTF8String);
    printf("sonView center=%s\n",NSStringFromCGPoint(self.sonView.center).UTF8String);
    printf("insets=%s\n",NSStringFromUIEdgeInsets(self.scrollView.contentInset).UTF8String);
    printf("========== end\n");
}

#pragma mark -- UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self showLog];
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
