//
//  SESensisQueryBuilder.h
//  SearchExample
//
//  Created by C.P. Lim on 16/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SESensisQueryBuilder : NSObject {
    NSString* _apiKey;
    NSString* _what;
    NSString* _where;
    int _pageNumber;
    int _rows;
}
+(SESensisQueryBuilder*) queryBuilderWithApiKey:(NSString*)apiKey;
-(SESensisQueryBuilder*) initWithApiKey:(NSString*)apiKey;
-(SESensisQueryBuilder*) searchFor:(NSString*)what;
-(SESensisQueryBuilder*) at:(NSString*)where;
-(SESensisQueryBuilder*) onPage:(int)pageNumber;
-(SESensisQueryBuilder*) withRows:(int)rows;
-(NSString*) asQueryUrl;
@end
