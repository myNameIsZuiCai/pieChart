//
//  drawView.m
//  画饼状图
//
//  Created by 上海均衡 on 2017/1/20.
//  Copyright © 2017年 上海均衡. All rights reserved.
//

#import "drawView.h"

@implementation drawView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/
- (void)drawRect:(CGRect)rect {
    // Drawing code
    NSArray *arr=[self arrayRandom];
    CGFloat startAngel=0;
    CGFloat angel=0;
    CGFloat endAngel=0;

    CGPoint center=CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    CGFloat radius=self.bounds.size.width/2;
    for (int i=0; i<arr.count; i++) {
        startAngel=endAngel;
        angel=[arr[i] doubleValue]/100.0 * M_PI*2;
        endAngel=startAngel+angel;
        UIBezierPath *path=[UIBezierPath bezierPathWithArcCenter:center radius:radius-5 startAngle:startAngel endAngle:endAngel clockwise:YES];
        [path addLineToPoint:center];
        [[self setEveryColor] set];
        [path fill];
    }
    
}
#pragma mark 设置随机数组
-(NSArray *)arrayRandom{
    int total=100;
    int temp=0;
    NSMutableArray *arr=[NSMutableArray array];
    for (int i=0; i<3; i++) {
        temp=arc4random_uniform(101)+1;
        [arr addObject:@(temp)];
        total -=temp;
    }
    if (total) {
        [arr addObject:@(total)];
    }
    return arr;
}
#pragma mark 单机屏幕的时候 颜色随机更换
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //重绘饼状图
    [self setNeedsDisplay];
    [self arrayRandom];
}

#pragma mark 设置每个区域颜色随机
-(UIColor *)setEveryColor{
    CGFloat red=arc4random_uniform(256)/255.0;
    CGFloat green=arc4random_uniform(256)/255.0;
    CGFloat blue=arc4random_uniform(256)/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1];
}
-(void)draw{
//    NSArray *arr=@[@25,@25,@50];
    //画第一个扇形
    //计算前的角度
    CGFloat startAngel=0;
    CGFloat angel=0;
    CGFloat endAngel=0;
    //夹角
    angel = 25/100.0 * M_PI*2;
    //第一个扇形结束时角度
    endAngel=startAngel+angel;
    CGPoint center=CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    CGFloat radius=self.bounds.size.width/2;
    UIBezierPath *path1=[UIBezierPath bezierPathWithArcCenter:center radius:radius - 5 startAngle:startAngel endAngle:endAngel clockwise:YES];
    [path1 addLineToPoint:center];
    [[UIColor redColor] set];
    [path1 fill];
    //第二个扇形结束时角度
    startAngel=endAngel;
    angel = 25/100.0 * M_PI*2;
    endAngel=startAngel+angel;
    //     CGPoint center=CGPointMake(rect.size.width/2, rect.size.height/2);
    //     CGFloat radius=rect.size.width/2;
    UIBezierPath *path2=[UIBezierPath bezierPathWithArcCenter:center radius:radius - 5 startAngle:startAngel endAngle:endAngel clockwise:YES];
    [path2 addLineToPoint:center];
    [[UIColor greenColor] set];
    [path2 fill];
    
    //第三个扇形结束时角度
    startAngel=endAngel;
    angel = 50/100.0 * M_PI*2;
    endAngel=startAngel+angel;
    //     CGPoint center=CGPointMake(rect.size.width/2, rect.size.height/2);
    //     CGFloat radius=rect.size.width/2;
    UIBezierPath *path3=[UIBezierPath bezierPathWithArcCenter:center radius:radius - 5 startAngle:startAngel endAngle:endAngel clockwise:YES];
    [path3 addLineToPoint:center];
    [[UIColor blueColor] set];
    [path3 fill];
}
@end
