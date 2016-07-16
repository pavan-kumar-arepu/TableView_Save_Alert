//
//  ViewController.m
//  TableView
//
//  Created by Pavankumar Arepu on 16/07/16.
//  Copyright © 2016 Pavankumar Arepu. All rights reserved.
//

#import "ViewController.h"
#import "Constants.h"



@interface ViewController ()
{
    NSMutableArray *cardNumber,*cardName;
}
@property (weak, nonatomic) IBOutlet UITextField *creditCardTextField;
@property (weak, nonatomic) IBOutlet UITextField *creditCaraNameTextField;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

- (IBAction)saveCreditCard:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    cardName = [[NSMutableArray alloc]init];
    cardNumber = [[NSMutableArray alloc]init];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveCreditCard:(id)sender
{
    [cardNumber addObject:_creditCardTextField.text];
    [cardName addObject:_creditCaraNameTextField.text];
    [_myTableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return KNumberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [cardName count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell  *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                                    reuseIdentifier:@"Cell"];
    
    // Configure the cell...
    
    cell.imageView.image = [UIImage imageNamed:@"image2"];
    
    cell.textLabel.text = [cardNumber objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [cardName objectAtIndex:indexPath.row];
    
    NSLog(@"Cell\n:Number %ld : %@",(long)indexPath.row,cell);
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Card Alert"
                                                                   message:[NSString stringWithFormat:@"Thanks for Choosing %@",[cardName objectAtIndex:indexPath.row]]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* oKAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * action)
                               
                                   {
                                   UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Next Card Alert"
                                                                                                  message:[NSString stringWithFormat:@"Thanks for Choosing %@",[cardName objectAtIndex:indexPath.row]]
                                                                                           preferredStyle:UIAlertControllerStyleActionSheet];
                                   
                                   UIAlertAction* oKAction = [UIAlertAction actionWithTitle:@"Done" style:UIAlertActionStyleDefault
                                                                                    handler:^(UIAlertAction * action)
                                                              
                                                              {
                                                                  
                                                                  self.view.backgroundColor = [UIColor orangeColor];
                                                                  
                                                              }];
                                   
                                                                      [alert addAction:oKAction];
                                   
                                   [self presentViewController:alert animated:YES completion:nil];
                                   
                               }];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action)
                                   {
                                       self.view.backgroundColor = [UIColor redColor];
                                       
                                   }];
    
    [alert addAction:oKAction];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}




@end
