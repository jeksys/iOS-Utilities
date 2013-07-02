//
//  Created by Evgeny Yagrushkin on 2013-07-01.
//  Copyright (c) 2013 Evgeny Yagrushkin. All rights reserved.
//

#import "CLLocationManager+EYTools.h"
#import <objc/runtime.h>

@implementation CLLocationManager (EYTools)

- (void) setUpdateLocationBlock:(void (^)(CLLocationManager *manager, CLLocation *newLocation, CLLocation *oldLocation, BOOL *stop))block{
    
	objc_setAssociatedObject(self, "updateLocationBlock", [block copy], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = self;
}

- (void) setErrorBlock:(void (^)(NSError *error))block{
	objc_setAssociatedObject(self, "errorBlock", [block copy], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
	BOOL stop = NO;
    void (^updateLocationBlock_)(CLLocationManager *manager, CLLocation *newLocation, CLLocation *oldLocation, BOOL *stop)  = objc_getAssociatedObject(self, "updateLocationBlock");
	if (updateLocationBlock_) {
		updateLocationBlock_(manager, newLocation, oldLocation, &stop);
        if (stop) {
            [manager stopUpdatingLocation];
        }
	}
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    void (^errorBlock)(NSError *error)  = objc_getAssociatedObject(self, "errorBlock");
	if (errorBlock) {
		errorBlock(error);
	}
}

@end
