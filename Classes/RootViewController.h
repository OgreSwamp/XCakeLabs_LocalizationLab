
/*
     File: RootViewController.h
 Abstract:  Abstract: The table view controller responsible for displaying the list of books, supporting additional functionality:
 
 * Drill-down to display more information about a selected book using an instance of DetailViewController;
 * Addition of new books using an instance of AddViewController;
 * Deletion of existing books using UITableView's tableView:commitEditingStyle:forRowAtIndexPath: method.
 
 The root view controller creates and configures an instance of NSFetchedResultsController to manage the collection of books.  The view controller's managed object context is supplied by the application's delegate. When the user adds a new book, the root view controller creates a new managed object context to pass to the add view controller; this ensures that any changes made in the add controller do not affect the main managed object context, and they can be committed or discarded as a whole.
 */

#import "AddViewController.h"

@interface RootViewController : UITableViewController <NSFetchedResultsControllerDelegate, AddViewControllerDelegate> 

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end
