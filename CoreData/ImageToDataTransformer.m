//
//  ImageToDataTransformer.m
//  Today's Parents
//
//  Created by Evgeny Yagrushkin on 11/19/2013.
//  Copyright (c) 2013 Rogers Media. All rights reserved.
//

#import "ImageToDataTransformer.h"

@implementation ImageToDataTransformer

+ (BOOL)allowsReverseTransformation {
	return YES;
}

+ (Class)transformedValueClass {
	return [NSData class];
}

- (id)transformedValue:(id)value {
	NSData *data = UIImagePNGRepresentation(value);
	return data;
}

- (id)reverseTransformedValue:(id)value {
	UIImage *image = [[UIImage alloc] initWithData:value];
	return image;
}

@end
