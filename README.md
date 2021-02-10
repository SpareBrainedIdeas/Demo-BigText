# Spare Brained Ideas - Demo BigText
Demonstrating use of the BLOB Memo content on Pages and Reports in Microsoft Dynamics 365 Business Central.

## Table

The Table getting the BLOB field also gets helper Getter/Setter type functions

## Page

The Page displaying the BLOB gets a Variable to store the Text data.  We load the Text Var OnAfterGetRecord from the getter.  We also push the data back in the OnValidate of the field.

## Report

If you load a Text Variable from the Getter the same way, you can include the BLOB content in the Report Data.



### Caveats -

Use this very carefully, as BLOB content can quickly make report datasets balloon to be too large.
