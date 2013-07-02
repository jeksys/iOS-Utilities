//
//  Created by Evgeny Yagrushkin on 2013-07-01.
//  Copyright (c) 2013 Evgeny Yagrushkin. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "CLLocationManager+EYTools.h"

@interface CLLocationManager (EYTools) <CLLocationManagerDelegate>

- (void) setUpdateLocationBlock:(void (^)(CLLocationManager *manager, CLLocation *newLocation, CLLocation *oldLocation, BOOL *stop))block;
- (void) setErrorBlock:(void (^)(NSError *error))block;

@end
