//
//  F3HQueueCommand.h
//  NumberTileGame
//
//  Created by Erik Langert
//
//

#import <Foundation/Foundation.h>

#import "F3HGameModel.h"

@interface F3HQueueCommand : NSObject

@property (nonatomic) F3HMoveDirection direction;
@property (nonatomic, copy) void(^completion)(BOOL atLeastOneMove);

+ (instancetype)commandWithDirection:(F3HMoveDirection)direction completionBlock:(void(^)(BOOL))completion;

@end
