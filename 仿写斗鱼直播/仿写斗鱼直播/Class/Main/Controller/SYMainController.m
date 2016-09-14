//
//  SYMainController.m
//  仿写斗鱼直播
//
//  Created by 码农界四爷__King on 16/9/15.
//  Copyright © 2016年 码农界四爷__King. All rights reserved.
//

#import "SYMainController.h"
#import "SYFollowController.h"
#import "SYHomeController.h"
#import "SYLiveController.h"
#import "SYProdfileController.h"
#import "SYNavigationViewController.h"

#define SYColorA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define SYColor(r, g, b) SYColorA((r), (g), (b), 255)
#define SYRandomColor SYColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

@interface SYMainController ()

@end

@implementation SYMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置底部控制器
    [self setupChildViewController];
    
    
}

//设置底部Tabbar控制器上的按钮
- (void)setupChildViewController{
    
    //首页
    [self addOneChildViewController:[[SYFollowController alloc] init] title:@"首页" image:@"btn_home_normal" selected:@"btn_home_selected"];
    
    
    //直播
    [self addOneChildViewController:[[SYLiveController alloc] init] title:@"直播" image:@"btn_column_normal" selected:@"btn_column_selected"];
    
    //关注
    [self addOneChildViewController:[[SYFollowController alloc] init] title:@"关注" image:@"btn_live_normal" selected:@"btn_live_selected"];
    
    //我的
    [self addOneChildViewController:[[SYProdfileController alloc] init] title:@"我的" image:@"btn_user_normal" selected:@"btn_user_selected"];
}


//抽取公用的控制器类
- (void)addOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selected:(NSString *)selecetedImage
{
    
    //设置底部Tabbar上面的图片和文字
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selecetedImage];
    vc.view.backgroundColor = SYRandomColor;
    //添加导航控制器
    SYNavigationViewController *nav = [[SYNavigationViewController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}
@end
