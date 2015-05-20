//
//  SDPureLayoutDemo3ViewController.m
//  SDPureLayoutPractice
//
//  Created by yurongde on 15/5/20.
//  Copyright (c) 2015年 yurongde. All rights reserved.
//

#import "SDPureLayoutDemo3ViewController.h"
#import "PureLayout.h"
@interface SDPureLayoutDemo3ViewController ()
@property (nonatomic,strong) UIView *blueView;
@property (nonatomic,strong) UIView *redView;
@property (nonatomic,strong) UIView *yellowView;
@property (nonatomic,strong) UIView *greenView;
@property (nonatomic, assign) BOOL didSetupConstraints;


@end

@implementation SDPureLayoutDemo3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
-(void)loadView {
    self.view = [UIView new];
    self.view.backgroundColor = [UIColor colorWithWhite:0.1 alpha:1.0];
    
    [self.view addSubview:self.blueView];
    [self.view addSubview:self.redView];
    [self.view addSubview:self.yellowView];
    [self.view addSubview:self.greenView];
    
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {
        NSArray *views = @[self.redView,self.blueView,self.yellowView,self.greenView];
        [views autoSetViewsDimension:ALDimensionHeight toSize:100.0];
        
        [views autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:0 insetSpacing:NO matchedSizes:YES];
        
        
        [self.redView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}
- (UIView *)blueView {
    if (!_blueView) {
        _blueView = [UIView newAutoLayoutView];
        _blueView.backgroundColor = [UIColor blueColor];
    }
    return _blueView;
}

- (UIView *)redView {
    if (!_redView) {
        _redView = [UIView newAutoLayoutView];
        _redView.backgroundColor = [UIColor redColor];
    }
    return _redView;
}

- (UIView *)yellowView {
    if (!_yellowView) {
        _yellowView = [UIView newAutoLayoutView];
        _yellowView.backgroundColor = [UIColor yellowColor];
    }
    return  _yellowView;
}
- (UIView *)greenView {
    if (!_greenView) {
        _greenView = [UIView newAutoLayoutView];
        _greenView.backgroundColor = [UIColor greenColor];
    }
    return _greenView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
