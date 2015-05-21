//
//  SDPureLayoutDemo1ViewController.m
//  SDPureLayoutPractice
//
//  Created by yurongde on 15/5/21.
//  Copyright (c) 2015年 yurongde. All rights reserved.
//

#import "SDPureLayoutDemo1ViewController.h"
#import "PureLayout.h"
@interface SDPureLayoutDemo1ViewController ()
@property (nonatomic, strong) UIView *blueView;
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *yellowView;
@property (nonatomic, strong) UIView *greenView;
@property (nonatomic, assign) BOOL didSetupConstraints;

@end

@implementation SDPureLayoutDemo1ViewController

- (void)loadView
{
    self.view = [UIView new];
    self.view.backgroundColor = [UIColor colorWithWhite:0.1 alpha:1.0];
    
    [self.view addSubview:self.blueView];
    [self.view addSubview:self.redView];
    [self.view addSubview:self.yellowView];
    [self.view addSubview:self.greenView];
    
    [self.view setNeedsUpdateConstraints]; // bootstrap Auto Layout
}

- (void)updateViewConstraints {
    if (!_didSetupConstraints) {
        
//        [self.blueView autoCenterInSuperview];
        [self.blueView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.blueView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.view withOffset:64];
        
        [self.blueView autoSetDimensionsToSize:CGSizeMake(50.0, 50.0)];
        
        [self.redView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.blueView];
        [self.redView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.blueView];
        [self.redView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.blueView];
        [self.redView autoSetDimension:ALDimensionHeight toSize:40.0];
        
        [self.yellowView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.redView withOffset:10];
        [self.yellowView autoSetDimension:ALDimensionHeight toSize:25];
        [self.yellowView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
        [self.yellowView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
        
        [self.greenView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.yellowView withOffset:10];
        [self.greenView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.yellowView withMultiplier:2.0];
        [self.greenView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.greenView autoSetDimension:ALDimensionWidth toSize:150.0];
        
        _didSetupConstraints = NO;
    }
    [super updateViewConstraints];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (UIView *)blueView
{
    if (!_blueView) {
        _blueView = [UIView newAutoLayoutView];
        _blueView.backgroundColor = [UIColor blueColor];
    }
    return _blueView;
}

- (UIView *)redView
{
    if (!_redView) {
        _redView = [UIView newAutoLayoutView];
        _redView.backgroundColor = [UIColor redColor];
    }
    return _redView;
}

- (UIView *)yellowView
{
    if (!_yellowView) {
        _yellowView = [UIView newAutoLayoutView];
        _yellowView.backgroundColor = [UIColor yellowColor];
    }
    return _yellowView;
}

- (UIView *)greenView
{
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
