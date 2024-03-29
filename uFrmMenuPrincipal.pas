unit uFrmMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFrmMenuPrincipal = class(TForm)
    pnlFundo: TPanel;
    pnlTitulo: TPanel;
    btnCadastroProfessor: TSpeedButton;
    btnCadastroAlunos: TSpeedButton;
    procedure btnCadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenuPrincipal: TFrmMenuPrincipal;

implementation

{$R *.dfm}

uses uFrmPesquisa;

procedure TFrmMenuPrincipal.btnCadastroClick(Sender: TObject);
var
  frmPesquisa: TFrmPesquisa;
begin
  frmPesquisa:= TFrmPesquisa.Create(Self);
  try
    frmPesquisa.Tipo := (Sender as TSpeedButton).Tag;
    frmPesquisa.ShowModal;
  finally
    frmPesquisa.Free;
  end;
end;

end.
