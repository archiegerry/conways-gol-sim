unit Custom;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmCustom = class(TForm)
    info2: TStaticText;
    info3: TStaticText;
    info1: TStaticText;
    one: TStaticText;
    two: TStaticText;
    three: TStaticText;
    four: TStaticText;
    five: TStaticText;
    six: TStaticText;
    eight: TStaticText;
    seven: TStaticText;
    n1: TRadioGroup;
    n2: TRadioGroup;
    n3: TRadioGroup;
    n4: TRadioGroup;
    n5: TRadioGroup;
    n6: TRadioGroup;
    n7: TRadioGroup;
    n8: TRadioGroup;
    zero: TStaticText;
    n0: TRadioGroup;
    finish: TButton;
    procedure finishClick(Sender: TObject);
  private

  public
     setting:array[0..8] of integer;
  end;

var
  frmCustom: TfrmCustom;

implementation

{$R *.dfm}

uses Start;


procedure TfrmCustom.finishClick(Sender: TObject);
var i:integer;
begin
    for i := 0 to 8 do
      begin
        case i of
        0: setting[i] := n0.ItemIndex;
        1: setting[i] := n1.ItemIndex;
        2: setting[i] := n2.ItemIndex;
        3: setting[i] := n3.ItemIndex;
        4: setting[i] := n4.ItemIndex;
        5: setting[i] := n5.ItemIndex;
        6: setting[i] := n6.ItemIndex;
        7: setting[i] := n7.ItemIndex;
        8: setting[i] := n8.ItemIndex;
        end;
      end;
    frmStart.show;
    frmCustom.Hide;

end;

end.
