//
//  MyData.m
//  NavigationDemo
//
//  Created by jackiege on 19/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//

#import "MyData.h"

@implementation MyData

static MyData *myData = nil;

+ (instancetype)sharedInstance {
    if (!myData) {
        myData = [[MyData alloc] init];
    }
    return myData;
}

@end
