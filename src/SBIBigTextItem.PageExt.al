pageextension 70100 "SBI-BigText Item" extends "Item Card"
{
    layout
    {
        addlast(Item)
        {

            field(ActuallyExtendedText; ActuallyExtendedText)
            {
                ApplicationArea = All;
                MultiLine = true;

                trigger OnValidate()
                begin
                    Rec.SetActuallyExtendedText(ActuallyExtendedText);
                end;
            }
        }
    }

    actions
    {
        addlast(Reporting)
        {
            action(ItemInvoiceAction)
            {
                ApplicationArea = All;
                Image = ItemInvoice;
                RunObject = Report "SBI-BigText Item Details";
                RunPageOnRec = true;
                Caption = 'Item Extended Details';
            }
        }
    }

    var
        ActuallyExtendedText: Text;

    trigger OnAfterGetRecord()
    begin
        ActuallyExtendedText := Rec.GetActuallyExtendedText();
    end;
}
