unit Menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Start, Help, ExtCtrls, jpeg, StdCtrls;

type
  TfrmMenu = class(TForm)
    title: TStaticText;
    imgMenu: TImage;
    btnStart: TButton;
    btnAccount: TButton;
    btnHelp: TButton;
    btnExit: TButton;
    staticLogin: TLabel;
    username: TLabel;
    testbutton: TButton;
    procedure btnStartClick(Sender: TObject);
    procedure btnAccountClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure testbuttonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

uses Mode, Signup, Login, Account, Code;

procedure TfrmMenu.btnStartClick(Sender: TObject);
begin
 if username.Caption = '(null)' then
    begin
      frmMode.Show;        //to be changed
      frmMenu.hide;
    end
  else
    begin
      frmMode.Show;
      frmMenu.hide;
    end;

end;

procedure TfrmMenu.testbuttonClick(Sender: TObject);
begin
    showmessage(frmCode.hash('Archiehgvsdgviusdivuhsdoivh'));
end;

procedure TfrmMenu.FormCreate(Sender: TObject);
var temp:string;
begin
   UserToken := TUserToken.create;
   temp := UserToken.getUserID;
   if temp = ' ' then
   begin
      username.Caption := 'NOT LOGGED IN';
   end
   else
   begin
      username.Caption := temp;
   end;
end;

procedure TfrmMenu.FormShow(Sender: TObject);
var temp:boolean;
begin
   username.Caption := UserToken.getUserID;
   if not UserToken.getlogin then
    begin
      btnStart.Enabled := false;
    end
   else
    begin
      btnStart.Enabled := true;
    end;
end;

procedure TfrmMenu.btnAccountClick(Sender: TObject);
begin
  if UserToken.getLogin = false then
    begin
      frmLogin.show;
      frmMenu.Hide;
    end
  else
    begin
      frmAccount.show;
      frmMenu.Hide;
    end;
end;

procedure TfrmMenu.btnHelpClick(Sender: TObject);
begin
  frmHelp.Show;
  frmMenu.hide;
end;

procedure TfrmMenu.btnExitClick(Sender: TObject);
begin
  application.Terminate;
end;

end.
