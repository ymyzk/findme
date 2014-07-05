//
//  main.m
//  findme
//
//  Copyright (c) 2014 Yusuke Miyazaki.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "LocationManager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // NSArray *arguments = [[NSProcessInfo processInfo] arguments];
        // NSLog(@"%@", arguments);
        
        LocationManager *manager = [[LocationManager alloc] init];
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        NSString *message;
        
        [manager getLocation];
        
        // Wait synchronously
        while (!(manager.done) && [runLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]]);
        
        if (manager.status == 0) {
            // On success
            // Print out result "latitude,longitude,altitude"
            message = [NSString stringWithFormat:@"%lf,%lf,%lf\n",
                       manager.location.coordinate.latitude,
                       manager.location.coordinate.longitude,
                       manager.location.altitude];
            [message writeToFile:@"/dev/stdout" atomically:NO encoding:NSUTF8StringEncoding error:nil];
        } else {
            // On failure
            // Show error message
            message = [NSString stringWithFormat:@"%@\n", manager.message];
            [message writeToFile:@"/dev/stderr" atomically:NO encoding:NSUTF8StringEncoding error:nil];
        }
        
        return manager.status;
    }
}