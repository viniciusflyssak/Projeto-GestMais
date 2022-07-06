unit uFrmPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB, uDM, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uFrmCadastro;

type
  TFrmPesquisa = class(TForm)
    grdPesquisa: TDBGrid;
    pnlFundo: TPanel;
    pnlBotoes: TPanel;
    btnVoltar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnNovo: TSpeedButton;
    btnDeletar: TSpeedButton;
    qryPesquisa: TFDQuery;
    dtsPesquisa: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnEditarNovoClick(Sender: TObject);
  private
  public
    Tipo: integer; // 1 = Professor, 2 = Aluno
  end;

var
  FrmPesquisa: TFrmPesquisa;

implementation

{$R *.dfm}

procedure TFrmPesquisa.btnDeletarClick(Sender: TObject);
Const
  cDeletaProfessor = ' DELETE FROM PROFESSORES WHERE ID_PROFESSOR = :pId ';
  cDeletaAluno = ' DELETE FROM ALUNOS WHERE ID_ALUNO = :pId ';
var
  qryDeletar: TFDQuery;
begin
  qryDeletar := TFDQuery.Create(nil);
  try
    qryDeletar.Connection := dm.Connection;
    case Tipo of
      1: qryDeletar.Sql.Add(cDeletaProfessor);   
      2: qryDeletar.Sql.Add(cDeletaAluno);
    end;
    qryDeletar.Params.ParamByName('pId').Value := qryPesquisa.FieldByName('C�digo').AsInteger;
    qryDeletar.ExecSQL;
  finally
    FreeAndNil(qryDeletar);
    qryPesquisa.Refresh;
  end;
end;

procedure TFrmPesquisa.btnEditarNovoClick(Sender: TObject);
var
  frmCadastro: TFrmCadastro;
begin
  frmCadastro:= TFrmCadastro.Create(Self);
  try
    if (Sender as TSpeedButton).tag = 1 then
      frmCadastro.ID := 0
    else
      frmCadastro.ID := qryPesquisa.FieldByName('C�digo').AsInteger;
    frmCadastro.Tipo := Tipo;
    frmCadastro.ShowModal;
    qryPesquisa.Refresh;
  finally
    FreeAndNil(frmCadastro);
  end;
end;

procedure TFrmPesquisa.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPesquisa.FormShow(Sender: TObject);
Const
  cSqlProfessores = ' SELECT ID_PROFESSOR AS C�digo, NOME FROM PROFESSORES ';
  cSqlAlunos = ' SELECT ID_ALUNO AS C�digo, NOME FROM ALUNOS ';
begin
  case Tipo of
    1: FrmPesquisa.Caption := 'Pesquisa: Professores';
    2: FrmPesquisa.Caption := 'Pesquisa: Alunos';
  end;
  try
    qryPesquisa.Connection := DM.Connection;
    case Tipo of
      1: qryPesquisa.Sql.Add(cSqlProfessores);
      2: qryPesquisa.Sql.Add(cSqlAlunos);
    end;
    qryPesquisa.Open;
    ShowScrollBar(grdPesquisa.Handle,SB_HORZ,False);
  except
    raise exception.Create('Erro ao carregar os registros!');
  end;
end;

end.
