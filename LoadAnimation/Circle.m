//
//  Circle.m
//  LoadAnimation
//
//  Created by shenliping on 16/4/1.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "Circle.h"

@interface Circle ()

@property (strong, nonatomic) CAShapeLayer *circleLayer;

@end

@implementation Circle

- (CAShapeLayer *)circleLayer{
    if (_circleLayer == nil) {
        _circleLayer = [CAShapeLayer layer];
        _circleLayer.fillColor = [UIColor clearColor].CGColor;
        _circleLayer.strokeColor = [UIColor whiteColor].CGColor;
        _circleLayer.lineWidth = 2;
        _circleLayer.strokeEnd = _circleLayer.strokeStart = 0;
        _circleLayer.opacity = 1;
    }
    return _circleLayer;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self.layer addSublayer:self.circleLayer];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)start{
     NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval: 1 target: self selector: @selector(statrAnimation) userInfo: nil repeats: YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)set_path{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.center radius:self.frame.size.width / 2 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    self.circleLayer.path = path.CGPath;
}

- (void)statrAnimation{
    CABasicAnimation *startAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    startAnimation.beginTime = 
    startAnimation.fromValue = @0;
    startAnimation.toValue = @1;
    startAnimation.removedOnCompletion = YES;
    startAnimation.duration = 1;
//    startAnimation.repeatCount = 10;
    [self.circleLayer addAnimation: startAnimation forKey: @"start"];
    
    CABasicAnimation * endAnimation = [CABasicAnimation animationWithKeyPath: @"strokeStart"];
    endAnimation.beginTime = CACurrentMediaTime() + 0.5;
    endAnimation.fromValue = @0;
    endAnimation.toValue = @1;
    endAnimation.removedOnCompletion = YES;
    endAnimation.duration = 0.5;
    [self.circleLayer addAnimation: endAnimation forKey: @"end"];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
