unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdTime, IdUDPBase, IdUDPClient,
  IdSNTP;

type
  TForm1 = class(TForm)
    btnCheckNTP: TButton;
    edtHost: TEdit;
    edtPort: TEdit;
    IdSNTP1: TIdSNTP;
    Memo1: TMemo;
    labHost: TLabel;
    labPort: TLabel;
    procedure btnCheckNTPClick(Sender: TObject);
    procedure IdSNTP1Connected(Sender: TObject);
    procedure IdSNTP1Disconnected(Sender: TObject);
    procedure IdSNTP1Status(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCheckNTPClick(Sender: TObject);
var
  str: string;
begin
  try
    if IdSNTP1.Active then
      IdSNTP1.Active := false;

    IdSNTP1.Host := edtHost.Text;
    IdSNTP1.Port := StrToInt(edtPort.Text);
    IdSNTP1.ReceiveTimeout := 5 * 1000; // 取不到  IdSNTP1.DateTime 時會卡住
    Memo1.Lines.Add('請等侯 5秒鐘');

    //Memo1.Lines.Add('BoundIP:' + IdSNTP1.BoundIP);

    IdSNTP1.Active := true;
    IdSNTP1.Connect;

  except
    on e: Exception do
      ShowMessage(e.ToString);

  end;

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IdSNTP1.Active := false;
end;

procedure TForm1.IdSNTP1Connected(Sender: TObject);
var
  str: string;
begin
  Memo1.Lines.Add('IdSNTP1Connected');

  str := '有取得正確的日期時間，才算成功' + #10;
  str := str + DateTimeToStr(IdSNTP1.DateTime);
  ShowMessage(str);
end;

procedure TForm1.IdSNTP1Disconnected(Sender: TObject);
begin
  Memo1.Lines.Add('IdSNTP1Disconnected');
end;

procedure TForm1.IdSNTP1Status(ASender: TObject; const AStatus: TIdStatus;
  const AStatusText: string);
begin
  Memo1.Lines.Add(AStatusText);
end;

end.
