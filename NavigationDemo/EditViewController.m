//
//  EditViewController.m
//  NavigationDemo
//
//  Created by jackiege on 19/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//

#import "EditViewController.h"
#import "MyData.h"

@interface EditViewController ()
{
    UITextField *tf;
    UITextField *tf2;
}
@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationItem.title = @"编辑";
    UIImage *rightImage = [UIImage imageNamed:@"home-32"];
    rightImage = [rightImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:rightImage style:UIBarButtonItemStyleDone target:self action:@selector(backToHome)];
    
    tf = [[UITextField alloc] initWithFrame:CGRectMake(30, 60, 100, 30)];
    tf.backgroundColor = [UIColor whiteColor];
    tf.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:tf];
    tf.text = _text;
    
    tf2 = [[UITextField alloc] initWithFrame:CGRectMake(30, 100, 100, 30)];
    tf2.backgroundColor = [UIColor whiteColor];
    tf2.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:tf2];
    
    tf2.text = [[MyData sharedInstance] name];

}

- (void)backToHome {
    NSLog(@"back to Home");
    
    [[MyData sharedInstance] setName:tf2.text];
    NSLog(@"[MyData sharedInstance].name = %@", tf2.text);

    // [self.navigationController popViewControllerAnimated:YES];
    if (self.delegate) {
        BOOL responds = [self.delegate respondsToSelector:NSSelectorFromString(@"editViewDidReturnWith:")];
        NSString *yesno = responds? @"YES" : @"NO";
        NSLog(@"responds to editViewDidReturnWith = %@", yesno);
        
        if (responds) {
            [self.delegate editViewDidReturnWith:tf.text];
        }
    }
    
    if (self.onReturnBlk) {
        NSString *formatedName = [NSString stringWithFormat:@"returned name %@", tf2.text];
        self.onReturnBlk(formatedName);
    }
    
    NSDictionary *contactInfo = @{@"name":@"Tom", @"age":@30};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"999" object:@"Contact" userInfo:contactInfo];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
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
