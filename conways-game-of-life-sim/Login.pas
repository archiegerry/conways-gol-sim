unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Vcl.StdCtrls, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat;

type
  TfrmLogin = class(TForm)
    LOGIN: TLabel;
    userEntry: TEdit;
    passEntry: TEdit;
    FDConnection1: TFDConnection;
    staticUser: TLabel;
    staticPass: TLabel;
    btnLogin: TButton;
    btnSignup: TButton;
    btnCancel: TButton;
    prompt: TLabel;
    FDQuery1: TFDQuery;
    procedure btnSignupClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public

  end;

   TUserToken = class(TfrmLogin)
      private
          UserID:string;
          loggedin:boolean;
      public
          constructor create;
          function getUserID :string;
          function getlogin :boolean;
          procedure setUserID(UserID:string);
    end;

var
  frmLogin: TfrmLogin;
  UserToken : TUserToken;
  temp, test:string;

implementation

{$R *.dfm}

uses Signup, Menu, Start;

Constructor TUserToken.create;
begin
    self.UserID := UserID;
    loggedin := false;
end;

function TUserToken.getUserID:string;
begin
    if loggedin = true then
      begin
       result := self.UserID;
      end
    else
      begin
       result := '';
      end;
end;

function TUserToken.getlogin;
begin
    result := self.loggedin;
end;

procedure TUserToken.setUserID (UserID:string);
begin
    self.UserID := UserID;
    self.loggedin := true;
end;

procedure TfrmLogin.btnCancelClick(Sender: TObject);
begin
    frmMenu.Show;
    frmLogin.Hide;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
var temp:string;
begin


    with FDQuery1 do
      begin
        SQL.Clear;
        Active := False;
        SQL.Add('SELECT * FROM Usernames');
        SQL.Add('WHERE Username = :userEntry');
        ParamByName('userEntry').AsString := userEntry.Text;
        Active := True;
      end;

      if FDQuery1.RecordCount = 0 then
      begin
        showMessage('Username is invalid');
      end
      else
      begin
        if (passEntry.Text = FDQuery1.FieldByName('Password').asString) then
        begin
          temp := (FDQuery1.FieldByName('Username').AsString);
          UserToken.setUserId(temp);
          temp := '';
          frmMenu.Show;
          frmLogin.Hide;
        end
        else
        begin
          showMessage('Incorrect username and/or password combination.');
        end;
      end;



end;

procedure TfrmLogin.btnSignupClick(Sender: TObject);
begin
    frmSignup.Show;
    frmLogin.Hide;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
   UserToken := TUserToken.create;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
   userEntry.Text := '';
   passEntry.Text := '';
end;


end.
