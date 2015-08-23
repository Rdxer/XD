//
//  LXFSAXVideo.h
//  json test
//
//  Created by Xiaofeng Li  on 15/8/23.
//  Copyright © 2015年 Xiaofeng Li . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXFSAXVideo : NSObject

+ (void)parserVideo:(NSData *)data finished:(void (^)(NSArray *array))finishBlock;

@end
