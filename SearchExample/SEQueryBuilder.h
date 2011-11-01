//
//  SEQueryBuilder.h
//  SearchExample
//
//  Created by C.P. Lim on 30/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SEQueryBuilder <NSObject>
-(id<SEQueryBuilder>) searchFor:(NSString*)what;
-(id<SEQueryBuilder>) at:(NSString*)where;
-(id<SEQueryBuilder>) onPage:(int)pageNumber;
-(id<SEQueryBuilder>) withRows:(int)rows;
-(NSString*) asQueryUrl;
@end
