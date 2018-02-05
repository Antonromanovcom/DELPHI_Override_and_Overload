unit Override_And_Overload_Lessson_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
TPerson = class
fname: string; // ���
constructor Create(name:string);
function info: string; virtual;
function info2(name:string): string; overload; virtual;
end;

TStud = class(TPerson)
fgr:integer;
constructor Create(name:string;gr:integer);
function info: string; override;
end;

TProf = class(TPerson)
fdep:string;
constructor Create(name:string;dep:string);
function info: string;
override;
end;

TProfCloneTest = class(TPerson)
fdep:string;
constructor Create();
function info2(name:integer): string; overload;
end;


TForm3 = class(TForm)
    Button1: TButton;
    RadioButton1: TRadioButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  const
SZL = 10; // ������ ������

  var
  Form3: TForm3;
  List: array[1..SZL] of TPerson; // ������
  n:integer =0; // ���-�� ����� � ������
  iter:integer =0; // ��������
  var DB: TProfCloneTest;

implementation

{$R *.dfm}

{ TPerson }

constructor TPerson.Create(name: string);
begin

 fName := name;

end;

function TPerson.info: string;
begin


result := '';

end;

function TPerson.info2(name: string): string;
begin

result := '���';

end;

{ TStud }

constructor TStud.Create(name: string; gr: integer);
begin

inherited create(name); // ������� ����������� �������� ������

fGr := gr;

end;

function TStud.info: string;
begin


result := fname + ' �p.' + IntTostr(fgr);

end;

{ TProf }

constructor TProf.Create(name, dep: string);
begin

inherited create(name); // ������� ����������� �������� ������

fDep := dep;

end;

function TProf.info: string;
begin

result := fname + ' ���.' + fdep;

end;

constructor TProfCloneTest.Create();
begin


end;

function TProfCloneTest.info2(name: Integer): string;
begin

result := IntToStr(name);

end;

procedure TForm3.Button1Click(Sender: TObject);
begin

if n < SZL then begin

// �������� ������ � ������

n:=n+1;

if (RadioButton1.Checked) then // �������� ������ TStud

List[n]:=TStud.Create(Edit1.Text,StrToInt(Edit2.Text))

else // ������� ������ TProf

List[n]:=TProf.Create(Edit1.Text,Edit2.Text);

Edit1.Text := '' ; Edit2.Text := '';    // �������� ���� �����

Edit1.SetFocus; // ������ � ���� �������

end

else ShowMessage('������ ��������!');


end;

procedure TForm3.Button2Click(Sender: TObject);
var
i:integer; // ������
st:string;
begin

 DB := TProfCloneTest.Create; // create an instance
for i:=1 to SZL do
if list[i] <> NIL then st:=st + list[i].info + #13;
ShowMessage('C��co�'+#13+st);
ShowMessage(DB.info2(24));


end;


end.
