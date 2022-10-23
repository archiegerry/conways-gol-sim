unit Account;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat;

type
  TfrmAccount = class(TForm)
    user: TStaticText;
    btnLogout: TButton;
    btnBack: TButton;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    boxLoad: TComboBox;
    lblLoad: TLabel;

    procedure FormShow(Sender: TObject);
    procedure btnLogoutClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure boxLoadChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAccount: TfrmAccount;

implementation

{$R *.dfm}

uses Menu, Login, Start;
////////////////////////////////////////////////////////////////
procedure TfrmAccount.btnBackClick(Sender: TObject);
begin
   frmMenu.Show;
   frmAccount.Hide;
end;
////////////////////////////////////////////////////////////////
procedure TfrmAccount.btnLogoutClick(Sender: TObject);
begin
   UserToken.create;
   frmMenu.Show;
   frmAccount.Hide;
end;
////////////////////////////////////////////////////////////////
procedure getSave(savedata:ansistring);
var
  Col, Row, i: integer;
  finished:boolean;

begin
  frmAccount.Hide;
  frmStart.show;
  i := 1;
  row := -1;
    repeat
         case savedata[i] of
          '/': begin
               row := row + 1;
               col := 0;
               end;

          '0': begin
               frmStart.status[col, row] := false;
               frmStart.BG[col,row] := clWhite;
               col := col + 1;
               end;

          '1': begin
               frmStart.status[col,row] := true;
               frmStart.BG[col, row] := clBlack;
               col := col + 1;
               end;

          else begin
               finished := true;
               end;
         end;
        i := i + 1;
    until finished;
  frmStart.grdMain.Repaint;
  frmAccount.Hide;
  frmStart.show;
end;
////////////////////////////////////////////////////////////////
procedure TfrmAccount.boxLoadChange(Sender: TObject);
begin
  with FDQuery1 do
    begin
      SQL.Clear;
      Active := false;
      SQL.Add('SELECT SAVEDATA FROM Saves WHERE name = :savename');
      ParamByName('savename').AsString := boxLoad.Text;
      Active := true;
    end;
    getSave(FDQuery1.FieldByName('SAVEDATA').AsAnsiString);
end;
////////////////////////////////////////////////////////////////
procedure TfrmAccount.FormCreate(Sender: TObject);
begin

end;
////////////////////////////////////////////////////////////////
procedure TfrmAccount.FormShow(Sender: TObject);
begin
    user.Caption := UserToken.getUserID;
    boxLoad.Items.Clear;
    with FDQuery1 do
    begin
      SQL.Clear;
      Active := false;
      SQL.Add('SELECT name FROM Saves WHERE username = :username');
      ParamByName('username').AsString := UserToken.getUserID;
      Active := true;
    end;

    while (not FDQuery1.Eof) do
    begin
      boxLoad.AddItem(FDQuery1.FieldByName('name').AsString, nil);
      FDQuery1.Next;
    end;

end;

end.
