//
//  RestClient.m
//  InfoPadron
//
//  Created by PTech-Jalvaren on 25/07/15.
//

#import "RestClient.h"



#define URL_WS_INFOPADRON @"https://infopadron.cmelgarejo.net/api/afiliaciones/"

#define RESTCONTROLLER_DEBUG
@implementation RestClient




+ (NSDictionary *)performRequest:(NSString*) url method:(NSString*) method parameters:(NSString *)requestParameters
{
    
    NSMutableURLRequest *loginRequest = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:url]];
    [loginRequest setHTTPMethod:method];
    
#ifdef RESTCONTROLLER_DEBUG
    NSLog(@"Request POST Parameters =\n%@\n%@", url,requestParameters);
#endif
    
    if (requestParameters != nil){
        NSData *RequestPostData = [requestParameters dataUsingEncoding:NSUTF8StringEncoding];
        [loginRequest setHTTPBody:RequestPostData];
        
    }
    
    
    NSError *error;
    NSURLResponse *reqResponse;
    NSData *reqData = [NSURLConnection sendSynchronousRequest:loginRequest
                                            returningResponse:&reqResponse
                                                        error:&error];
    
    NSString *jsonString = [[NSString alloc]initWithData:reqData encoding:NSUTF8StringEncoding];
    
    //XXX add more error detection and  handling
    if (jsonString == nil)
        {
        NSLog(@"Failed to connect-%@",url);
        return nil;
        }
#ifdef RESTCONTROLLER_DEBUG
    NSLog(@"RequestResult==%@\n\n%@",url,jsonString);
#endif
    
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding]
                                                               options:NSJSONReadingMutableContainers
                                                                 error:&error];
    return jsonObject;
}

#pragma mark Interface

+ (AfiliacionResponse *) searchAfiliaciones:(NSString *)ci;
{
    
#warning validate ci
    
    NSString * urlwithParameters = [NSString stringWithFormat:@"%@%@",URL_WS_INFOPADRON,ci];
    urlwithParameters = [urlwithParameters stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    
  
    
    NSDictionary* jsonObject = [self performRequest:urlwithParameters
                                             method:@"GET"
                                         parameters:nil];
    
    AfiliacionResponse * instance = [[AfiliacionResponse alloc] init];
    [instance mts_setValuesForKeysWithDictionary:jsonObject];
    return instance;
}
@end
