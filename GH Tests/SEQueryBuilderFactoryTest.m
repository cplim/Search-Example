//
//  SEQueryBuilderFactoryTest.m
//  SearchExample
//
//  Created by C.P. Lim on 30/10/11.
//  Copyright (c) 2011 C.P. Lim. All rights reserved.
//

#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import "SEQueryBuilderFactoryTest.h"
#import "SEQueryBuilderFactory.h"

@implementation SEQueryBuilderFactoryTest

- (void)testShouldReturnNewQueryBuilder {
    SEQueryBuilderFactory* factory = [[SEQueryBuilderFactory alloc] initWithSensisApiKey:@"sensis api key"];
    id<SEQueryBuilder> builder1 = [factory queryBuilder];
    id<SEQueryBuilder> builder2 = [factory queryBuilder];
    expect(builder1).Not.toBeIdenticalTo(builder2);
}


@end
