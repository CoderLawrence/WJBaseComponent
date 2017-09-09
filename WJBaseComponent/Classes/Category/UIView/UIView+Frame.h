//
// Created by Lawrence on 2017/8/13.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIView (Frame)

/*
 * x坐标
 */
- (CGFloat)x;
- (void)setX:(CGFloat)x;

/*
 * y坐标
 */
- (CGFloat)y;
- (void)setY:(CGFloat)y;

/*
 * 大小
 */
- (CGSize)size;
- (void)setSize:(CGSize)size;

/*
 * 左边
 */
- (CGFloat)right;

/*
 * 下边
 */
- (CGFloat)bottom;

/*
 * 宽度
 */
- (CGFloat)width;
- (void)setWidth:(CGFloat)width;

/*
 * 高度
 */
- (CGFloat)height;
- (void)setHeight:(CGFloat)height;

/*
 * 位置
 */
- (CGPoint)origin;
- (void)setOrigin:(CGPoint)origin;

/*
 * 实例化
 * @param size 大小
 */
- (instancetype)initWithSize:(CGSize)size;

/*
 * 裁剪圆角
 * @param direction 圆角方向
 * @param cornerRadius 圆角大小
 */
- (void)clipRectCornerWithDirection:(UIRectCorner)direction cornerRadius:(CGFloat)cornerRadius;

/*
 * 设置锚点
 *  see http://www.poboke.com/ios/use-the-anchor-point-in-ios-development.html
 *
 *  anchorPoint 0,0---0.5, 0----1,0
 *              |                |
 *              |                |
 *              0.5  0.5, 0.5  1,0.5
 *              |                |
 *              |                |
 *              1,0-- 0.5, 1 ---1,1
 */
- (void)setAnchorPoint:(CGPoint)anchorPoint;
- (void)setPosition:(CGPoint)point atAnchorPoint:(CGPoint)anchorPoint;

@end