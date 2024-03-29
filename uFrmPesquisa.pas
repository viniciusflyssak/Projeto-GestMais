unit uFrmPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB, uDM, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, FireDAC.Stan.ExprFuncs;

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
    btnCalcularMedia: TSpeedButton;
    pnlBusca: TPanel;
    edtBusca: TEdit;
    lblBusca: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnEditarNovoClick(Sender: TObject);
    procedure btnCalcularMediaClick(Sender: TObject);
    procedure grdPesquisaDblClick(Sender: TObject);
    procedure grdPesquisaCellClick(Column: TColumn);
    procedure qryPesquisaAfterRefreshOrOpen(DataSet: TDataSet);
    procedure edtBuscaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TFrmPesquisa.btnCalcularMediaClick(Sender: TObject);
var
  calculoMedia: TCalculoMedia;
  calculoMenor: TCalculoMenor;
  calculoMaior: TCalculoMaior;
  nota1, nota2, nota3, nota4: Double;
begin
  nota1 := qryPesquisa.FieldByName('NOTA_1').AsFloat;
  nota2 := qryPesquisa.FieldByName('NOTA_2').AsFloat;
  nota3 := qryPesquisa.FieldByName('NOTA_3').AsFloat;
  nota4 := qryPesquisa.FieldByName('NOTA_4').AsFloat;
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
    qryDeletar.Params.ParamByName('pId').Value := qryPesquisa.FieldByName('ID').AsInteger;
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
        frmCadastro.ID := qryPesquisa.FieldByName('ID').AsInteger;
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
        frmCadastroNota.IdRegistro := qryPesquisa.FieldByName('ID').AsInteger;
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

procedure TFrmPesquisa.edtBuscaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Const
  cSqlBuscaProfessorPorAluno = ' SELECT ID_PROFESSOR FROM ALUNOS_PROFESSOR  ' +
                               ' INNER JOIN  ALUNOS ON ALUNOS.ID_ALUNO = ALUNOS_PROFESSOR.ID_ALUNO ' ;
var
  filtroprofessor: String;
  function montaFiltroProfessor: String;
  var
    qryBuscaProfessorAluno: TFDQuery;
  begin
    Result := '';
    qryBuscaProfessorAluno := TFDQuery.Create(nil);
    try
      qryBuscaProfessorAluno.Connection := DM.Connection;
      qryBuscaProfessorAluno.Sql.Add(cSqlBuscaProfessorPorAluno);
      qryBuscaProfessorAluno.Sql.Add(' WHERE UPPER(ALUNOS.NOME) LIKE ''%' + UpperCase(edtBusca.Text) + '%''');
      qryBuscaProfessorAluno.Open;
      qryBuscaProfessorAluno.First;
      if qryBuscaProfessorAluno.RecordCount > 0 then
      begin
        while not(qryBuscaProfessorAluno.Eof) do
        begin
          Result := Result + ' OR (ID = ' + qryBuscaProfessorAluno.FieldByName('ID_PROFESSOR').AsString + ')';
          qryBuscaProfessorAluno.Next;
        end;
      end;
    finally
      FreeAndNil(qryBuscaProfessorAluno);
    end;
  end;
begin
  filtroProfessor := '';
  if length(edtBusca.Text) > 2 then
  begin
    if FTipo = 1 then
      filtroprofessor := montaFiltroProfessor;
    qryPesquisa.Filtered := false;
    qryPesquisa.Filter := 'UPPER(NOME) LIKE ''%' +  UpperCase(edtBusca.Text) + '%''';
    if (FTipo = 1) and not(filtroProfessor = '') then
      qryPesquisa.Filter := '(' + qryPesquisa.Filter + ')' + filtroProfessor;
    qryPesquisa.Filtered := true;  
  end;
  if edtBusca.Text = '' then
  begin
    qryPesquisa.Filtered := false;
    qryPesquisa.Filter := '';
  end;
end;

procedure TFrmPesquisa.FormShow(Sender: TObject);
Const
  cSqlProfessores = ' SELECT ID_PROFESSOR AS ID, NOME ' +
                    ' FROM PROFESSORES ' +
                    ' ORDER BY ID ';
  cSqlAlunos = ' SELECT ID_ALUNO AS ID, NOME ' +
               ' FROM ALUNOS ' +
               ' ORDER BY ID ';
  cSqlNotas = ' SELECT AP.ID_ALUNOS_PROFESSOR AS ID, AL.ID_ALUNO AS ALUNO, AL.NOME AS NOME, AP.ANO, ' +
              ' AP.NOTA1 AS NOTA_1, AP.NOTA2 AS NOTA_2, AP.NOTA3 AS NOTA_3, AP.NOTA4 AS NOTA_4 ' +
              ' FROM ALUNOS_PROFESSOR AP ' +
              ' INNER JOIN ALUNOS AL ON AL.ID_ALUNO = AP.ID_ALUNO ' +
              ' WHERE AP.ID_PROFESSOR = :pId ' +
              ' ORDER BY ID ';
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

procedure TFrmPesquisa.grdPesquisaCellClick(Column: TColumn);
begin
  grdPesquisa.SelectedField := grdPesquisa.Fields[0];
end;

procedure TFrmPesquisa.grdPesquisaDblClick(Sender: TObject);
begin
  btnEditarNovoClick(btnEditar);
end;

procedure TFrmPesquisa.qryPesquisaAfterRefreshOrOpen(DataSet: TDataSet);
begin
  if qryPesquisa.RecordCount > 0 then
  begin
    btnEditar.Visible := true;
    btnDeletar.Visible := true;
    if FTipo = 3 then
      btnCalcularMedia.Visible := true;
  end
  else
  begin
    btnEditar.Visible := false;
    btnDeletar.Visible := false;
    btnCalcularMedia.Visible := false;
  end;
end;

end.
