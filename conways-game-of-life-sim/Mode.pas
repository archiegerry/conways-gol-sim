unit Mode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmMode = class(TForm)
    btnNormal: TButton;
    btnHigh: TButton;
    btnCustom: TButton;
    info1: TStaticText;
    info2: TStaticText;
    info3: TStaticText;
    procedure btnNormalClick(Sender: TObject);
    procedure btnHighClick(Sender: TObject);
    procedure btnCustomClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMode: TfrmMode;

implementation

{$R *.dfm}

uses Start, Custom;


procedure TfrmMode.btnCustomClick(Sender: TObject);
begin
   frmCustom.show;
   frmMode.Hide;
end;

procedure TfrmMode.btnHighClick(Sender: TObject);
var I:integer;
begin
   for i := 0 to 8 do
   begin
     case i of
       0: frmCustom.setting[i] := 0;
       1: frmCustom.setting[i] := 0;
       2: frmCustom.setting[i] := 2;
       3: frmCustom.setting[i] := 1;
       4: frmCustom.setting[i] := 0;
       5: frmCustom.setting[i] := 0;
       6: frmCustom.setting[i] := 1;
       7: frmCustom.setting[i] := 0;
       8: frmCustom.setting[i] := 0;
     end;
   end;
   frmStart.show;
   frmMode.hide;
   end;

procedure TfrmMode.btnNormalClick(Sender: TObject);
var i:integer;
begin
  for i := 0 to 8 do
   begin
     case i of
       0: frmCustom.setting[i] := 0;
       1: frmCustom.setting[i] := 0;
       2: frmCustom.setting[i] := 2;
       3: frmCustom.setting[i] := 1;
       4: frmCustom.setting[i] := 0;
       5: frmCustom.setting[i] := 0;
       6: frmCustom.setting[i] := 0;
       7: frmCustom.setting[i] := 0;
       8: frmCustom.setting[i] := 0;
     end;
   end;
   frmStart.show;
   frmMode.hide;
end;

end.
