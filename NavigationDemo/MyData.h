//
//  MyData.h
//  NavigationDemo
//
//  Created by jackiege on 19/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyData : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, copy) NSString *name;

@end
