object FrmPesquisa: TFrmPesquisa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pesquisa'
  ClientHeight = 309
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
    Height = 268
    Align = alClient
    TabOrder = 0
    object grdPesquisa: TDBGrid
      Left = 1
      Top = 1
      Width = 643
      Height = 266
      Align = alClient
      DataSource = dtsPesquisa
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'Arial'
      TitleFont.Style = [fsBold]
      OnCellClick = grdPesquisaCellClick
      OnDblClick = grdPesquisaDblClick
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 268
    Width = 645
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnVoltar: TSpeedButton
      Left = 1
      Top = 1
      Width = 73
      Height = 39
      Align = alLeft
      Caption = 'Voltar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnVoltarClick
      ExplicitTop = 5
    end
    object btnEditar: TSpeedButton
      Tag = 2
      Left = 498
      Top = 1
      Width = 73
      Height = 39
      Align = alRight
      Caption = 'Editar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnEditarNovoClick
      ExplicitLeft = 9
      ExplicitTop = 2
    end
    object btnNovo: TSpeedButton
      Tag = 1
      Left = 571
      Top = 1
      Width = 73
      Height = 39
      Align = alRight
      Caption = 'Novo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnEditarNovoClick
      ExplicitLeft = 9
      ExplicitTop = 2
    end
    object btnDeletar: TSpeedButton
      Left = 425
      Top = 1
      Width = 73
      Height = 39
      Align = alRight
      Caption = 'Deletar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnDeletarClick
      ExplicitLeft = -5
      ExplicitTop = 5
    end
    object btnCalcularMedia: TSpeedButton
      Left = 352
      Top = 1
      Width = 73
      Height = 39
      Align = alRight
      Caption = 'M'#233'dia'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      OnClick = btnCalcularMediaClick
      ExplicitLeft = -5
      ExplicitTop = 5
    end
  end
  object qryPesquisa: TFDQuery
    AfterOpen = qryPesquisaAfterRefreshOrOpen
    AfterRefresh = qryPesquisaAfterRefreshOrOpen
    Left = 608
    Top = 8
  end
  object dtsPesquisa: TDataSource
    DataSet = qryPesquisa
    Left = 608
    Top = 56
  end
end
