//
//  AfiliacionCell.m
//  InfoPadron
//
//  Created by PTech-Jalvaren on 25/07/15.
//

#import "AfiliacionCell.h"
#import "AfiliacionInfo.h"

@implementation AfiliacionCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setContent:(AfiliacionInfo*) afiliacion;{

    self.partidoLabel.text = afiliacion.partido;
    self.nombreLabel.text = [NSString
                             stringWithCString:[afiliacion.nombre_completo
                                                cStringUsingEncoding:NSUTF8StringEncoding]
                             encoding:NSNonLossyASCIIStringEncoding];;
    self.cedulaLabel.text = afiliacion.ci;
    self.lugarVotacionLabel.text = [NSString
                                    stringWithCString:[afiliacion.lugar_votacion
                                                       cStringUsingEncoding:NSUTF8StringEncoding]
                                    encoding:NSNonLossyASCIIStringEncoding];
    self.mesaLabel.text = afiliacion.mesa;
    self.ordenLabel.text = afiliacion.orden;
}

@end
