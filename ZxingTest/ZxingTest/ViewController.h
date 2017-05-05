//
//  ViewController.h
//  ZxingTest
//
//  Created by 松洋 on 2017/1/6.
//  Copyright © 2017年 com.du. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property NSNotificationCenter *nc ;


- (IBAction)onClickCreat:(id)sender;

- (IBAction)onClickScreen:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *img;

@end

