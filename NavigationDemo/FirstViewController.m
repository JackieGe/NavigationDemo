//
//  FirstViewController.m
//  NavigationDemo
//
//  Created by jackiege on 19/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//

#import "FirstViewController.h"
#import "EditViewController.h"

@interface FirstViewController () <EditViewDelegate>
{
    UITextField *tf;
}
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.title = @"Home";
    
    UIImage *rightImage = [UIImage imageNamed:@"Edit"];
    rightImage = [rightImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:rightImage style:UIBarButtonItemStylePlain target:self action:@selector(goToCategory)];
    
    /*
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Category"] landscapeImagePhone:[UIImage imageNamed:@"Category"] style:UIBarButtonItemStyleDone target:self action:@selector(goToCategory)];
     */
    // Do any additional setup after loading the view.
    
    tf = [[UITextField alloc] initWithFrame:CGRectMake(30, 60, 100, 30)];
    tf.backgroundColor = [UIColor whiteColor];
    tf.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:tf];
}

- (void)editViewDidReturnWith:(NSString *)text {
    tf.text = text;
}

- (void)goToCategory {
    NSLog(@"Will go to Category page");
    EditViewController *edit = [[EditViewController alloc] init];
    edit.text = tf.text;
    edit.delegate = self;
    [self.navigationController pushViewController:edit animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
