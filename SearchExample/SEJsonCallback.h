//
//  SEJsonCallback.h
//  SearchExample
//
//  Created by C.P. Lim on 29/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SEJsonCallback
- (void) onSuccess:(NSDictionary*)jsonData;
- (void) onFailure:(NSError*)error;
@end
