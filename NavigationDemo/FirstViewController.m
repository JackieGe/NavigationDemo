//
//  FirstViewController.m
//  NavigationDemo
//
//  Created by jackiege on 19/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//

#import "FirstViewController.h"
#import "EditViewController.h"
#import "MyData.h"

@interface FirstViewController () <EditViewDelegate>
{
    UITextField *tf;
    
    UITextField *tf2;

}
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.title = @"Home";
    
    UIImage *rightImage = [UIImage imageNamed:@"Edit"];
    rightImage = [rightImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:rightImage style:UIBarButtonItemStylePlain target:self action:@selector(goToEdit)];
    
    /*
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Category"] landscapeImagePhone:[UIImage imageNamed:@"Category"] style:UIBarButtonItemStyleDone target:self action:@selector(goToCategory)];
     */
    // Do any additional setup after loading the view.
    
    tf = [[UITextField alloc] initWithFrame:CGRectMake(30, 60, 100, 30)];
    tf.backgroundColor = [UIColor whiteColor];
    tf.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:tf];
    
    tf2 = [[UITextField alloc] initWithFrame:CGRectMake(30, 100, 100, 30)];
    tf2.backgroundColor = [UIColor whiteColor];
    tf2.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:tf2];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveMessage:) name:@"999" object:nil];

}

- (void)receiveMessage:(NSNotification *)notif {
    NSLog(@"Received: %@", notif.object);
    NSDictionary *contactInfo = (NSDictionary *)notif.userInfo;
    NSLog(@"name = %@", contactInfo[@"name"]);
    NSLog(@"age = %@", contactInfo[@"age"]);
}

- (void)editViewDidReturnWith:(NSString *)text {
    tf.text = text;
    tf2.text = [[MyData sharedInstance] name];
    
    // [[MyData sharedInstance] setName:tf2.text];
    NSLog(@"[MyData sharedInstance].name = %@ in root", [[MyData sharedInstance] name]);
}

- (void)goToEdit {
    NSLog(@"Will go to edit page");
    EditViewController *edit = [[EditViewController alloc] init];
    edit.text = tf.text;
    edit.delegate = self;
    
    __weak FirstViewController *weakSelf = self;
    edit.onReturnBlk = ^(NSString *text) {
        NSLog(@"The text returned: %@", text);
        //此处引用
        //weakSelf.
    };
    
    [self.navigationController pushViewController:edit animated:YES];
    

    MyData *myData = [MyData sharedInstance];
    myData.name = tf2.text;
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
