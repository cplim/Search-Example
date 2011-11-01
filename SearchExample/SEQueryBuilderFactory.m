//
//  SEQueryBuilderFactory.m
//  SearchExample
//
//  Created by C.P. Lim on 29/10/11.
//  Copyright (c) 2011 C.P. Lim. All rights reserved.
//

#import "SEQueryBuilderFactory.h"

@interface SEQueryBuilderFactory()
@property (nonatomic, retain) NSString* sensisApiKey;
@end

@implementation SEQueryBuilderFactory

@synthesize sensisApiKey;

- (id) initWithSensisApiKey:(NSString*)apiKey {
    self = [super init];
    if (self) {
        sensisApiKey = [apiKey retain];
    }
    
    return self;
}

- (void)dealloc {
    [self.sensisApiKey release];
    [super dealloc];
}

- (id<SEQueryBuilder>) queryBuilder {
    return [[SESensisQueryBuilder queryBuilderWithApiKey:sensisApiKey] autorelease];
}


@end
