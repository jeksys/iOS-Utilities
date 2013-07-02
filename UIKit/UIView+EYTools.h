//
//  Created by Evgeny Yagrushkin on 2013-07-01.
//  Copyright (c) 2013 Evgeny Yagrushkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (EYTools)
-(void) setOrigin:(CGPoint)loc;
-(void) setX:(CGFloat)x;
-(void) setY:(CGFloat)y;
-(void) setSize:(CGSize)sz;
-(void) setWidth:(CGFloat)w;
-(void) setHeight:(CGFloat)h;
-(void) setCenterX:(CGFloat) x;
-(void) setCenterY:(CGFloat) y;
-(CGPoint) origin;
-(CGFloat) x;
-(CGFloat) y;
-(CGFloat) left;
-(CGFloat) top;
-(CGFloat) bottom;
-(CGFloat) right;
-(CGSize) size;
-(CGFloat) height;
-(CGFloat) width;
-(CGFloat) centerX;
-(CGFloat) centerY;
@end
