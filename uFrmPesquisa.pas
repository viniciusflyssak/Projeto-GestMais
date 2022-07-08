unit uFrmPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB, uDM, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

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
    BtnCalcularMedia: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnEditarNovoClick(Sender: TObject);
    procedure BtnCalcularMediaClick(Sender: TObject);
    procedure grdPesquisaDblClick(Sender: TObject);
  private
    FTipo: integer; // 1 = Professor, 2 = Aluno, 3 = Notas
    FID: integer;
  published
    property Tipo: integer read FTipo write FTipo;
    property ID: integer read FID write FID;
  end;

var
  FrmPesquisa: TFrmPesquisa;

implementation

{$R *.dfm}

uses uFrmCadastro, uFrmCadastroNotas, uCalculoMedia, uCalculoMaior, uCalculoMenor;

procedure TFrmPesquisa.BtnCalcularMediaClick(Sender: TObject);
var
  calculoMedia: TCalculoMedia;
  calculoMenor: TCalculoMenor;
  calculoMaior: TCalculoMaior;
  nota1, nota2, nota3, nota4: Double;
begin
  nota1 := qryPesquisa.FieldByName('NOTA1').AsFloat;
  nota2 := qryPesquisa.FieldByName('NOTA2').AsFloat;
  nota3 := qryPesquisa.FieldByName('NOTA3').AsFloat;
  nota4 := qryPesquisa.FieldByName('NOTA4').AsFloat;
  calculoMedia := TCalculoMedia.Create;
  calculoMenor := TCalculoMenor.Create;
  calculoMaior := TCalculoMaior.Create;
  try
    ShowMessage('M�dia: ' + FormatFloat('0.0', calculoMedia.Calcular(nota1, nota2, nota3, nota4)) + #10#13 +
                'Menor nota: ' + FloatToStr(calculoMenor.Calcular(nota1, nota2, nota3, nota4)) + #10#13 +
                'Maior nota: ' + FloatToStr(calculoMaior.Calcular(nota1, nota2, nota3, nota4)));
  finally
    FreeAndNil(calculoMedia);
    FreeAndNil(calculoMenor);
    FreeAndNil(calculoMaior);
  end;

end;

procedure TFrmPesquisa.btnDeletarClick(Sender: TObject);
Const
  cDeletaProfessor = ' DELETE FROM PROFESSORES WHERE ID_PROFESSOR = :pId ';
  cDeletaAluno = ' DELETE FROM ALUNOS WHERE ID_ALUNO = :pId ';
  cDeletaAlunoProfessor = ' DELETE FROM ALUNOS_PROFESSOR WHERE ID_ALUNOS_PROFESSOR = :pId ';
var
  qryDeletar: TFDQuery;
begin
  qryDeletar := TFDQuery.Create(nil);
  try
    qryDeletar.Connection := dm.Connection;
    case FTipo of
      1: qryDeletar.Sql.Add(cDeletaProfessor);   
      2: qryDeletar.Sql.Add(cDeletaAluno);
      3: qryDeletar.Sql.Add(cDeletaAlunoProfessor);
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
  frmCadastroNota: TFrmCadastroNotas;
begin
  if not(FTipo = 3) then
  begin
    frmCadastro:= TFrmCadastro.Create(Self);
    try
      if (Sender as TSpeedButton).tag = 1 then
        frmCadastro.ID := 0
      else
        frmCadastro.ID := qryPesquisa.FieldByName('C�digo').AsInteger;
      frmCadastro.Tipo := FTipo;
      frmCadastro.ShowModal;
      qryPesquisa.Refresh;
    finally
      FreeAndNil(frmCadastro);
    end;
  end
  else
  begin
    frmCadastroNota := TFrmCadastroNotas.Create(Self);
    try
      frmCadastroNota.IdProfessor := FID;
      if (Sender as TSpeedButton).tag = 1 then
        frmCadastroNota.IdRegistro := 0
      else
        frmCadastroNota.IdRegistro := qryPesquisa.FieldByName('C�digo').AsInteger;
      frmCadastroNota.ShowModal;
      qryPesquisa.Refresh;
    finally
      FreeAndNil(frmCadastroNota);
    end;
  end;
end;

procedure TFrmPesquisa.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPesquisa.FormShow(Sender: TObject);
Const
  cSqlProfessores = ' SELECT ID_PROFESSOR AS C�digo, NOME ' +
                    ' FROM PROFESSORES ';
  cSqlAlunos = ' SELECT ID_ALUNO AS C�digo, NOME ' +
               ' FROM ALUNOS ';
  cSqlNotas = ' SELECT AP.ID_ALUNOS_PROFESSOR AS C�digo, AL.ID_ALUNO AS ALUNO, AL.NOME AS NOME, AP.ANO, ' +
              ' AP.NOTA1 AS NOTA_1, AP.NOTA2 AS NOTA_2, AP.NOTA3 AS NOTA_3, AP.NOTA4 AS NOTA_4 ' +
              ' FROM ALUNOS_PROFESSOR AP ' +
              ' INNER JOIN ALUNOS AL ON AL.ID_ALUNO = AP.ID_ALUNO ' +
              ' WHERE AP.ID_PROFESSOR = :pId ';
begin
  case FTipo of
    1: FrmPesquisa.Caption := 'Pesquisa: Professores';
    2: FrmPesquisa.Caption := 'Pesquisa: Alunos';
    3:
    begin
      BtnCalcularMedia.Visible := true;
      FrmPesquisa.Caption := 'Pesquisa: Notas de alunos';
    end;
  end;
  try
    qryPesquisa.Connection := DM.Connection;
    case FTipo of
      1: qryPesquisa.Sql.Add(cSqlProfessores);
      2: qryPesquisa.Sql.Add(cSqlAlunos);
      3:
      begin
        qryPesquisa.Sql.Add(cSqlNotas);
        qryPesquisa.Params.ParamByName('pId').Value := FID;
      end;
    end;
    qryPesquisa.Open;
    if not(FTipo = 3) then
      ShowScrollBar(grdPesquisa.Handle,SB_HORZ,False);
  except
    raise exception.Create('Erro ao carregar os registros!');
  end;
end;

procedure TFrmPesquisa.grdPesquisaDblClick(Sender: TObject);
begin
  btnEditarNovoClick(btnEditar);
end;

end.
