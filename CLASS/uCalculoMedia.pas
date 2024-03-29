unit uCalculoMedia;

interface

uses
  uCalculo;

type
  TCalculoMedia = class(TCalculo)
  public
    function Calcular(Nota1, Nota2, Nota3, Nota4: Double): Double; override;
  end;

implementation

{ TCalculoMedia }

function TCalculoMedia.Calcular(Nota1, Nota2, Nota3, Nota4: Double): Double;
begin
  Result := (Nota1 + Nota2 + Nota3 + Nota4) / 4;
end;

end.
