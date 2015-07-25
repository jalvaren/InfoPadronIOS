//
//  ViewController.m
//  InfoPadron
//
//  Created by PTech-Jalvaren on 25/07/15.

//

#import "ViewController.h"
#import "RestClient.h"
#import "AfiliacionCell.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *ciTF;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property AfiliacionResponse* searchResult;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)performSearch:(id)sender {
    
    [self.ciTF resignFirstResponder];
    UIAlertView *alert;
    alert = [[UIAlertView alloc] initWithTitle:@"Obteniendo datos\n" message:nil
                                      delegate:nil cancelButtonTitle:nil
                             otherButtonTitles: nil] ;
    
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
     indicator.color = [UIColor blueColor];
    [indicator startAnimating];
    
    [alert setValue:indicator forKey:@"accessoryView"];
    [alert show];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
       ^{
           self.searchResult=  [RestClient searchAfiliaciones:self.ciTF.text];
           dispatch_async(dispatch_get_main_queue(),
              ^{
                  [alert dismissWithClickedButtonIndex:0 animated:YES];
                  [self.tableView reloadData];
                  if(0 == self.searchResult.afiliaciones.count){
                  
                      UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:self.searchResult.msg
                                                                       message:nil
                                                                      delegate:nil
                                                             cancelButtonTitle:@"ok"
                                                             otherButtonTitles: nil] ;
                      [alert2 show];
                  }
              });
       });
}

#pragma mark TableViewController methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return self.searchResult.afiliaciones.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AfiliacionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"afiliacionCell" forIndexPath:indexPath];
    
   
    [cell setContent:self.searchResult.afiliaciones[indexPath.item]];
    return cell;
}
@end
