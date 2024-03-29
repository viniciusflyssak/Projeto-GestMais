object FrmCadastro: TFrmCadastro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'GestMais - Cadastro'
  ClientHeight = 264
  ClientWidth = 605
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
    Width = 605
    Height = 223
    Align = alClient
    Alignment = taLeftJustify
    AutoSize = True
    TabOrder = 0
    object lblNome: TLabel
      Left = 21
      Top = 72
      Width = 45
      Height = 18
      Caption = 'Nome:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object llbCPF: TLabel
      Left = 21
      Top = 103
      Width = 34
      Height = 18
      Caption = 'CPF:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDataNascimento: TLabel
      Left = 253
      Top = 102
      Width = 145
      Height = 18
      Caption = 'Data de Nascimento:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDisciplinaSerie: TLabel
      Left = 21
      Top = 191
      Width = 73
      Height = 18
      Caption = 'Disciplina:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSexo: TLabel
      Left = 21
      Top = 131
      Width = 40
      Height = 18
      Caption = 'Sexo:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblEmail: TLabel
      Left = 21
      Top = 162
      Width = 47
      Height = 18
      Caption = 'E-mail:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnCadastroNotas: TSpeedButton
      Left = 480
      Top = 131
      Width = 113
      Height = 26
      Caption = 'Cadastrar Notas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      OnClick = btnCadastroNotasClick
    end
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 603
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
      Left = 74
      Top = 72
      Width = 519
      Height = 24
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object edtEmail: TEdit
      Left = 74
      Top = 162
      Width = 519
      Height = 24
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object edtDisciplinaSerie: TEdit
      Left = 103
      Top = 191
      Width = 490
      Height = 24
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object cbbSexo: TComboBox
      Left = 74
      Top = 131
      Width = 100
      Height = 24
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      Items.Strings = (
        'Masculino'
        'Feminino'
        'Outro')
    end
    object edtCpf: TMaskEdit
      Left = 74
      Top = 102
      Width = 100
      Height = 24
      AutoSize = False
      EditMask = '###.###.###-##'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      MaxLength = 14
      ParentFont = False
      TabOrder = 2
      Text = '   .   .   -  '
    end
    object dtpDataNasc: TDateTimePicker
      Left = 407
      Top = 102
      Width = 186
      Height = 24
      Date = 44750.000000000000000000
      Time = 0.158035543980076900
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 223
    Width = 605
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnSalvar: TSpeedButton
      Left = 523
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
      ExplicitLeft = 563
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
