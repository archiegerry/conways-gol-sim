program GameOfLife;

uses
  Forms,
  Menu in 'Menu.pas' {frmMenu},
  Help in 'Help.pas' {frmHelp},
  Start in 'Start.pas' {frmStart},
  Mode in 'Mode.pas' {frmMode},
  Login in 'Login.pas' {frmLogin},
  Signup in 'Signup.pas' {frmSignup},
  Custom in 'Custom.pas' {frmCustom},
  Account in 'Account.pas' {frmAccount},
  HelpInfo in 'HelpInfo.pas' {frmHelpInfo},
  Code in 'Code.pas' {frmCode};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TfrmHelp, frmHelp);
  Application.CreateForm(TfrmStart, frmStart);
  Application.CreateForm(TfrmMode, frmMode);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmSignup, frmSignup);
  Application.CreateForm(TfrmCustom, frmCustom);
  Application.CreateForm(TfrmAccount, frmAccount);
  Application.CreateForm(TfrmHelpInfo, frmHelpInfo);
  Application.CreateForm(TfrmCode, frmCode);
  Application.Run;
end.
