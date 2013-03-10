
/*
     File: AddViewController.h
 Abstract: The table view controller responsible managing addition of a new book to the application.
  When editing ends, the controller sends a message to its delegate (in this case, the root view controller) to tell it that it finished editing and whether the user saved their changes. It's up to the delegate to actually commit the changes.
 The view controller needs a strong reference to the managed object context to make sure it doesn't disappear while being used (a managed object doesn't have a strong reference to its context).
 */

#import "DetailViewController.h"


@protocol AddViewControllerDelegate;


@interface AddViewController : DetailViewController 

@property (nonatomic, weak) id <AddViewControllerDelegate> delegate;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end


@protocol AddViewControllerDelegate
- (void)addViewController:(AddViewController *)controller didFinishWithSave:(BOOL)save;
@end

