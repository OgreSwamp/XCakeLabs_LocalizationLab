
/*
     File: EditingViewController.h
 Abstract: The table view controller responsible for editing a field of data -- either text or a date.
 */

@interface EditingViewController : UIViewController

@property (nonatomic, strong) NSManagedObject *editedObject;
@property (nonatomic, strong) NSString *editedFieldKey;
@property (nonatomic, strong) NSString *editedFieldName;
@property (nonatomic) BOOL isNumber;

@end

