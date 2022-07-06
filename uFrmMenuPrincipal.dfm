object FrmMenuPrincipal: TFrmMenuPrincipal
  Left = 0
  Top = 0
  Margins.Left = 0
  Margins.Top = 0
  Margins.Right = 0
  Margins.Bottom = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'GestMais: gest'#227'o de professores e alunos.'
  ClientHeight = 809
  ClientWidth = 1118
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 1118
    Height = 809
    Align = alClient
    TabOrder = 0
    object btnCadastroProfessor: TSpeedButton
      Tag = 1
      Left = 424
      Top = 312
      Width = 273
      Height = 81
      Hint = 'Abre o cadastro de professores.'
      Caption = 'Cadastro de Professores'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCadastroClick
    end
    object btnCadastroAlunos: TSpeedButton
      Tag = 2
      Left = 424
      Top = 399
      Width = 273
      Height = 81
      Hint = 'Abre o cadastro de professores.'
      Caption = 'Cadastro de Alunos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCadastroClick
    end
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 1116
      Height = 88
      Align = alTop
      Caption = 'Menu Principal'
      Color = clBackground
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -48
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
  end
end
