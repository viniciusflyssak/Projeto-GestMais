program ProjGestMais;



uses
  Vcl.Forms,
  uFrmMenuPrincipal in 'uFrmMenuPrincipal.pas' {FrmMenuPrincipal},
  uFrmPesquisa in 'uFrmPesquisa.pas' {FrmPesquisa},
  uFrmCadastro in 'uFrmCadastro.pas' {FrmCadastro},
  uDM in 'uDM.pas' {DM: TDataModule},
  uFrmCadastroNotas in 'uFrmCadastroNotas.pas',
  uCalculo in 'CLASS\uCalculo.pas',
  uCalculoMedia in 'CLASS\uCalculoMedia.pas',
  uCalculoMaior in 'CLASS\uCalculoMaior.pas',
  uCalculoMenor in 'CLASS\uCalculoMenor.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMenuPrincipal, FrmMenuPrincipal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
