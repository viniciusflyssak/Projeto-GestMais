program ProjGestMais;



uses
  Vcl.Forms,
  uFrmMenuPrincipal in 'uFrmMenuPrincipal.pas' {FrmMenuPrincipal},
  uFrmPesquisa in 'uFrmPesquisa.pas' {FrmPesquisa},
  uFrmCadastro in 'uFrmCadastro.pas' {FrmCadastro},
  uDM in 'uDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMenuPrincipal, FrmMenuPrincipal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
