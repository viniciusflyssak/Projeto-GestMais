object FrmCadastro: TFrmCadastro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'GestMais - Cadastro'
  ClientHeight = 307
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 645
    Height = 266
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 635
    ExplicitHeight = 299
    object lblNome: TLabel
      Left = 24
      Top = 96
      Width = 40
      Height = 20
      Caption = 'Nome:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object llbCPF: TLabel
      Left = 24
      Top = 122
      Width = 30
      Height = 20
      Caption = 'CPF:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDataNascimento: TLabel
      Left = 24
      Top = 174
      Width = 127
      Height = 20
      Caption = 'Data de Nascimento:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDisciplinaSerie: TLabel
      Left = 24
      Top = 226
      Width = 66
      Height = 20
      Caption = 'Disciplina:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSexo: TLabel
      Left = 24
      Top = 148
      Width = 34
      Height = 20
      Caption = 'Sexo:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblEmail: TLabel
      Left = 24
      Top = 200
      Width = 44
      Height = 20
      Caption = 'E-mail:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 643
      Height = 64
      Align = alTop
      Caption = 'Cadastro de Professor'
      Color = clBackground
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -35
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object edtNome: TEdit
      Left = 70
      Top = 96
      Width = 523
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object edtCPF: TEdit
      Left = 70
      Top = 121
      Width = 523
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object edtNascimento: TEdit
      Left = 157
      Top = 172
      Width = 436
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object edtEmail: TEdit
      Left = 74
      Top = 199
      Width = 519
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object edtDisciplinaSerie: TEdit
      Left = 96
      Top = 225
      Width = 497
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object cbbSexo: TComboBox
      Left = 70
      Top = 146
      Width = 145
      Height = 22
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      Items.Strings = (
        'Masculino'
        'Feminino'
        'Outro')
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 266
    Width = 645
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 1
    ExplicitTop = 409
    ExplicitWidth = 643
    object btnSalvar: TSpeedButton
      Left = 563
      Top = 1
      Width = 81
      Height = 39
      Align = alRight
      Caption = 'Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnSalvarClick
      ExplicitTop = 6
      ExplicitHeight = 33
    end
    object btnCancelar: TSpeedButton
      Left = 1
      Top = 1
      Width = 81
      Height = 39
      Align = alLeft
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnCancelarClick
      ExplicitLeft = 9
      ExplicitTop = 2
    end
  end
end
