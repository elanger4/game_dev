//
//  F3HTileAppearanceProvider.h
//  NumberTileGame
//
//  Created by Erik Langert.
//
//

#import <Foundation/Foundation.h>

@protocol F3HTileAppearanceProviderProtocol <NSObject>

- (UIColor *)tileColorForValue:(NSUInteger)value;
- (UIColor *)numberColorForValue:(NSUInteger)value;
- (UIFont *)fontForNumbers;

@end

@interface F3HTileAppearanceProvider : NSObject <F3HTileAppearanceProviderProtocol>

@end
