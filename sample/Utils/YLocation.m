//
//  YLocation.m
//  sample
//
//  Created by ysnows on 2020/3/19.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "YLocation.h"
#import <CoreLocation/CoreLocation.h>

@interface YLocation () <CLLocationManagerDelegate>

@property(nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation YLocation

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static YLocation *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[super alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
    }
    return self;
}

- (void)checkLocation {
    if (![_locationManager locationServicesEnabled]) {

    }

    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        [_locationManager requestWhenInUseAuthorization];
    }

}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {

    CLLocation *location = [locations firstObject];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        if ([placemarks count] >0){
            
               CLPlacemark *mark= [placemarks firstObject];
//               NSString *city=[mark.addressDictionary objectForKey:@"City"];
//               NSLog(@"dictcity: %@", city);
            
               NSLog(@" mark.locality: %@",  mark.locality);
           
           //rac
        }
    }];
    
    [self.locationManager stopUpdatingLocation];

}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.locationManager startUpdatingLocation];
    }
}


@end
