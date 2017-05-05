//
//  ViewController.m
//  ZxingTest
//
//  Created by 松洋 on 2017/1/6.
//  Copyright © 2017年 com.du. All rights reserved.
//

#import "ViewController.h"
#import "SGScanningQRCodeVC.h"
#import "SGQRCodeTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onClickCreat:(id)sender {
    [self setupGenerateQRCode];
}

- (IBAction)onClickScreen:(id)sender {

    [self presentViewController:[[SGScanningQRCodeVC alloc] init] animated:YES completion:nil];
}


/**
 一下两个方法可以从扫描二维码的界面结束的时候拿到返回值
 **/
-(void)viewDidAppear:(BOOL)animated{

    if(_nc==nil){
        _nc = [NSNotificationCenter defaultCenter];
    }
    
    [_nc addObserver:self
           selector:@selector(handleColorChange:)
               name:@"do"
             object:nil];
}

-(void)handleColorChange:(NSNotification*)sender{
   
   NSString *str= [sender.userInfo valueForKey:@"data"];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"扫码信息" message:str delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alert.alertViewStyle = UIAlertViewStyleDefault;
    [alert show];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"do" object:nil];
}


/**
 生成二维码
 **/

// 生成二维码
- (void)setupGenerateQRCode {
    
    // 将CIImage转换成UIImage，并放大显示
    _img.image = [SGQRCodeTool SG_generateWithDefaultQRCodeData:@"http://a.app.qq.com/o/simple.jsp?pkgname=com.eruntech.neighbour" imageViewWidth:_img.frame.size.width];
    
    //生成中间logo
    CGFloat scale = 0.2;
    CGFloat borderW = 2;
    UIView *borderView = [[UIView alloc] init];
    CGFloat borderViewW = _img.frame.size.width * scale;
    CGFloat borderViewH = _img.frame.size.width * scale;
    CGFloat borderViewX = 0.5 * (_img.frame.size.width - borderViewW);
    CGFloat borderViewY = 0.5 * (_img.frame.size.width - borderViewH);
    borderView.frame = CGRectMake(borderViewX, borderViewY, borderViewW, borderViewH);
    borderView.layer.borderWidth = borderW;
    borderView.layer.borderColor = [UIColor whiteColor].CGColor;
    borderView.layer.cornerRadius = 10;
    borderView.layer.masksToBounds = YES;
    borderView.layer.contents = (id)[UIImage imageNamed:@"ic_launcher"].CGImage;
    
    [_img addSubview:borderView];
}



@end
