//
//  LocationManager.h
//  findme
//
//  Copyright (c) 2014 Yusuke Miyazaki.
//

#import <Foundation/Foundation.h>

@class LocationManager;

@interface LocationManager : NSObject

@property (nonatomic) BOOL done;
@property (nonatomic) int status;
@property (nonatomic) NSString *message;

@property (nonatomic) CLLocation *location;

- (id)init;
- (BOOL)getLocation;

@end