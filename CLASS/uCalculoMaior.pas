unit uCalculoMaior;

interface

uses
  uCalculo;

type
  TCalculoMaior = class(TCalculo)
  public
    function Calcular(Nota1, Nota2, Nota3, Nota4: Double): Double; override;
  end;

implementation

{ TCalculoMedia }

function TCalculoMaior.Calcular(Nota1, Nota2, Nota3, Nota4: Double): Double;
begin
  Result := Nota1;
  if (Result < Nota2) then
    Result := Nota2;
  if (Result < Nota3) then
    Result := Nota3;
  if (Result < Nota4) then
    Result := Nota4;
end;

end.
