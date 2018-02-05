unit Override_And_Overload_Lessson_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
TPerson = class
fname: string; // имя
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
SZL = 10; // размер списка

  var
  Form3: TForm3;
  List: array[1..SZL] of TPerson; // список
  n:integer =0; // кол-во людей в списке
  iter:integer =0; // итерация
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

result := 'хуй';

end;

{ TStud }

constructor TStud.Create(name: string; gr: integer);
begin

inherited create(name); // вызвать конструктор базового класса

fGr := gr;

end;

function TStud.info: string;
begin


result := fname + ' гp.' + IntTostr(fgr);

end;

{ TProf }

constructor TProf.Create(name, dep: string);
begin

inherited create(name); // вызвать конструктор базового класса

fDep := dep;

end;

function TProf.info: string;
begin

result := fname + ' каф.' + fdep;

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

// добавить объект в список

n:=n+1;

if (RadioButton1.Checked) then // создадим объект TStud

List[n]:=TStud.Create(Edit1.Text,StrToInt(Edit2.Text))

else // создать объект TProf

List[n]:=TProf.Create(Edit1.Text,Edit2.Text);

Edit1.Text := '' ; Edit2.Text := '';    // очистить поля ввода

Edit1.SetFocus; // курсор в поле Фамилия

end

else ShowMessage('Список заполнен!');


end;

procedure TForm3.Button2Click(Sender: TObject);
var
i:integer; // индекс
st:string;
begin

 DB := TProfCloneTest.Create; // create an instance
for i:=1 to SZL do
if list[i] <> NIL then st:=st + list[i].info + #13;
ShowMessage('Cпиcoк'+#13+st);
ShowMessage(DB.info2(24));


end;


end.
