//
//  PageViewController.m
//  PagesViewController
//
//  Created by unbTech on 2017. 10. 16..
//  Copyright © 2017년 unbTech. All rights reserved.
//

#import "PageViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"

@interface PageViewController () < UIPageViewControllerDataSource, UIPageViewControllerDelegate >

@end

@implementation PageViewController

- (instancetype)initWithTransitionStyle:(UIPageViewControllerTransitionStyle)style navigationOrientation:(UIPageViewControllerNavigationOrientation)navigationOrientation options:(NSDictionary<NSString *,id> *)options
{
  self = [super initWithTransitionStyle:style navigationOrientation:navigationOrientation options:options];
  if (self) {
    self.pageControl = [[UIPageControl alloc] init];
    self.pages = [[NSMutableArray alloc] init];
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  NSLog(@"pageViewCotroller ViewDidLoad");
  
  self.dataSource = self;
  self.delegate = self;
  NSInteger initalPage = 0;
  
  ViewController1 *page1 = [[ViewController1 alloc] init];
  ViewController2 *page2 = [[ViewController2 alloc] init];
  ViewController3 *page3 = [[ViewController3 alloc] init];
  
  // add PageView
  [self.pages addObject:page1];
  [self.pages addObject:page2];
  [self.pages addObject:page3];
  
  NSLog(@"setViewControllers = %@",self.pages[initalPage]);
  
  [self setViewControllers:@[self.pages[initalPage]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
  
  // pageControl
  self.pageControl.frame = CGRectMake(self.view.frame.size.width / 2 - 50, self.view.frame.size.height - 44, self.view.frame.size.width / 2, 20);
  self.pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
  self.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
  self.pageControl.numberOfPages = self.pages.count;
  self.pageControl.translatesAutoresizingMaskIntoConstraints = NO;
  [self.view addSubview:self.pageControl];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
  NSInteger viewControllerIndex = [self.pages indexOfObject:viewController];
  NSLog(@"viewControllerBeforeViewController");
  if ( viewControllerIndex == 0 ) {
    return self.pages.lastObject;
  } else {
    return self.pages[viewControllerIndex - 1];
  }
  return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
  NSInteger viewControllerIndex = [self.pages indexOfObject:viewController];
  NSLog(@"viewControllerAfterViewController");
  if ( viewControllerIndex < self.pages.count - 1) {
    return self.pages[viewControllerIndex + 1];
  } else {
    return self.pages.firstObject;
  }
  return nil;
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
  NSLog(@"previousViewControllers");
  NSArray *viewControllers = pageViewController.viewControllers;
  NSInteger viewControllerIndex = [self.pages indexOfObject:viewControllers[0]];
  self.pageControl.currentPage = viewControllerIndex;
}

@end
