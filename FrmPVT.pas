unit FrmPVT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFrm_PVT = class(TForm)
    Label1: TLabel;
    TA_shape: TShape;
    TA_showTimer: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure TA_showTimerTimer(Sender: TObject);
    procedure SaveLogtoFile(s:string);
  private
    { Private declarations }
    TA_showtime:string;
    btn_presstime:string;
    exp_starttime:string;
    exp_stoptime:string;
    TAtype:string;
  public
    { Public declarations }
  end;

var
  Frm_PVT: TFrm_PVT;

implementation

{$R *.dfm}

procedure TFrm_PVT.FormCreate(Sender: TObject);
begin
  Frm_PVT.Width:=screen.width;
  Frm_PVT.Height:=Screen.Height;
  Label1.Left:= Round(Frm_PVT.Width/2)-Round(Label1.Width/2);
  Label1.Top:= Round(Frm_PVT.Height/2)-Round(Label1.Height/2);
  TA_shape.Left:=Round(Frm_PVT.Width/2)-Round(TA_shape.Width/2);
  TA_shape.Top:=Round(Frm_PVT.Height/2)-Round(TA_shape.Height/2);
  TA_showTimer.Interval:=  1000+Random(5)*1000;
  TA_showTimer.Enabled:=true;
  LongTimeFormat := 'hh:nn:ss.zzz';
  DateTimeToString(exp_starttime, 'tt', now);
  SaveLogtoFile('Experiment Start: '+exp_starttime);
  SaveLogtoFile('------------------------------------');
end;

procedure TFrm_PVT.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (ord(Key)=27) then begin
    Frm_PVT.close;
    DateTimeToString(exp_stoptime, 'tt', now);
    SaveLogtoFile('------------------------------------');
    SaveLogtoFile('Experiment Stop: '+exp_stoptime);

  end;
  if (ord(Key)=32) then begin
     if TA_shape.Visible then begin
        TA_shape.Visible:=false;
        DateTimeToString(btn_presstime, 'tt', now);
        SaveLogtoFile(TAtype+';'+TA_showtime+';'+btn_presstime);
        TAtype:='';
        TA_showtime:='';
        btn_presstime:='';
     end else begin
        DateTimeToString(btn_presstime, 'tt', now);
        SaveLogtoFile(btn_presstime);
        btn_presstime:='';
     end;
  end;
end;

procedure TFrm_PVT.TA_showTimerTimer(Sender: TObject);
var
  i:integer;
begin
  if TAtype='Red' then begin
        TA_showTimer.Interval:= 2000+ Random(10)*1000;
        TA_showTimer.Enabled:=true;
        DateTimeToString(btn_presstime, 'tt', now);
        SaveLogtoFile(TAtype+';'+TA_showtime+';'+btn_presstime);
        TAtype:='';
        TA_showtime:='';
        btn_presstime:='';
        TA_shape.visible:=false;
  end else begin
    i:=Random(100) mod 2;
    if i=1 then begin
        TAtype:='white';
        TA_showTimer.Interval:= 2000+ Random(10)*1000;
        TA_showTimer.Enabled:=true;
        DateTimeToString(TA_showtime, 'tt', now);
        TA_shape.brush.color:=clWhite;
    end else begin
        TAtype:='Red';
        DateTimeToString(TA_showtime, 'tt', now);
        TA_showTimer.Interval:=500;
        TA_showTimer.Enabled:=true;
        TA_shape.brush.color:=clRed;
    end;
    TA_shape.visible:=true;
  end;

end;

procedure TFrm_PVT.SaveLogtoFile(s:string);
var
  myfile:textfile;
begin
  AssignFile(myFile,'log.txt');

  if not FileExists('log.txt') then
  begin
      ReWrite(myFile);      //若檔案不存在，新增一個新的檔
  end;

  //以Append 方式將新的資料加在檔案最後方
  Append(myFile);
  //寫入檔案

  WriteLn(myFile,s);
  CloseFile(myFile);
end;


end.
