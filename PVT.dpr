program PVT;

uses
  Forms,
  FrmPVT in 'FrmPVT.pas' {Frm_PVT};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm_PVT, Frm_PVT);
  Application.Run;
end.
