unit Signup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, Vcl.StdCtrls, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Phys.SQLiteWrapper.Stat;

type
  TfrmSignup = class(TForm)
    username: TEdit;
    signup: TLabel;
    email: TEdit;
    repeatemail: TEdit;
    password: TEdit;
    repeatpassword: TEdit;
    staticUser: TLabel;
    staticEmail: TLabel;
    staticEmailRep: TLabel;
    staticPass: TLabel;
    staticPassRep: TLabel;
    btnFinish: TButton;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    showpass: TCheckBox;
    btnBack: TButton;
    procedure btnFinishClick(Sender: TObject);
    procedure showpassClick(Sender: TObject);
    function checkdata:boolean;
    procedure btnBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSignup: TfrmSignup;

implementation

{$R *.dfm}

uses Login, Menu;

function TfrmSignup.checkdata:boolean;
  begin
    if Trim(email.Text) = '' then
      begin
         showMessage('You need to enter an email.');
         result := false;
      end
    else if Trim(username.Text) = '' then
            begin
               showMessage('You need to enter an username.');
               result := false;
            end
              else if (email.Text <> repeatemail.Text) then
                      begin
                        showMessage('Both emails need to be the same.');
                        result := false;
                      end
                        else if (password.Text <> repeatpassword.text) then
                                begin
                                  showMessage('Both passwords need to be the same.');
                                end
    else
      begin
        with FDQuery1 do
        begin
        SQL.Clear;
        Active := false;
        SQL.Add('SELECT * FROM Usernames');
        SQL.Add('WHERE Username = :username');
        ParamByName('username').AsString := username.Text;
        Active := true;
        end;
        if (FDQuery1.RecordCount > 0) then
          begin
            showMessage('Username is already taken');
            result := false;
          end
        else
          begin
            result := true;
          end;
      end;
  end;

procedure TfrmSignup.btnBackClick(Sender: TObject);
begin
   username.Text := '';
   email.Text := '';
   password.Text := '';
   repeatemail.Text := '';
   repeatpassword.Text := '';
   frmMenu.Show;
   frmSignup.Hide;
end;

procedure TfrmSignup.btnFinishClick(Sender: TObject);
begin
   if checkdata then
      begin
        with FDQuery1 do
        begin
          Active := false;
          SQL.Clear;
          SQL.Add('INSERT INTO Usernames');
          SQL.Add('(Username, Email, Password)');
          SQL.Add('VALUES(:username, :email, :password)');
          ParamByName('username').AsString := username.Text;
          ParamByName('email').AsString := email.Text;
          ParamByName('password').AsString := password.Text;
          ExecSQL;
        end;

        showMessage('Signed up');
        frmMenu.Show;
        frmSignup.Hide;
      end
   else
      begin

      end;
end;

procedure TfrmSignup.showpassClick(Sender: TObject);
begin
  if (showpass.Checked) then
      begin
        password.PasswordChar := #0;
        repeatpassword.PasswordChar := #0
      end
  else
      begin
        password.PasswordChar := '*';
        repeatpassword.PasswordChar := '*';
      end;


end;

end.
