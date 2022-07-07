unit uFrmCadastroNotas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uDM;

type
  TFrmCadastroNotas = class(TForm)
    pnlTitulo: TPanel;
    pnlBotoes: TPanel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    pnlFundo: TPanel;
    lblAluno: TLabel;
    edtCodAluno: TEdit;
    lblAno: TLabel;
    edtAno: TEdit;
    edtNomeAluno: TEdit;
    lblNota1: TLabel;
    edtNota1: TEdit;
    edtNota2: TEdit;
    lblNota2: TLabel;
    edtNota3: TEdit;
    lblNota3: TLabel;
    edtNota4: TEdit;
    lblNota4: TLabel;
    SpeedButton1: TSpeedButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtCodAlunoExit(Sender: TObject);
  private
    { Private declarations }
  public
    IdProfessor: integer;
  end;

var
  FrmCadastroNotas: TFrmCadastroNotas;

implementation

{$R *.dfm}

procedure TFrmCadastroNotas.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadastroNotas.btnSalvarClick(Sender: TObject);
Const
  cSqlInsert = ' INSERT INTO ALUNOS_PROFESSOR(ANO, ID_ALUNO, ID_PROFESSOR, NOTA1, NOTA2, NOTA3, NOTA4) ' +
               ' VALUES (:pAno, :pIdAluno, :pIdProfessor, :pNota1, :pNota2, :pNota3, :pNota4) ';
Var
  qryCadastro: TFDQuery;
begin
  qryCadastro := TFDQuery.Create(nil);
  try
    qryCadastro.Connection := DM.Connection;
    qryCadastro.Sql.Add(cSqlInsert);
    qryCadastro.Params.ParamByName('pAno').Value := StrToInt(edtAno.Text);
    qryCadastro.Params.ParamByName('pIdAluno').Value := StrToInt(edtCodAluno.Text);
    qryCadastro.Params.ParamByName('pIdProfessor').Value := IdProfessor;
    qryCadastro.Params.ParamByName('pNota1').Value := StrToFloat(edtNota1.Text);
    qryCadastro.Params.ParamByName('pNota2').Value := StrToFloat(edtNota2.Text);
    qryCadastro.Params.ParamByName('pNota3').Value := StrToFloat(edtNota3.Text);
    qryCadastro.Params.ParamByName('pNota4').Value := StrToFloat(edtNota4.Text);
    qryCadastro.ExecSQL;
  finally
    FreeAndNil(qryCadastro);
  end;
  ShowMessage('Salvo com sucesso!');
  Close;
end;

procedure TFrmCadastroNotas.edtCodAlunoExit(Sender: TObject);
Const
  cSqlAluno = ' SELECT NOME FROM ALUNOS WHERE ID_ALUNO = :pIdAluno ';
Var
  qryValidaAluno: TFDQuery;
begin
  if edtCodAluno.Text = '' then
  begin
    edtNomeAluno.Clear;
    exit;
  end;
  qryValidaAluno := TFDQuery.Create(nil);
  try
    qryValidaAluno.Connection := DM.Connection;
    qryValidaAluno.Sql.Add(cSqlAluno);
    qryValidaAluno.Params.ParamByName('pIdAluno').Value := StrToInt(edtCodAluno.Text);
    qryValidaAluno.Open;
    if qryValidaAluno.RecordCount > 0 then
      edtNomeAluno.Text := qryValidaAluno.FieldByName('NOME').AsString
    else
    begin
      edtCodAluno.Clear;
      edtNomeAluno.Clear;
      ShowMessage('Aluno n�o encontrado!');
    end;
  finally
    FreeAndNil(qryValidaAluno);
  end;
end;

end.
