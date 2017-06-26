unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, shellapi, Spin, XPMan;

type
  TMainForm = class(TForm)
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Bevel1: TBevel;
    CheckBox6: TCheckBox;
    Timer1: TTimer;
    Label2: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    SpinEdit5: TSpinEdit;
    SpinEdit6: TSpinEdit;
    SpinEdit7: TSpinEdit;
    SpinEdit8: TSpinEdit;
    Label3: TLabel;
    SpinEdit9: TSpinEdit;
    SpinEdit10: TSpinEdit;
    SpinEdit11: TSpinEdit;
    SpinEdit12: TSpinEdit;
    Label4: TLabel;
    SpinEdit13: TSpinEdit;
    SpinEdit14: TSpinEdit;
    SpinEdit15: TSpinEdit;
    SpinEdit16: TSpinEdit;
    Label5: TLabel;
    SpinEdit17: TSpinEdit;
    SpinEdit18: TSpinEdit;
    SpinEdit19: TSpinEdit;
    SpinEdit20: TSpinEdit;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  cmd1,cmd2:string;
  data:TStrings;

implementation

{$R *.dfm}
//{$R FastNetConfig.exe.manifst}

procedure TMainForm.BitBtn1Click(Sender: TObject);
begin
if CheckBox1.Checked then cmd1:='/c netsh interface ip set address "'+Edit1.Text+'" static '+
SpinEdit1.Text+'.'+SpinEdit2.Text+'.'+SpinEdit3.Text+'.'+SpinEdit4.Text+' '+
SpinEdit5.Text+'.'+SpinEdit6.Text+'.'+SpinEdit7.Text+'.'+SpinEdit8.Text;
if CheckBox2.Checked then cmd1:='/c netsh interface ip set address "'+Edit1.Text+'" static '+
SpinEdit1.Text+'.'+SpinEdit2.Text+'.'+SpinEdit3.Text+'.'+SpinEdit4.Text+' '+
SpinEdit5.Text+'.'+SpinEdit6.Text+'.'+SpinEdit7.Text+'.'+SpinEdit8.Text+' '+
SpinEdit9.Text+'.'+SpinEdit10.Text+'.'+SpinEdit11.Text+'.'+SpinEdit12.Text;
if CheckBox3.Checked then cmd2:='/c netsh dnsclient set dnsservers "'+Edit1.Text+'" static '+
SpinEdit13.Text+'.'+SpinEdit14.Text+'.'+SpinEdit15.Text+'.'+SpinEdit16.Text;
if CheckBox4.Checked then cmd1:='/c netsh dnsclient set dnsservers "'+Edit1.Text+'" static '+
SpinEdit13.Text+'.'+SpinEdit14.Text+'.'+SpinEdit15.Text+'.'+SpinEdit16.Text+' '+
SpinEdit17.Text+'.'+SpinEdit18.Text+'.'+SpinEdit19.Text+'.'+SpinEdit20.Text;

if CheckBox5.Checked then cmd1:='/c netsh interface ip set address "'+Edit1.Text+'" dhcp';
if CheckBox6.Checked then cmd2:='/c netsh dnsclient set dnsservers "'+Edit1.Text+'" dhcp';

ShellExecute(Application.Handle,pchar('open'), pchar('cmd.exe'), pchar(cmd1),'',SW_SHOWNORMAL);
ShellExecute(Application.Handle,pchar('open'), pchar('cmd.exe'), pchar(cmd2),'',SW_SHOWNORMAL);
end;

{*
procedure TForm1.Button2Click(Sender: TObject);
var dataf:tstrings; f:textfile;
begin
if not FileExists('data.dat') then begin AssignFile(f, 'data.dat'); Rewrite(f); CloseFile(f); ShowMessage('Created!') end;


Application.MessageBox('Чтение не возможно!!'+#13+
'Отсутсвует файл данных программы!'+#13+
'Проверьте наличие файла "data" в папке прораммы','Внимание!!!',MB_ICONEXCLAMATION);


//dataf.LoadFromFile('data.dat');
//SpinEdit1.Text:=dataf[1];
end;
*}

procedure TMainForm.FormCreate(Sender: TObject);
var f:textfile;
begin
data:=TStringList.Create;
if not FileExists('data.dat') then begin AssignFile(f, 'data.dat'); Rewrite(f); CloseFile(f);
data.Text:='192'+#13+'168'+#13+'0'+#13+'1'+#13+'255'+#13+'255'+#13+'255'+#13+'0'+#13+
'192'+#13+'168'+#13+'0'+#13+'1'+#13+'192'+#13+'168'+#13+'0'+#13+'1'+#13+
'192'+#13+'168'+#13+'0'+#13+'1'+#13+'Подключение по локальной сети'; data.SaveToFile('data.dat'); end;
data.Clear;
data.LoadFromFile('data.dat');
SpinEdit1.Text:=data[0];
SpinEdit2.Text:=data[1];
SpinEdit3.Text:=data[2];
SpinEdit4.Text:=data[3];
SpinEdit5.Text:=data[4];
SpinEdit6.Text:=data[5];
SpinEdit7.Text:=data[6];
SpinEdit8.Text:=data[7];
SpinEdit9.Text:=data[8];
SpinEdit10.Text:=data[9];
SpinEdit11.Text:=data[10];
SpinEdit12.Text:=data[11];
SpinEdit13.Text:=data[12];
SpinEdit14.Text:=data[13];
SpinEdit15.Text:=data[14];
SpinEdit16.Text:=data[15];
SpinEdit17.Text:=data[16];
SpinEdit18.Text:=data[17];
SpinEdit19.Text:=data[18];
SpinEdit20.Text:=data[19];
Edit1.Text:=data[20];

SpeedButton1.Hint:='Записать адреса в файл.'+#13+'При следующем запуске они будут загружены автоматически.';
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
var f:textfile;
begin
if not FileExists('data.dat') then begin AssignFile(f, 'data.dat'); Rewrite(f); CloseFile(f); end;

data.Clear;
data.add(SpinEdit1.Text);
data.add(SpinEdit2.Text);
data.add(SpinEdit3.Text);
data.add(SpinEdit4.Text);
data.add(SpinEdit5.Text);
data.add(SpinEdit6.Text);
data.add(SpinEdit7.Text);
data.add(SpinEdit8.Text);
data.add(SpinEdit9.Text);
data.add(SpinEdit10.Text);
data.add(SpinEdit11.Text);
data.add(SpinEdit12.Text);
data.add(SpinEdit13.Text);
data.add(SpinEdit14.Text);
data.add(SpinEdit15.Text);
data.add(SpinEdit16.Text);
data.add(SpinEdit17.Text);
data.add(SpinEdit18.Text);
data.add(SpinEdit19.Text);
data.add(SpinEdit20.Text);
data.Add(Edit1.Text);

data.SaveToFile('data.dat');
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
if CheckBox5.Checked then
begin
CheckBox1.Checked:=false;
CheckBox2.Checked:=false;
CheckBox1.Enabled:=false;
CheckBox2.Enabled:=false;
SpinEdit1.Enabled:=False;
SpinEdit2.Enabled:=False;
SpinEdit3.Enabled:=False;
SpinEdit4.Enabled:=False;
SpinEdit5.Enabled:=False;
SpinEdit6.Enabled:=False;
SpinEdit7.Enabled:=False;
SpinEdit8.Enabled:=False;
SpinEdit9.Enabled:=False;
SpinEdit10.Enabled:=False;
SpinEdit11.Enabled:=False;
SpinEdit12.Enabled:=False;
end else begin
CheckBox1.Enabled:=True;
CheckBox2.Enabled:=True;
SpinEdit1.Enabled:=True;
SpinEdit2.Enabled:=True;
SpinEdit3.Enabled:=True;
SpinEdit4.Enabled:=True;
SpinEdit5.Enabled:=True;
SpinEdit6.Enabled:=True;
SpinEdit7.Enabled:=True;
SpinEdit8.Enabled:=True;
SpinEdit9.Enabled:=True;
SpinEdit10.Enabled:=True;
SpinEdit11.Enabled:=True;
SpinEdit12.Enabled:=True;
end;

if CheckBox6.Checked then
begin
CheckBox3.Checked:=false;
CheckBox4.Checked:=false;
CheckBox3.Enabled:=false;
CheckBox4.Enabled:=false;
SpinEdit13.Enabled:=False;
SpinEdit14.Enabled:=False;
SpinEdit15.Enabled:=False;
SpinEdit16.Enabled:=False;
SpinEdit17.Enabled:=False;
SpinEdit18.Enabled:=False;
SpinEdit19.Enabled:=False;
SpinEdit20.Enabled:=False;
end else begin
CheckBox3.Enabled:=True;
CheckBox4.Enabled:=True;
SpinEdit13.Enabled:=True;
SpinEdit14.Enabled:=True;
SpinEdit15.Enabled:=True;
SpinEdit16.Enabled:=True;
SpinEdit17.Enabled:=True;
SpinEdit18.Enabled:=True;
SpinEdit19.Enabled:=True;
SpinEdit20.Enabled:=True;
end;

if (CheckBox1.Checked) or (CheckBox2.Checked) then CheckBox5.Enabled:=false else CheckBox5.Enabled:=true;
if (CheckBox3.Checked) or (CheckBox4.Checked) then CheckBox6.Enabled:=false else CheckBox6.Enabled:=true;

if CheckBox2.Checked then CheckBox1.Checked:=True;
if CheckBox4.Checked then CheckBox3.Checked:=True;
end;



end.
