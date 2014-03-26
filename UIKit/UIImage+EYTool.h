//
//  UIImage+EYTool.h
//  Today's Parents
//
//  Created by Evgeny Yagrushkin on 11/22/2013.
//  Copyright (c) 2013 Rogers Media. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (EYTool)

-(UIImage *)makeRoundedImageWithRadius:(float)radius;
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
-(UIImage*)scaleToSize:(CGSize)size;
-(UIImage*)resizedImageToSize:(CGSize)dstSize;

- (UIImage *)croppedImage:(CGRect)bounds;
//- (UIImage *)thumbnailImage:(NSInteger)thumbnailSize
//          transparentBorder:(NSUInteger)borderSize
//               cornerRadius:(NSUInteger)cornerRadius
//       interpolationQuality:(CGInterpolationQuality)quality;
- (UIImage *)resizedImage:(CGSize)newSize
     interpolationQuality:(CGInterpolationQuality)quality;
- (UIImage *)resizedImageWithContentMode:(UIViewContentMode)contentMode
                                  bounds:(CGSize)bounds
                    interpolationQuality:(CGInterpolationQuality)quality;

- (UIImage*)imageByCropping:(UIImage *)imageToCrop toRect:(CGRect)rect;
- (UIImage *)crop:(CGRect)rect;

@end
