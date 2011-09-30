//
//  SESensisSearchURL.h
//  SearchExample
//
//  Created by C.P. Lim on 16/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SEQueryURL.h"

@interface SESensisSearchURL : NSObject<SEQueryURL> {
    NSString* _apiKey;
    NSString* _what;
    NSString* _where;
}
+(SESensisSearchURL*) sensisSearchURLWithApiKey:(NSString*)apiKey;
-(SESensisSearchURL*) initWithApiKey:(NSString*)apiKey;
-(SESensisSearchURL*) searchFor:(NSString*)what;
-(SESensisSearchURL*) at:(NSString*)where;
-(NSString*) asQueryUrl;
@end
