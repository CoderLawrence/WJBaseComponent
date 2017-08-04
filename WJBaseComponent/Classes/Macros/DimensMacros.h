//
//  DimensMacros.h
//  TodayNews
//  定义尺寸类的宏
//  Created by Lawrence on 2017/6/21.
//  Copyright © 2017年 Lawrence. All rights reserved.
//

#ifndef DimensMacros_h
#define DimensMacros_h

// ***************状态栏、导航栏高度***************
///状态栏高度
#define STATUS_BAR_HEIGHT (20.0f)
///导航栏高度
#define NAVIGATION_BAR_HEIGHT (44.0f)
///底部栏高度
#define TABBAR_HEIGHT 49

///状态栏和导航栏高度
#define STATUS_AND_NAVIGATION_BAR_HEIGHT ((STATUS_BAR_HEIGHT) + (NAVIGATION_BAR_HEIGHT))
///TableView高度
#define TABLE_VIEW_HEIGHT (SCREEN_HEIGHT - STATUS_AND_NAVIGATION_BAR_HEIGHT)
//TableView高度（不带tabbar的高度）
#define TABLE_VIEW_HEIGHT_WITH_TABBAR (TABLE_VIEW_HEIGHT - TABBAR_HEIGHT)

// ****************屏幕相关***********************
///屏幕宽度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
///屏幕高度
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
///屏幕比例
#define SCREEN_SCALE ([UIScreen mainScreen].scale)

// ****************字体相关宏*********************

#endif /* DimensMacros_h */
