object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Cliente'
  ClientHeight = 389
  ClientWidth = 790
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 769
    Height = 153
    Caption = 'Dados do Cliente'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 19
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 473
      Top = 19
      Width = 52
      Height = 13
      Caption = 'Identidade'
    end
    object Label3: TLabel
      Left = 608
      Top = 19
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object Label4: TLabel
      Left = 16
      Top = 65
      Width = 42
      Height = 13
      Caption = 'Telefone'
    end
    object Label5: TLabel
      Left = 152
      Top = 65
      Width = 24
      Height = 13
      Caption = 'Email'
    end
    object edNome: TEdit
      Left = 16
      Top = 36
      Width = 449
      Height = 21
      TabOrder = 0
    end
    object edIdentidade: TEdit
      Left = 473
      Top = 36
      Width = 129
      Height = 21
      TabOrder = 1
    end
    object edCPF: TEdit
      Left = 608
      Top = 36
      Width = 129
      Height = 21
      TabOrder = 2
    end
    object edTelefone: TEdit
      Left = 16
      Top = 84
      Width = 129
      Height = 21
      TabOrder = 3
    end
    object edEmail: TEdit
      Left = 152
      Top = 84
      Width = 449
      Height = 21
      TabOrder = 4
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 167
    Width = 769
    Height = 162
    Caption = 'Endere'#231'o do Cliente'
    TabOrder = 1
    object Label6: TLabel
      Left = 16
      Top = 25
      Width = 19
      Height = 13
      Caption = 'Cep'
    end
    object Label7: TLabel
      Left = 159
      Top = 25
      Width = 55
      Height = 13
      Caption = 'Logradouro'
    end
    object Label8: TLabel
      Left = 463
      Top = 25
      Width = 37
      Height = 13
      Caption = 'Numero'
    end
    object Label9: TLabel
      Left = 542
      Top = 25
      Width = 65
      Height = 13
      Caption = 'Complemento'
    end
    object Label10: TLabel
      Left = 16
      Top = 71
      Width = 28
      Height = 13
      Caption = 'Bairro'
    end
    object Label11: TLabel
      Left = 200
      Top = 71
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label12: TLabel
      Left = 455
      Top = 71
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object Label13: TLabel
      Left = 499
      Top = 71
      Width = 19
      Height = 13
      Caption = 'Pais'
    end
    object edCEP: TEdit
      Left = 16
      Top = 44
      Width = 113
      Height = 21
      TabOrder = 0
      OnExit = edCEPExit
    end
    object edLogradouro: TEdit
      Left = 159
      Top = 44
      Width = 298
      Height = 21
      TabOrder = 2
    end
    object edNumero: TEdit
      Left = 463
      Top = 44
      Width = 70
      Height = 21
      TabOrder = 3
    end
    object edComplemento: TEdit
      Left = 542
      Top = 44
      Width = 129
      Height = 21
      TabOrder = 4
    end
    object edBairro: TEdit
      Left = 16
      Top = 90
      Width = 177
      Height = 21
      TabOrder = 5
    end
    object edCidade: TEdit
      Left = 200
      Top = 90
      Width = 249
      Height = 21
      TabOrder = 6
    end
    object edUF: TEdit
      Left = 455
      Top = 90
      Width = 37
      Height = 21
      TabOrder = 7
    end
    object edPais: TEdit
      Left = 499
      Top = 90
      Width = 172
      Height = 21
      TabOrder = 8
    end
    object btnPesqCEP: TBitBtn
      Left = 134
      Top = 44
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 1
      OnClick = btnPesqCEPClick
    end
  end
  object BitBtn1: TBitBtn
    Left = 271
    Top = 347
    Width = 105
    Height = 34
    Caption = 'Gravar'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 414
    Top = 343
    Width = 105
    Height = 34
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object ClientDados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 624
    Top = 128
    object ClientDadosNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object ClientDadosIDENTIDADE: TStringField
      FieldName = 'IDENTIDADE'
    end
    object ClientDadosCPF: TStringField
      FieldName = 'CPF'
    end
    object ClientDadosTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object ClientDadosEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 250
    end
    object ClientDadosCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object ClientDadosLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 250
    end
    object ClientDadosNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object ClientDadosCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 150
    end
    object ClientDadosBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 100
    end
    object ClientDadosCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 150
    end
    object ClientDadosESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object ClientDadosPAIS: TStringField
      FieldName = 'PAIS'
      Size = 100
    end
  end
end
