//
//  LocationManager.m
//  findme
//
//  Copyright (c) 2014 Yusuke Miyazaki.
//

#import <CoreLocation/CoreLocation.h>

#import "LocationManager.h"

@interface LocationManager () <CLLocationManagerDelegate>

@property (nonatomic) CLLocationManager *manager;

@end

@implementation LocationManager

- (id)init {
    self = [super init];
    if (self) {
        self.manager = [[CLLocationManager alloc] init];
        self.manager.delegate = self;
        self.done = NO;
        self.status = -1;
        self.message = nil;
        self.location = nil;
    }
    return self;
}

- (BOOL)getLocation {
    if (![CLLocationManager locationServicesEnabled]) {
        self.location = nil;
        self.done = YES;
        self.status = 1;
        self.message = @"Failure: Location services are disabled.";
        return NO;
    } else if (([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied)
               || ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusRestricted)) {
        self.location = nil;
        self.done = YES;
        self.status = 1;
        self.message = @"Failure: Location services are not authorized.";
        return NO;
    }
    [self.manager startUpdatingLocation];
    return YES;
}

#pragma mark - Methods for CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    self.location = newLocation;
    self.done = YES;
    self.status = 0;
    self.message = @"Success";
    [manager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    self.location = nil;
    self.done = YES;
    self.status = 1;
    self.message = @"Failure";
    [manager stopUpdatingLocation];
}

@end