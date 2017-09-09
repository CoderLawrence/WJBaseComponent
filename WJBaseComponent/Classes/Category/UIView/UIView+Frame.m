//
// Created by Lawrence on 2017/8/13.
//

#import "UIView+Frame.h"


@implementation UIView (Frame)

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {
    [self setOrigin:CGPointMake(x, self.y)];
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y {
    [self setOrigin:CGPointMake(self.x, y)];
}

- (CGFloat)right {
    return self.x + self.width;
}

- (CGFloat)bottom {
    return self.y + self.height;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    [self setSize:CGSizeMake(width, self.height)];
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    [self setSize:CGSizeMake(self.width, height)];
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    self.frame = (CGRect){self.origin, size};
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    self.frame = (CGRect){origin, self.size};
}

/*
 * 实例化
 * @param size 大小
 */
- (instancetype)initWithSize:(CGSize)size {
    CGRect rect = (CGRect){CGPointZero, size};
    return [self initWithFrame:rect];
}

/*
 * 裁剪圆角
 * @param direction 圆角方向
 * @param cornerRadius 圆角大小
 */
- (void)clipRectCornerWithDirection:(UIRectCorner)direction cornerRadius:(CGFloat)cornerRadius {
    CGSize cornerSize = CGSizeMake(cornerRadius, cornerRadius);
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:direction cornerRadii:cornerSize];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = [maskPath CGPath];
    [self.layer addSublayer:maskLayer];
    self.layer.mask = maskLayer;
}

- (void)setAnchorPoint:(CGPoint)anchorPoint {
    [self setPosition:self.origin atAnchorPoint:anchorPoint];
}

- (void)setPosition:(CGPoint)point atAnchorPoint:(CGPoint)anchorPoint {
    // See http://www.poboke.com/ios/use-the-anchor-point-in-ios-development.html

    CGFloat x = point.x - anchorPoint.x * self.width;
    CGFloat y = point.y - anchorPoint.y * self.height;
    [self setOrigin:CGPointMake(x, y)];
}


@end