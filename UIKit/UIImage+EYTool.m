//
//  UIImage+EYTool.m
//  Today's Parents
//
//  Created by Evgeny Yagrushkin on 11/22/2013.
//  Copyright (c) 2013 Rogers Media. All rights reserved.
//

#import "UIImage+EYTool.h"

@implementation UIImage (EYTool)

-(UIImage *)makeRoundedImageWithRadius:(float)radius
{
    CALayer *imageLayer = [CALayer layer];
    imageLayer.frame = CGRectMake(0, 0, self.size.width, self.size.height);
    imageLayer.contents = (id) self.CGImage;
    
    imageLayer.masksToBounds = YES;
    imageLayer.cornerRadius = radius;
    
    UIGraphicsBeginImageContext(self.size);
    [imageLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *roundedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return roundedImage;
}

@end
