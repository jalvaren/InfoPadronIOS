//
//  RestClient.h
//  InfoPadron
//
//  Created by PTech-Jalvaren on 25/07/15.
//

#import <Foundation/Foundation.h>
#import "AfiliacionResponse.h"


@interface RestClient : NSObject
 + (AfiliacionResponse *) searchAfiliaciones:(NSString *)ci;
@end
