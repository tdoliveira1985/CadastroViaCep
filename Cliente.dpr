program Cliente;

uses
  Vcl.Forms,
  UCliente in 'UCliente.pas' {Form1},
  ViaCEP.Core in '..\viacep-master\src\ViaCEP.Core.pas',
  ViaCEP.Intf in '..\viacep-master\src\ViaCEP.Intf.pas',
  ViaCEP.Model in '..\viacep-master\src\ViaCEP.Model.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
