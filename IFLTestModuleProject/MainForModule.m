//
//  MainForModule.m
//  IFLTestModuleProject
//
//  Created by erlich wang on 2022/7/20.
//

#import "MainForModule.h"

@BeeHiveService(IFLMainServiceProtocol, MainForModule)

@interface MainForModule () <IFLMainServiceProtocol>

@end

@implementation MainForModule

+ (BOOL)singleton {
    return YES;
}

+ (instancetype)shareInstance {
    static dispatch_once_t once_t;
    static id _instance = nil;
    
    dispatch_once(&once_t, ^{
        _instance = [[self alloc] init];
    });
    
    return _instance;
}

- (instancetype) init {
    NSLog(@" 单例 ---- %s ----", __func__);
    if (self = [super init]) {
        
    }
    return self;
}

#pragma mark - IFLMainServiceProtocol
- (NSString *)getConfigData {
    return @"我是主工程配置data";
}

@end
