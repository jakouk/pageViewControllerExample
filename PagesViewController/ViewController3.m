//
//  ViewController3.m
//  PagesViewController
//
//  Created by unbTech on 2017. 10. 16..
//  Copyright © 2017년 unbTech. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor whiteColor];
  
  UILabel *labelInst = [UILabel new];
  [self.view addSubview:labelInst];
  labelInst.translatesAutoresizingMaskIntoConstraints = NO;
  labelInst.text = @"Page3";
  labelInst.frame = CGRectMake(self.view.frame.size.width / 2 - 50, self.view.frame.size.height / 2 - 15, 100, 30);
  labelInst.textAlignment = NSTextAlignmentCenter;
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
