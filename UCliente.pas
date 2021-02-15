unit UCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, xmldom, XMLIntf, msxmldom, XMLDoc,
  Data.DB, Datasnap.DBClient,IdComponent,IdTCPConnection,IdTCPClient,IdHTTP,IdBaseComponent,IdMessage,
  IdExplicitTLSClientServerBase,IdMessageClient,IdSMTPBase,IdSMTP,IdIOHandler,IdIOHandlerSocket,IdIOHandlerStack,
  IdSSL,IdSSLOpenSSL,IdAttachmentFile,IdText;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    edNome: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edIdentidade: TEdit;
    Label3: TLabel;
    edCPF: TEdit;
    Label4: TLabel;
    edTelefone: TEdit;
    Label5: TLabel;
    edEmail: TEdit;
    Label6: TLabel;
    edCEP: TEdit;
    edLogradouro: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    edNumero: TEdit;
    edComplemento: TEdit;
    Label9: TLabel;
    edBairro: TEdit;
    Label10: TLabel;
    edCidade: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    edUF: TEdit;
    Label13: TLabel;
    edPais: TEdit;
    btnPesqCEP: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ClientDados: TClientDataSet;
    ClientDadosNOME: TStringField;
    ClientDadosIDENTIDADE: TStringField;
    ClientDadosCPF: TStringField;
    ClientDadosTELEFONE: TStringField;
    ClientDadosEMAIL: TStringField;
    ClientDadosCEP: TStringField;
    ClientDadosLOGRADOURO: TStringField;
    ClientDadosNUMERO: TStringField;
    ClientDadosCOMPLEMENTO: TStringField;
    ClientDadosBAIRRO: TStringField;
    ClientDadosCIDADE: TStringField;
    ClientDadosESTADO: TStringField;
    ClientDadosPAIS: TStringField;
    procedure btnPesqCEPClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure edCEPExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function EnviarEmail(const Assunto, Destino, Anexo, Corpo: String): Boolean;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses ViaCEP.Intf, ViaCEP.Core, ViaCEP.Model;

{$R *.dfm}

function TForm1.EnviarEmail(const Assunto, Destino, Anexo, Corpo: String ): Boolean;
var
  From                : String;
  BccList             : String;
  Host                : String;
  Port                : Integer;
  UserName            : String;
  Password            : String;

  idMsg                : TIdMessage;
  IdText               : TIdText;
  idSMTP               : TIdSMTP;
  IdSSLIOHandlerSocket : TIdSSLIOHandlerSocketOpenSSL;
begin
  try
    try
      From                            := 'emailorigem@gmail.com';
      Host                            := 'smtp.gmail.com';
      Port                            := 465;//587
      UserName                        := 'emailorigem@gmail.com';
      Password                        := 'senha';

      IdSSLIOHandlerSocket                   := TIdSSLIOHandlerSocketOpenSSL.Create(Self);
      IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
      IdSSLIOHandlerSocket.SSLOptions.Mode  := sslmClient;

      idMsg                            := TIdMessage.Create(Self);
      idMsg.CharSet                    := 'utf-8';
      idMsg.Encoding                   := meMIME;
      idMsg.From.Name                  := 'emailorigem@gmail.com';
      idMsg.From.Address               := From;
      idMsg.Priority                   := mpNormal;
      idMsg.Subject                    := Assunto;

      idMsg.Recipients.Add;
      idMsg.Recipients.EMailAddresses := Destino;
      idMsg.CCList.EMailAddresses     := 'thiagopirce@gmail.com';
//      idMsg.BccList.EMailAddresses    := BccList;

      idText := TIdText.Create(idMsg.MessageParts);
      idText.Body.Add(Corpo);
      idText.ContentType := 'text/html; text/plain; charset=iso-8859-1';

      IdSMTP                           := TIdSMTP.Create(Self);
      IdSMTP.IOHandler                 := IdSSLIOHandlerSocket;
      IdSMTP.UseTLS                    := utUseImplicitTLS;
      IdSMTP.AuthType                  := satDefault;
      IdSMTP.Host                      := Host;
      IdSMTP.AuthType                  := satDefault;
      IdSMTP.Port                      := Port;
      IdSMTP.Username                  := UserName;
      IdSMTP.Password                  := Password;

      IdSMTP.Connect;
      IdSMTP.Authenticate;

      if Anexo <> '' then
        if FileExists(Anexo) then
          TIdAttachmentFile.Create(idMsg.MessageParts, Anexo);

      if IdSMTP.Connected then
      begin
        try
          IdSMTP.Send(idMsg);
        except on E:Exception do
          begin
            ShowMessage('Erro ao tentar enviar o email: ' + E.Message);
          end;
        end;
      end;

      if IdSMTP.Connected then
        IdSMTP.Disconnect;

      Result := True;
    finally
      UnLoadOpenSSLLibrary;
      FreeAndNil(idMsg);
      FreeAndNil(IdSSLIOHandlerSocket);
      FreeAndNil(idSMTP);
    end;
  except on e:Exception do
    begin
      Result := False;
    end;
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  i: Integer;
begin
  //Grava dados do cliente
  ClientDados.Append;
  ClientDadosNOME.AsString       := edNome.Text;
  ClientDadosIDENTIDADE.AsString := edIdentidade.Text;
  ClientDadosCPF.AsString        := edCPF.Text;
  ClientDadosTELEFONE.AsString   := edTelefone.Text;
  ClientDadosEMAIL.AsString      := edEmail.Text;

  ClientDadosCEP.AsString        := edCEP.Text;
  ClientDadosLOGRADOURO.AsString := edLogradouro.Text;
  ClientDadosNUMERO.AsString     := edNumero.Text;
  ClientDadosCOMPLEMENTO.AsString:= edComplemento.Text;
  ClientDadosBAIRRO.AsString     := edBairro.Text;
  ClientDadosCIDADE.AsString     := edCidade.Text;
  ClientDadosESTADO.AsString     := edUF.Text;
  ClientDadosPAIS.AsString       := edPais.Text;
  ClientDados.Post;

  //Salva XML
  ClientDados.SaveToFile('Cadastro.xml',dfXML);

  //Envia E-mail - USEI GMAIL
  if EnviarEmail('Cadastro de Cliente','emaildestino@gmail.com',ExtractFilePath(Application.ExeName)+'Cadastro.xml','Cadastro de Cliente') then
    ShowMessage('Cadastro Finalizado com sucesso!');

   for i := 0 to Form1.ComponentCount -1 do
     if Form1.Components[i] is TEdit then
       TEdit(Form1.Components[i]).Clear;
end;


procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.btnPesqCEPClick(Sender: TObject);
var
  ViaCEP: IViaCEP;
  CEP: TViaCEPClass;
begin
  if Trim(edCEP.Text) = '' then Exit;
  
  ViaCEP := TViaCEP.Create;
  CEP := ViaCEP.Get(edCEP.Text);
  if not Assigned(CEP) then
    Exit;
  try
    edCEP.Text := CEP.CEP;
    edLogradouro.Text := CEP.Logradouro;
    edComplemento.Text := CEP.Complemento;
    edBairro.Text := CEP.Bairro;
    edUF.Text := CEP.UF;
    edcidade.Text := CEP.Localidade;

    if edLogradouro.Text <> '' then
      edNumero.SetFocus
    else
      edLogradouro.SetFocus;
  finally
    CEP.Free;
  end;
end;

procedure TForm1.edCEPExit(Sender: TObject);
begin
  if Trim(edCEP.Text) <> '' then
  begin
    btnPesqCEP.Click;
  end;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    perform(WM_NEXTDLGCTL,0,0);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  ClientDados.Close;
  ClientDados.CreateDataSet;
  ClientDados.Open;
end;

end.
