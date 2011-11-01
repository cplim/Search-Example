//
//  SEQueryBuilderFactory.h
//  SearchExample
//
//  Created by C.P. Lim on 29/10/11.
//  Copyright (c) 2011 C.P. Lim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SESensisQueryBuilder.h"

@interface SEQueryBuilderFactory : NSObject
- (id) initWithSensisApiKey:(NSString*)apiKey;
- (id<SEQueryBuilder>) queryBuilder;
@end
