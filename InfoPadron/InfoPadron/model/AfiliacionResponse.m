//
//  AfiliacionResponse.m
//  InfoPadron
//
//  Created by PTech-Jalvaren on 25/07/15.
//

#import "AfiliacionResponse.h"
#import "AfiliacionInfo.h"
@implementation AfiliacionResponse
+ (NSDictionary*)mts_arrayClassMapping
{
    return @{mts_key(afiliaciones): AfiliacionInfo.class,};
}
@end
