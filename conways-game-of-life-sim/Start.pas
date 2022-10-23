unit Start;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, StdCtrls, Buttons, ExtCtrls, Mode,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, VclTee.TeeGDIPlus, VCLTee.TeEngine, Vcl.Imaging.jpeg,
  VCLTee.TeeProcs, VCLTee.Chart, FireDAC.Phys.SQLiteWrapper.Stat;

type
  TfrmStart = class(TForm)
    trkZoom: TTrackBar;
    zoom: TStaticText;
    btnStep: TBitBtn;
    btnRun: TBitBtn;
    btnStop: TBitBtn;
    btnReset: TBitBtn;
    tmrMain: TTimer;
    grdMain: TStringGrid;
    txtGen: TStaticText;
    lblGen: TLabel;
    trkSpeed: TTrackBar;
    speed: TStaticText;
    StaticText1: TStaticText;
    lblSpeed: TLabel;
    btnSave: TButton;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    btnBack: TButton;
    chrtCell: TChart;
    procedure trkZoomChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRunClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure grdMainDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure grdMainClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnStepClick(Sender: TObject);
    procedure resetgrid(Sender: TObject);
    procedure tmrMainTimer(Sender: TObject);
    procedure generation(Sender: TObject);
    procedure trkSpeedChange(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure chart;
    procedure FormShow(Sender: TObject);

  private

  public
    status: array of array of boolean;
    BG: array of array of TColor;
  end;

var
  frmStart: TfrmStart;
  neighbours: array of array of integer;
  generations, alive, dead:integer;


implementation

uses Menu, Custom, Login, Account;

{$R *.dfm}

////////////////////////////////////////////////////////////////
procedure TfrmStart.FormActivate(Sender: TObject);
var
  Col, Row:integer;
begin
    btnRun.Enabled := true;
    btnStop.Enabled := false;
    btnRun.Visible := true;
    btnStop.Visible := false;

    SetLength(BG, grdMain.ColCount, grdMain.RowCount);
    SetLength(status, grdMain.ColCount, grdMain.RowCount);
    SetLength(neighbours, grdMain.ColCount, grdMain.RowCount);

    for Col := 0 to grdMain.ColCount-1 do
      begin
        for Row := 0 to grdMain.RowCount-1 do
          begin
            BG[Col, Row] := clWhite;
            status[Col, Row] := false;
            neighbours[Col, Row] := 0;
          end;
     end;
end;
////////////////////////////////////////////////////////////////

procedure TfrmStart.FormCreate(Sender: TObject);
var       Col, Row:integer;
begin
    btnRun.Enabled := true;
    btnStop.Enabled := false;
    btnRun.Visible := true;
    btnStop.Visible := false;

    SetLength(neighbours, grdMain.ColCount, grdMain.RowCount);
    SetLength(BG, grdMain.ColCount, grdMain.RowCount);
    SetLength(status, grdMain.ColCount, grdMain.RowCount);

    for Col := 0 to grdMain.ColCount-1 do
      begin
        for Row := 0 to grdMain.RowCount-1 do
          begin
            BG[Col, Row] := clWhite;
            status[Col, Row] := false;
            neighbours[Col, Row] := 0;
          end;
     end;
end;
////////////////////////////////////////////////////////////////
procedure TfrmStart.FormShow(Sender: TObject);
begin
   chart;
end;
////////////////////////////////////////////////////////////////
procedure TfrmStart.grdMainClick(Sender: TObject);
var       Col, Row: integer;
begin
  Col := grdMain.Col;
  Row := grdMain.Row;
  if (status[Col, Row] = false) then
    begin
      BG[Col, Row] := clBlack;
      status[Col, Row] := true;
      grdMain.Repaint;
    end
  else
    begin
      BG[Col, Row] := clWhite;
      status[Col, Row] := false;
      grdMain.Repaint;
    end;
end;
////////////////////////////////////////////////////////////////
procedure TfrmStart.btnBackClick(Sender: TObject);
begin
   frmMenu.Show;
   frmStart.Hide;
end;

procedure TfrmStart.btnResetClick(Sender: TObject);
var       Col, Row:integer;
begin
  if tmrMain.Enabled = true then
    begin
      btnRun.Enabled := true;
      btnStop.Enabled := false;
      btnStop.Visible := false;
      btnRun.Visible := true;
      tmrMain.Enabled := false;
    end;
   for Col := 0 to grdMain.ColCount-1 do
      begin
        for Row := 0 to grdMain.RowCount-1 do
          begin
            BG[Col, Row] := clWhite;
            status[Col, Row] := false;
          end;
      end;
   grdMain.Repaint;
   generations := 0;
   lblGen.Caption := inttostr(generations);

end;
////////////////////////////////////////////////////////////////
procedure TfrmStart.grdMainDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
    grdMain.Canvas.Brush.Color := BG[ACol, ARow];
    grdMain.Canvas.FillRect(Rect);
end;

////////////////////////////////////////////////////////////////
procedure TfrmStart.tmrMainTimer(Sender: TObject);
begin
   generation(Sender);
end;
///////////////////////////////////////////////////////////////
procedure TfrmStart.trkSpeedChange(Sender: TObject);
begin
   tmrMain.Interval := trkSpeed.Position;
   lblSpeed.Caption := inttostr(trkSpeed.Position);
end;
///////////////////////////////////////////////////////////////
procedure TfrmStart.trkZoomChange(Sender: TObject);
begin
    grdMain.DefaultColWidth := trkZoom.Position;
    grdMain.DefaultRowHeight := trkZoom.Position;
end;
////////////////////////////////////////////////////////////////
procedure TfrmStart.btnRunClick(Sender: TObject);
begin
    btnRun.Enabled := false;
    btnStop.Enabled := true;
    btnStop.Visible := true;
    btnRun.Visible := false;
    tmrMain.Enabled := true;
end;
////////////////////////////////////////////////////////////////
procedure TfrmStart.btnStopClick(Sender: TObject);
begin
    btnRun.Enabled := true;
    btnStop.Enabled := false;
    btnRun.Visible := true;
    btnStop.Visible := false;
    tmrMain.Enabled := false;
end;
////////////////////////////////////////////////////////////////
procedure TfrmStart.resetgrid;
Var       Col, Row:integer;
begin
  for Col := 0 to grdMain.ColCount-1 do
    begin
      for Row := 0 to grdMain.RowCount-1 do
        begin
          neighbours[Col,Row] := 0;
        end;
    end;
end;
////////////////////////////////////////////////////////////////
procedure TfrmStart.generation(Sender: TObject);
var       Col, Row:integer;
          Top, Bottom, Left, Right:boolean;
begin
   generations := generations +1;
   for Col := 0 to grdMain.ColCount-1 do
      begin
        for Row := 0 to grdMain.RowCount-1 do
          begin
            if (Col=0) then
              left := true;
            if (Row=0) then
              top := true;
            if (Col=grdMain.ColCount-1) then
              right := true;
            if (Row=grdMain.RowCount-1) then
              bottom := true;
            if (Top = true) or (Left = true) or (Bottom = true) or (Right = true)then
              begin
                top:=false;
                left:=false;
                bottom:=false;
                right:=false
              end
            else
              begin
                if (status[Col-1, Row] = true) then
                  neighbours[Col, Row] := neighbours[Col, Row] + 1;
                if (status[Col+1, Row] = true) then
                  neighbours[Col, Row] := neighbours[Col, Row] + 1;
                if (status[Col, Row-1] = true) then
                  neighbours[Col, Row] := neighbours[Col, Row] + 1;
                if (status[Col, Row+1] = true) then
                  neighbours[Col, Row] := neighbours[Col, Row] + 1;
                if (status[Col-1, Row-1] = true) then
                   neighbours[Col, Row] := neighbours[Col, Row] + 1;
                if (status[Col-1, Row+1] = true) then
                   neighbours[Col, Row] := neighbours[Col, Row] + 1;
                if (status[Col+1, Row-1] = true) then
                   neighbours[Col, Row] := neighbours[Col, Row] + 1;
                if (status[Col+1, Row+1] = true) then
                   neighbours[Col, Row] := neighbours[Col, Row] + 1;
             end;
          end;
      end;
      for Col := 0 to grdMain.ColCount-1 do
        begin
          for Row := 0 to grdMain.RowCount-1 do
            begin
              case neighbours[Col, Row] of
               0: begin
                    case frmCustom.setting[0] of
                       0:status[Col, Row] := false;
                       1:status[Col, Row] := true;
                       2:begin
                           if (status[Col, Row] = true) then
                            status[Col, Row] := true
                           else
                            status[Col,Row] := false
                         end;
                    end;
                  end;
               1: begin
                    case frmCustom.setting[1] of
                       0:status[Col, Row] := false;
                       1:status[Col, Row] := true;
                       2:begin
                           if (status[Col, Row] = true) then
                            status[Col, Row] := true
                           else
                            status[Col,Row] := false
                         end;
                    end;
                  end;
               2: begin
                    case frmCustom.setting[2] of
                       0:status[Col, Row] := false;
                       1:status[Col, Row] := true;
                       2:begin
                           if (status[Col, Row] = true) then
                            status[Col, Row] := true
                           else
                            status[Col,Row] := false
                         end;
                    end;
                  end;
               3: begin
                    case frmCustom.setting[3] of
                       0:status[Col, Row] := false;
                       1:status[Col, Row] := true;
                       2:begin
                           if (status[Col, Row] = true) then
                            status[Col, Row] := true
                           else
                            status[Col,Row] := false
                         end;
                    end;
                  end;
               4: begin
                    case frmCustom.setting[4] of
                       0:status[Col, Row] := false;
                       1:status[Col, Row] := true;
                       2:begin
                           if (status[Col, Row] = true) then
                            status[Col, Row] := true
                           else
                            status[Col,Row] := false
                         end;
                    end;
                  end;
               5: begin
                    case frmCustom.setting[5] of
                       0:status[Col, Row] := false;
                       1:status[Col, Row] := true;
                       2:begin
                           if (status[Col, Row] = true) then
                            status[Col, Row] := true
                           else
                            status[Col,Row] := false
                         end;
                    end;
                  end;
               6: begin
                    case frmCustom.setting[6] of
                       0:status[Col, Row] := false;
                       1:status[Col, Row] := true;
                       2:begin
                           if (status[Col, Row] = true) then
                            status[Col, Row] := true
                           else
                            status[Col,Row] := false
                         end;
                    end;
                  end;
               7: begin
                    case frmCustom.setting[7] of
                       0:status[Col, Row] := false;
                       1:status[Col, Row] := true;
                       2:begin
                           if (status[Col, Row] = true) then
                            status[Col, Row] := true
                           else
                            status[Col,Row] := false
                         end;
                    end;
                  end;
               8: begin
                    case frmCustom.setting[8] of
                       0:status[Col, Row] := false;
                       1:status[Col, Row] := true;
                       2:begin
                           if (status[Col, Row] = true) then
                            status[Col, Row] := true
                           else
                            status[Col,Row] := false
                         end;
                    end;
                  end;
              end;
             if status[Col, Row] = false then
                BG[Col, Row] := ClWhite
             else
              begin
                BG[Col, Row] := ClBlack;
              end;
            end;
        end;
    resetgrid(Sender);
    grdMain.Repaint;
    lblGen.Caption := inttostr(generations);
end;
////////////////////////////////////////////////////////////////
procedure TfrmStart.btnSaveClick(Sender: TObject);
var savename, username: string;
    save : ansistring;
    Col, Row: integer;
begin
  if tmrMain.Enabled = true then
    begin
      btnRun.Enabled := true;
      btnStop.Enabled := false;
      btnStop.Visible := false;
      btnRun.Visible := true;
      tmrMain.Enabled := false;
    end;
  repeat
     savename := inputbox('Name of save', 'Please enter a valid name for this save.', '');
  until savename <> '';
  username := UserToken.getUserID;
  save := '';
  for Row := 0 to grdMain.RowCount - 1 do
    begin
      save := save + '/';
      for Col := 0 to grdMain.ColCount - 1 do
        begin
           case status[Col, Row] of
              true:  begin
                        save := save + '1'
                     end;

              false: begin
                        save := save + '0'
                     end;
           end;
        end;
    end;
  with FDQuery1 do
    begin
       Active := false;
       SQL.Clear;
       SQL.Add('INSERT INTO Saves');
       SQL.Add('(username, SAVEDATA, name)');
       SQL.Add('VALUES(:username, :save, :name)');
       Parambyname('username').AsString := username;
       Parambyname('save').AsAnsiString := save;
       Parambyname('name').AsString := savename;
       ExecSQL;
    end;
end;
////////////////////////////////////////////////////////////////
procedure TfrmStart.btnStepClick(Sender: TObject);
var       Col, Row:integer;
          Top, Bottom, Left, Right:boolean;
begin
  generation(sender);
end;
////////////////////////////////////////////////////////////////
procedure TfrmStart.chart;
begin

end;
////////////////////////////////////////////////////////////////
end.
