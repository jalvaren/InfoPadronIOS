//
//  AfiliacionCell.h
//  InfoPadron
//
//  Created by PTech-Jalvaren on 25/07/15.

//

#import <UIKit/UIKit.h>
@class AfiliacionInfo;

@interface AfiliacionCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *partidoLabel;
@property (strong, nonatomic) IBOutlet UILabel *nombreLabel;
@property (strong, nonatomic) IBOutlet UILabel *cedulaLabel;
@property (strong, nonatomic) IBOutlet UILabel *lugarVotacionLabel;
@property (strong, nonatomic) IBOutlet UILabel *mesaLabel;
@property (strong, nonatomic) IBOutlet UILabel *ordenLabel;

- (void) setContent:(AfiliacionInfo*) afiliacion;
@end
