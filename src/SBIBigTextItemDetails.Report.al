report 70100 "SBI-BigText Item Details"
{
    Caption = 'Item Extended Details';
    RDLCLayout = 'ItemDetails.rdl';
    dataset
    {
        dataitem(Item; Item)
        {
            column(No; Item."No.")
            {
            }
            column(Description; Item.Description)
            {
            }
            column(Some_Really_Big_Text; ActuallyExtendedText)
            {
            }
            trigger OnAfterGetRecord()
            begin
                ActuallyExtendedText := Item.GetActuallyExtendedText();
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }

    var
        ActuallyExtendedText: Text;
}
