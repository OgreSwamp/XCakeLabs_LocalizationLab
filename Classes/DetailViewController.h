
/*
     File: DetailViewController.h
 Abstract: The table view controller responsible for displaying detailed information about a single book.  It also allows the user to edit information about a book, and supports undo for editing operations.
 
 When editing begins, the controller creates and set an undo manager to track edits. It then registers as an observer of undo manager change notifications, so that if an undo or redo operation is performed, the table view can be reloaded. When editing ends, the controller de-registers from the notification center and removes the undo manager.
 
 */

@class Book;

@interface DetailViewController : UITableViewController

@property (nonatomic, strong) Book *book;

@end


// These methods are used by the AddViewController, so are declared here, but they are private to these classes.

@interface DetailViewController (Private)

- (void)setUpUndoManager;
- (void)cleanUpUndoManager;

@end