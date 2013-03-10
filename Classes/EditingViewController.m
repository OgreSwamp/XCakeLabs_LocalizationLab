
/*
     File: EditingViewController.m
 Abstract: The table view controller responsible for editing a field of data -- either text or a date.
 */

#import "EditingViewController.h"


@interface EditingViewController ()

@property (nonatomic, weak) IBOutlet UITextField *textField;
@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@property (nonatomic, readonly, getter=isEditingDate) BOOL editingDate;

@end



@implementation EditingViewController
{
    BOOL hasDeterminedWhetherEditingDate;
}

@synthesize textField=_textField, editedObject=_editedObject, editedFieldKey=_editedFieldKey, editedFieldName=_editedFieldName, editingDate=_editingDate, datePicker=_datePicker;


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    // Set the title to the user-visible name of the field.
    self.title = self.editedFieldName;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Configure the user interface according to state.
    if (self.editingDate) {
        
        self.textField.hidden = YES;
        self.datePicker.hidden = NO;
        NSDate *date = [self.editedObject valueForKey:self.editedFieldKey];
        if (date == nil) {
            date = [NSDate date];
        }
        self.datePicker.date = date;
    }
    else {
        
        self.textField.hidden = NO;
        self.datePicker.hidden = YES;
        self.textField.text = [self.editedObject valueForKey:self.editedFieldKey];
        self.textField.placeholder = self.title;
        if (self.isNumber) {
            self.textField.keyboardType = UIKeyboardTypeDecimalPad;
        }
        [self.textField becomeFirstResponder];
    }
}


#pragma mark -
#pragma mark Save and cancel operations

- (IBAction)save:(id)sender
{
    // Set the action name for the undo operation.
    NSUndoManager * undoManager = [[self.editedObject managedObjectContext] undoManager];
    [undoManager setActionName:[NSString stringWithFormat:@"%@", self.editedFieldName]];
    
    // Pass current value to the edited object, then pop.
    if (self.editingDate) {
        [self.editedObject setValue:self.datePicker.date forKey:self.editedFieldKey];
    }
    else {
        if (self.isNumber) {
            NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
            [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
            NSNumber * number = [formatter numberFromString:self.textField.text];
            [self.editedObject setValue:number forKey:self.editedFieldKey];
        } else {
            [self.editedObject setValue:self.textField.text forKey:self.editedFieldKey];
        }
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)cancel:(id)sender
{
    // Don't pass current value to the edited object, just pop.
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark -
#pragma mark Manage whether editing a date

- (void)setEditedFieldKey:(NSString *)editedFieldKey
{
    if (![_editedFieldKey isEqualToString:editedFieldKey]) {
        hasDeterminedWhetherEditingDate = NO;
        _editedFieldKey = editedFieldKey;
    }
}


- (BOOL)isEditingDate
{
    if (hasDeterminedWhetherEditingDate == YES) {
        return _editingDate;
    }
    
    NSEntityDescription *entity = [self.editedObject entity];
    NSAttributeDescription *attribute = [[entity attributesByName] objectForKey:self.editedFieldKey];
    NSString *attributeClassName = [attribute attributeValueClassName];
    
    if ([attributeClassName isEqualToString:@"NSDate"]) {
        _editingDate = YES;
    }
    else {
        _editingDate = NO;
    }
    
    hasDeterminedWhetherEditingDate = YES;
    return _editingDate;
}


@end

