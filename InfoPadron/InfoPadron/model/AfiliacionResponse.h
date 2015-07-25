//
//  AfiliacionResponse.h
//  InfoPadron
//
//  Created by PTech-Jalvaren on 25/07/15.
//

#import <Foundation/Foundation.h>
#import <Motis.h>
@interface AfiliacionResponse : NSObject
/*
 "ci":"1384943",
 "nombre_completo":"Guido Cabrera",
 "status":"0",
 "msg":"Posee las siguientes afiliaciones",
 "afiliaciones":[
 */

@property (nonatomic, strong) NSString *ci;
@property (nonatomic, strong) NSString *nombre_completo;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) NSArray * afiliaciones;
@property (nonatomic, strong) NSString * id;
@end
