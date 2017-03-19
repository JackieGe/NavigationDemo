//
//  EditViewController.h
//  NavigationDemo
//
//  Created by jackiege on 19/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditViewDelegate <NSObject>

@optional
- (void)editViewDidReturnWith:(NSString *)text;

@end

@interface EditViewController : UIViewController
@property (nonatomic, copy) NSString *text;
@property (nonatomic, weak) id<EditViewDelegate> delegate;
@end
