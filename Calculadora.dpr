program Calculadora;

uses
  System.StartUpCopy,
  FMX.Forms,
  U_calculadora in 'U_calculadora.pas' {frm_calculadora},
  U_calculos in 'U_calculos.pas' {$R *.res};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrm_calculadora, frm_calculadora);
  Application.Run;
end.
