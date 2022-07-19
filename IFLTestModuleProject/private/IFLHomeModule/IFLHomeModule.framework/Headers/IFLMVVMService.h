//
//  IFLMVVMService.h
//  IFLArchitecture
//
//  Created by erlich wang on 2022/7/19.
//

#ifndef IFLMVVMService_h
#define IFLMVVMService_h

#import "BeeHive/BHServiceProtocol.h"

@protocol IFLMVVMServiceProtocol <NSObject, BHServiceProtocol>

@property(nonatomic, strong)NSString *serviceId;

- (void)setTitle:(NSString *)title content:(NSString *)content;

@end

#endif /* IFLMVVMService_h */
