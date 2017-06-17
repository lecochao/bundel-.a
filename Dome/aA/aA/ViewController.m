//
//  ViewController.m
//  aA
//
//  Created by lecochao on 2017/6/16.
//  Copyright © 2017年 lecochao. All rights reserved.
//

#import "ViewController.h"
#import "OneAViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)pushAction:(id)sender {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"oneSource" ofType:@"bundle"];
    NSLog(@"path = %@", path);
    
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    NSLog(@"myBunlde = %@", bundle);
    NSError *error;
    [bundle loadAndReturnError:&error];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"XcOne" bundle:bundle];
    OneAViewController *one = [sb instantiateViewControllerWithIdentifier:@"OneAViewController"];
    one.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:one animated:YES];
    
    Person *pp = [Person getNewPerson];
    NSLog(@"%@...",pp.name);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
