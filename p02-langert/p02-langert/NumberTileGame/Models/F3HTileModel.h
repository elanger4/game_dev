//
//  F3HTileModel.h
//  NumberTileGame
//
//  Created by Erik Langert
//
//

#import <Foundation/Foundation.h>

@interface F3HTileModel : NSObject

@property (nonatomic) BOOL empty;
@property (nonatomic) NSUInteger value;
+ (instancetype)emptyTile;

@end
