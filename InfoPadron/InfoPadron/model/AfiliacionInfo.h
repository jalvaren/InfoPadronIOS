//
//  AfiliacionInfo.h
//  InfoPadron
//
//  Created by PTech-Jalvaren on 25/07/15.
//

#import <Foundation/Foundation.h>
#import <Motis.h>
@interface AfiliacionInfo : NSObject
/*
 *"partido":"ANR",
 "nombre_completo":"Guido Cabrera",
 "ci":"1.384.943",
 "lugar_votacion":"Local: Escuela Nacional Area 5 Seccional: Presidente Franco 2 Distrito: Presidente Franco Zona: Presidente Franco Dpto: Alto Parana",
 "mesa":"10",
 "orden":"86"
 */
@property (nonatomic, strong) NSString *partido;
@property (nonatomic, strong) NSString *nombre_completo;
@property (nonatomic, strong) NSString *ci;
@property (nonatomic, strong) NSString *lugar_votacion;
@property (nonatomic, strong) NSString *mesa;
@property (nonatomic, strong) NSString *orden;
@end
