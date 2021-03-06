//
//  XHFRootViewController.m
//  MultiPhotoPickerExample
//
//  Created by 周方 on 13-5-30.
//  Copyright (c) 2013年 xuhengfei. All rights reserved.
//

#import "XHFRootViewController.h"
#import "XHFDemoBar.h"
#import "XHFComplexViewController.h"
#import "XHFMultiPhotoPicker.h"

@interface XHFRootViewController ()

@end

@implementation XHFRootViewController{
    XHFDemoBar *_bar;
    
    XHFResultBlock _resultBlock;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    __block XHFRootViewController *weakSelf=self;
    
    _photos=[[NSMutableArray alloc]init];
    _resultBlock=[^(NSArray *photos){
        weakSelf.photos=[[NSMutableArray alloc]initWithArray:photos];
        [weakSelf->_bar refreshButtons:photos];
    } copy];
    
    UIButton *btn1=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame=CGRectMake(10, 100, 300, 30);
    [btn1 setTitle:@"相册照片拾取" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn1Click) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *btn2=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame=CGRectMake(10, 150, 300, 30);
    [btn2 setTitle:@"摄像头照片拍摄" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btn2Click) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn3=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn3.frame=CGRectMake(10, 200, 300, 30);
    [btn3 setTitle:@"用户自主选择" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(btn3Click) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn1];
    [self.view addSubview:btn2];
    [self.view addSubview:btn3];
	
    
    _bar=[[XHFDemoBar alloc]init];
    [self.view addSubview:_bar];
    
    UIButton *advance=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    advance.frame=CGRectMake(200, 400, 100, 30);
    [advance setTitle:@"进阶demo" forState:UIControlStateNormal];
    [advance addTarget:self action:@selector(advanceClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:advance];
}

-(void)btn1Click{
    [XHFMultiPhotoPicker pickWithType:ALBUM InitPhotos:self.photos ViewController: self ResultBlock:_resultBlock];
}

-(void)btn2Click{
    [XHFMultiPhotoPicker pickWithType:CAMERA InitPhotos:self.photos ViewController:self ResultBlock:_resultBlock];
}

-(void)btn3Click{
    [XHFMultiPhotoPicker pickWithType:USER_SELECT InitPhotos:self.photos ViewController:self ResultBlock:_resultBlock];
}

-(void)advanceClick{
    XHFComplexViewController *c=[[XHFComplexViewController alloc]init];
    [self presentViewController:c animated:YES completion:nil];
}


@end
