//
//  Person.h
//  打包.a文件
//
//  Created by lecochao on 2017/6/16.
//  Copyright © 2017年 lecochao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *phone;
@property(nonatomic,strong) NSString *address;
@property(nonatomic,strong) NSString *portrait;

+ (Person *)getNewPerson;
@end
