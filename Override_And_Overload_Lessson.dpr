program Override_And_Overload_Lessson;

uses
  Vcl.Forms,
  Override_And_Overload_Lessson_Unit in 'Override_And_Overload_Lessson_Unit.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
