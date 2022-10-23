unit HelpInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.ImageList,
  Vcl.ImgList;

type
  TfrmHelpInfo = class(TForm)
    btnBack: TButton;
    ImageList1: TImageList;
    procedure btnBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHelpInfo: TfrmHelpInfo;

implementation

{$R *.dfm}

uses Help;

procedure TfrmHelpInfo.btnBackClick(Sender: TObject);
begin
   frmHelpInfo.Hide;
   frmHelp.Show;
end;

end.
