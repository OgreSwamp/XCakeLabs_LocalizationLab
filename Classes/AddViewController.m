
/*
     File: AddViewController.m
 Abstract: The table view controller responsible managing addition of a new book to the application.
  When editing ends, the controller sends a message to its delegate (in this case, the root view controller) to tell it that it finished editing and whether the user saved their changes. It's up to the delegate to actually commit the changes.
 The view controller needs a strong reference to the managed object context to make sure it doesn't disappear while being used (a managed object doesn't have a strong reference to its context).
 */

#import "AddViewController.h"
#import "Book.h"


@interface AddViewController ()

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

@end


@implementation AddViewController

@synthesize delegate=_delegate, managedObjectContext=_managedObjectContext;


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{    
    [super viewDidLoad];
    
    // Set up the undo manager and set editing state to YES.
    [self setUpUndoManager];
    self.editing = YES;
}


- (void)viewDidUnload
{    
    [super viewDidUnload];
    [self cleanUpUndoManager];    
}


#pragma mark -
#pragma mark Save and cancel operations

- (IBAction)cancel:(id)sender
{
    [self.delegate addViewController:self didFinishWithSave:NO];
}


- (IBAction)save:(id)sender
{    
    [self.delegate addViewController:self didFinishWithSave:YES];
}


@end
