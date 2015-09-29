//
//  PuddingPageViewController.m
//  pudding
//
//  Created by customer on 15/9/27.
//  Copyright (c) 2015年 Weizh. All rights reserved.
//

#import "PuddingPageViewController.h"
#import "BangumiViewController.h"
#import "RecommandViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "UIImage+Additions.h"
#import "WEITitleView.h"

@interface PuddingPageViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>
{
    NSUInteger _currentPage;
    WEITitleView *_titleView;
}

@end

@implementation PuddingPageViewController

#pragma mark init method
- (instancetype)initWithTransitionStyle:(UIPageViewControllerTransitionStyle)style navigationOrientation:(UIPageViewControllerNavigationOrientation)navigationOrientation options:(NSDictionary *)options{
    if (self = [super initWithTransitionStyle:style navigationOrientation:navigationOrientation options:options]) {
        _currentPage = 0;
        self.delegate = self;
        self.dataSource = self;
        for (UIView *v in self.view.subviews) {
            if ([v isKindOfClass:[UIScrollView class]]) {
                [v addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
            }
        }
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    CGFloat pointX = [change[@"new"] CGPointValue].x;
    UIScrollView *view = object;
    if (_currentPage == 0 && pointX <= self.view.bounds.size.width) {        view.panGestureRecognizer.enabled = NO;
        view.panGestureRecognizer.enabled = YES;
    }else{
        self.mm_drawerController.panGestureRecognizer.enabled = NO;
        self.mm_drawerController.panGestureRecognizer.enabled = YES;
    }
}

- (void)setPageViews:(NSArray *)pageViews{
    _pageViews = pageViews;
    [self setViewControllers:@[[_pageViews firstObject]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}

#pragma mark pageView delegate
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSUInteger viewIndex = [_pageViews indexOfObject:viewController];
    if (viewIndex == 0) {
        return nil;
    }else{
        return [_pageViews objectAtIndex:viewIndex-1];
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSUInteger viewIndex = [_pageViews indexOfObject:viewController];
    if (viewIndex == _pageViews.count-1) {
        return nil;
    }else{
        return [_pageViews objectAtIndex:viewIndex+1];
    }
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed{
    _currentPage = [_pageViews indexOfObject:[pageViewController.viewControllers firstObject]];
    _titleView.selectIndex = _currentPage;
//    NSLog(@"%ld",_currentPage);
}

#pragma mark view did load
- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationInit];
}

- (void)navigationInit{
    //left button
    UIImage *img = [UIImage imageWithCGImage:[UIImage imageNamed:@"default_avatar"].CGImage scale:4.0 orientation:UIImageOrientationUp];
    img = [img add_imageWithRoundedBounds];
    img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:img style:UIBarButtonItemStylePlain target:self action:@selector(didAvatarClicked:)];
    //title view
    _titleView = [[WEITitleView alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    _titleView.titleArray = @[@"番文",@"推荐"];
    [_titleView addTarget:self action:@selector(didTitleViewChanged:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = _titleView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark button clicked evens
- (void)didAvatarClicked:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:^(BOOL finished) {
    }];
}

- (void)didTitleViewChanged:(WEITitleView *)sender{
    UIPageViewControllerNavigationDirection direction;
    if (sender.selectIndex > _currentPage) {
        direction = UIPageViewControllerNavigationDirectionForward;
    }else{
        direction = UIPageViewControllerNavigationDirectionReverse;
    }
    [self setViewControllers:@[_pageViews[sender.selectIndex]] direction:direction animated:YES completion:nil];
    _currentPage = sender.selectIndex;
}
@end
