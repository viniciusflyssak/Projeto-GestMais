object FrmCadastroNotas: TFrmCadastroNotas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'GestMais - Cadastro de notas'
  ClientHeight = 199
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
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 645
    Height = 64
    Align = alTop
    Caption = 'Cadastro de Notas'
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
  object pnlBotoes: TPanel
    Left = 0
    Top = 158
    Width = 645
    Height = 41
    Align = alBottom
    TabOrder = 1
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
  object pnlFundo: TPanel
    Left = 0
    Top = 64
    Width = 645
    Height = 94
    Align = alClient
    Caption = '`'
    TabOrder = 2
    object lblAluno: TLabel
      Left = 24
      Top = 10
      Width = 41
      Height = 20
      Caption = 'Aluno:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblAno: TLabel
      Left = 24
      Top = 36
      Width = 29
      Height = 20
      Caption = 'Ano:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNota1: TLabel
      Left = 25
      Top = 62
      Width = 43
      Height = 20
      Caption = 'Nota 1:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNota2: TLabel
      Left = 119
      Top = 62
      Width = 43
      Height = 20
      Caption = 'Nota 2:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNota3: TLabel
      Left = 213
      Top = 62
      Width = 43
      Height = 20
      Caption = 'Nota 3:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNota4: TLabel
      Left = 308
      Top = 62
      Width = 43
      Height = 20
      Caption = 'Nota 4:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCodAluno: TEdit
      Left = 71
      Top = 10
      Width = 58
      Height = 24
      Hint = 'ID do Aluno'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnExit = edtCodAlunoExit
    end
    object edtAno: TEdit
      Left = 71
      Top = 35
      Width = 58
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object edtNomeAluno: TEdit
      Left = 135
      Top = 10
      Width = 459
      Height = 24
      TabStop = False
      Color = 16515048
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edtNota1: TEdit
      Left = 71
      Top = 61
      Width = 42
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object edtNota2: TEdit
      Left = 165
      Top = 61
      Width = 42
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object edtNota3: TEdit
      Left = 260
      Top = 61
      Width = 42
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object edtNota4: TEdit
      Left = 354
      Top = 61
      Width = 42
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
  end
end
