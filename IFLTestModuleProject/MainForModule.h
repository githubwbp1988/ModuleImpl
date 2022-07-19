//
//  MainForModule.h
//  IFLTestModuleProject
//
//  Created by erlich wang on 2022/7/20.
//

#import <Foundation/Foundation.h>
#import "BeeHive/BHServiceProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol IFLMainServiceProtocol <NSObject, BHServiceProtocol>

- (NSString *)getConfigData;

@end

@interface MainForModule : NSObject

+ (instancetype)shareInstance;

@end

NS_ASSUME_NONNULL_END
