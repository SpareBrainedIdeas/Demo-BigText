tableextension 70100 "SBI-BigText Item" extends Item
{
    fields
    {
        field(70100; "Some Really Big Text"; Blob)
        {
            Caption = 'Some Really Big Text';
            DataClassification = ToBeClassified;
        }
    }

    procedure GetActuallyExtendedText(): Text;
    var
        TypeHelper: Codeunit "Type Helper";
        TempBlob: Codeunit "Temp Blob";
        InStream: InStream;
        CR: Text[1];
    begin
        CalcFields("Some Really Big Text");
        if not "Some Really Big Text".HasValue then
            exit('');
        CR[1] := 10;
        TempBlob.FromRecord(Rec, Rec.FieldNo("Some Really Big Text"));
        TempBlob.CreateInStream(InStream, TextEncoding::UTF8);
        exit(TypeHelper.ReadAsTextWithSeparator(InStream, CR));
    end;

    procedure SetActuallyExtendedText(NewActuallyExtendedText: Text)
    var
        TempBlob: Codeunit "Temp Blob";
        Outstream: OutStream;
        RecRef: RecordRef;
    begin
        Clear("Some Really Big Text");
        if NewActuallyExtendedText = '' then
            exit;
        TempBlob.CreateOutStream(OutStream, TextEncoding::UTF8);
        OutStream.WriteText(NewActuallyExtendedText);
        RecRef.GetTable(Rec);
        RecRef.SetPosition(Rec.GetPosition());
        TempBlob.ToRecordRef(RecRef, Rec.FieldNo("Some Really Big Text"));
        RecRef.SetTable(Rec);
    end;
}
