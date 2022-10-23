unit Code;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TfrmCode = class(TForm)
  private
    { Private declarations }
  public
    function hash(password:string):string;
  end;

var
  frmCode: TfrmCode;


implementation

{$R *.dfm}


uses Login, Signup;

function TfrmCode.hash(password:string):string;
var
  a: string;
  i, j: integer;

begin
  for i := 1 to Length(password) do
  begin
    for j := 1 to Length(password) do
    begin
      a := a + chr(Ord(password[i]) + Ord(password[j]));
    end;
  end;

  result := a;
end;


end.
