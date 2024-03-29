unit uFrmCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, uFrmCadastroNotas,
  FireDAC.Comp.Client, uDM, Vcl.Mask, Vcl.ComCtrls;

type
  TFrmCadastro = class(TForm)
    pnlFundo: TPanel;
    pnlTitulo: TPanel;
    lblNome: TLabel;
    llbCPF: TLabel;
    lblDataNascimento: TLabel;
    lblDisciplinaSerie: TLabel;
    lblSexo: TLabel;
    lblEmail: TLabel;
    edtNome: TEdit;
    edtEmail: TEdit;
    edtDisciplinaSerie: TEdit;
    cbbSexo: TComboBox;
    pnlBotoes: TPanel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnCadastroNotas: TSpeedButton;
    edtCpf: TMaskEdit;
    dtpDataNasc: TDateTimePicker;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCadastroNotasClick(Sender: TObject);
  private
    FTipo: integer;
    FID: integer;
  published
    property ID: integer read FID write FID;
    property Tipo: integer read FTipo write FTipo;
  end;

var
  FrmCadastro: TFrmCadastro;

implementation

{$R *.dfm}

uses uFrmPesquisa;

procedure TFrmCadastro.btnCadastroNotasClick(Sender: TObject);
var
  frmPesquisaNotas: TFrmPesquisa;
begin
  frmPesquisaNotas := TFrmPesquisa.Create(Self);
  try
    frmPesquisaNotas.ID := FID;
    frmPesquisaNotas.Tipo := 3;
    frmPesquisaNotas.ShowModal;
  finally
    FreeAndNil(frmPesquisaNotas);
  end;
end;

procedure TFrmCadastro.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadastro.btnSalvarClick(Sender: TObject);
Const
  cInsereProfessor = ' INSERT INTO PROFESSORES(NOME, CPF, SEXO, DATA_NASCIMENTO, EMAIL, DISCIPLINA) VALUES ';
  cInsereAluno = ' INSERT INTO ALUNOS(NOME, CPF, SEXO, DATA_NASCIMENTO, EMAIL, SERIE) VALUES ';
  cAtualizaProfessor = ' UPDATE PROFESSORES SET NOME = :pNome, CPF = :pCpf, SEXO = :pSexo, DATA_NASCIMENTO = :pDataNasc, ' +
                       ' EMAIL = :pEmail, DISCIPLINA = :pDisciplinaSerie WHERE ID_PROFESSOR = :pId ';
  cAtualizaAluno = ' UPDATE ALUNOS SET NOME = :pNome, CPF = :pCpf, SEXO = :pSexo, DATA_NASCIMENTO = :pDataNasc, ' +
                   ' EMAIL = :pEmail, SERIE = :pDisciplinaSerie WHERE ID_ALUNO = :pId ';
var
  qrySalvar: TFDQuery;
  procedure validaDados;
  begin
    if edtNome.Text = '' then
    begin
      edtNome.SetFocus;
      raise Exception.Create('Necessário informar nome!');
    end;
    if (edtCpf.Text = '   .   .   -  ') or (copy(edtCpf.Text, 14, 1) = ' ') then
    begin
      edtCpf.SetFocus;
      raise Exception.Create('Necessário informar CPF!');
    end;
    if cbbSexo.ItemIndex < 0 then
    begin
      cbbSexo.SetFocus;
      raise Exception.Create('Necessário selecionar Sexo!');
    end;
    if edtDisciplinaSerie.Text = '' then
    begin
      edtDisciplinaSerie.SetFocus;
      case FTipo of
        1: raise Exception.Create('Necessário informar Disciplina!');
        2: raise Exception.Create('Necessário informar Série!');
      end;
    end;
    if dtpDataNasc.Date = Date then
      raise Exception.Create('Necessário informar data de nascimento válida!');
  end;
begin
  validaDados;
  qrySalvar := TFDQuery.Create(nil);
  try
    qrySalvar.Connection := DM.Connection;
    if FID > 0 then
    begin
      case FTipo of
        1: qrySalvar.Sql.Add(cAtualizaProfessor);
        2: qrySalvar.Sql.Add(cAtualizaAluno);
      end;
    end
    else
    begin
      case FTipo of
        1: qrySalvar.Sql.Add(cInsereProfessor);
        2: qrySalvar.Sql.Add(cInsereAluno);
      end;
    end;
    if not(FID > 0) then
      qrySalvar.Sql.Add(' (:pNome, :pCpf, :pSexo, :pDataNasc, :pEmail, :pDisciplinaSerie) ');
    qrySalvar.Params.ParamByName('pNome').Value := edtNome.Text;
    qrySalvar.Params.ParamByName('pCpf').Value := edtCPF.Text;
    qrySalvar.Params.ParamByName('pSexo').Value := copy(cbbSexo.Text,1,1);
    qrySalvar.Params.ParamByName('pDataNasc').Value := dtpDataNasc.DateTime;
    qrySalvar.Params.ParamByName('pEmail').Value := edtEmail.Text;
    qrySalvar.Params.ParamByName('pDisciplinaSerie').Value := edtDisciplinaSerie.Text;
    if FID > 0 then
      qrySalvar.Params.ParamByName('pId').Value := FID;
    qrySalvar.ExecSQL;
    ShowMessage('Salvo com sucesso!');
  finally
    FreeAndNil(qrySalvar);
  end;
  Close;
end;

procedure TFrmCadastro.FormShow(Sender: TObject);
Const
  cCarregaDadosProfessor = ' SELECT NOME, CPF, SEXO, DATA_NASCIMENTO, EMAIL, DISCIPLINA ' +
                           ' FROM PROFESSORES ' +
                           ' WHERE ID_PROFESSOR = :pId ';
  cCarregaDadosAluno = ' SELECT NOME, CPF, SEXO, DATA_NASCIMENTO, EMAIL, SERIE ' +
                       ' FROM ALUNOS ' +
                       ' WHERE ID_ALUNO = :pId ';
var
  qryCarregaDados: TFDQuery;
begin
  if FID > 0 then
  begin
    qryCarregaDados := TFDQuery.Create(nil);
    try
      qryCarregaDados.Connection := DM.Connection;
      case FTipo of
        1: qryCarregaDados.Sql.Add(cCarregaDadosProfessor);
        2: qryCarregaDados.Sql.Add(cCarregaDadosAluno);
      end;
      qryCarregaDados.Params.ParamByName('pID').Value := FID;
      qryCarregaDados.Open;
      edtNome.Text := qryCarregaDados.FieldByName('NOME').AsString;
      edtCPF.Text := qryCarregaDados.FieldByName('CPF').AsString;
      dtpDataNasc.Date := qryCarregaDados.FieldByName('DATA_NASCIMENTO').AsDateTime;
      edtEmail.Text := qryCarregaDados.FieldByName('EMAIL').AsString;
      case FTipo of
        1: edtDisciplinaSerie.Text := qryCarregaDados.FieldByName('DISCIPLINA').AsString;
        2: edtDisciplinaSerie.Text := qryCarregaDados.FieldByName('SERIE').AsString;
      end;
      if qryCarregaDados.FieldByName('SEXO').AsString = 'M' then
        cbbSexo.ItemIndex := 0
      else
        if qryCarregaDados.FieldByName('SEXO').AsString = 'F' then
          cbbSexo.ItemIndex := 1
        else
          cbbSexo.ItemIndex := 2;
    finally
      FreeAndNil(qryCarregaDados);
    end;
  end;

  case FTipo of
    1:
    begin
      pnlTitulo.Caption := 'Cadastro de Professor';
      lblDisciplinaSerie.Caption := 'Disciplina';
      edtDisciplinaSerie.ShowHint := false;
      edtDisciplinaSerie.Hint := 'Ex: Matemática';
      edtDisciplinaSerie.ShowHint := true;
      if FID > 0 then
        BtnCadastroNotas.Visible := true;
    end;
    2:
    begin
      pnlTitulo.Caption := 'Cadastro de Aluno';
      lblDisciplinaSerie.Caption := 'Série:';
      edtDisciplinaSerie.ShowHint := false;
      edtDisciplinaSerie.Hint := 'Ex: 5*-D';
      edtDisciplinaSerie.ShowHint := true;
      edtDisciplinaSerie.Left := edtEmail.Left;
      edtDisciplinaSerie.Width := edtEmail.Width;
    end;
  end;
end;

end.
