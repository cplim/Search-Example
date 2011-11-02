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
    SESensisQueryBuilder* builder1 = [factory sensisQueryBuilder];
    SESensisQueryBuilder* builder2 = [factory sensisQueryBuilder];
    expect(builder1).Not.toBeIdenticalTo(builder2);
}


@end
