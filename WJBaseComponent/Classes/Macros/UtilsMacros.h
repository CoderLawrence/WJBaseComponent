//
//  UtilsMacros.h
//  TodayNews
//
//  Created by Lawrence on 2017/6/21.
//  Copyright © 2017年 Lawrence. All rights reserved.
//

#ifndef UtilsMacros_h
#define UtilsMacros_h

//******************发布版本不输出调试信息********************
#ifdef DEBUG
    #define NSLog(...) NSLog(__VA_ARGS__)
    #define WJLog(foramt, ...) NSLog((@"文件名：%s\n" "函数名：%s  " "行号 : %d\n" format), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
    #define NSLog(...) {}
    #define WJLog(...) {}
#endif

//*****************字体相关宏******************************
#define UIFontSize(size)  ([UIFont systemFontOfSize:size])

// ****************颜色相关***********************
///RGBA颜色设置
#define WJColor(r, g, b, a) ([UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a])
///背景灰色
#define WJGlobalColor (WJColor(245, 245, 245, 1))
///统一红色颜色
#define WJGlobalRadColor (WJColor(245.0f, 80.0f, 83.0f, 1.0f))

// weak strong
#define __WEAKSELF(X) __weak __typeof(X) weakSelf = X;
#define __STRONGSELF(X) __strong __typeof(X) strongSelf = X;

//比较两个数的大小
#define MAXAB(A, B) ({__typeof(A) __a = (A); __typeof(B) __b = (B); __a > __b ? __a : __b;})

//判断字符串是否为空
#define KStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO)

#endif /* UtilsMacros_h */
