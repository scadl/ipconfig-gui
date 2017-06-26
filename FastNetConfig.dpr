program FastNetConfig;





{$R *.dres}

uses
  Forms,
  Unit1 in 'Unit1.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
