unit Help;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Vcl.Menus, Vcl.Buttons;

type
  TfrmHelp = class(TForm)
    title: TStaticText;
    btnBack: TButton;
    btnGroup: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    txt1: TStaticText;
    txt2: TStaticText;
    txt3: TStaticText;
    txt4: TStaticText;
    txt5: TStaticText;
    txt6: TStaticText;
    procedure btnBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHelp: TfrmHelp;

implementation

{$R *.dfm}

uses Menu, HelpInfo;

procedure TfrmHelp.btnBackClick(Sender: TObject);
begin
    frmHelp.Hide;
    frmMenu.Show;
end;

end.
