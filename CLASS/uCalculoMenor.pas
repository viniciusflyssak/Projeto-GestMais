unit uCalculoMenor;

interface

uses
  uCalculo;

type
  TCalculoMenor = class(TCalculo)
  public
    function Calcular(Nota1, Nota2, Nota3, Nota4: Double): Double; override;
  end;

implementation

{ TCalculoMedia }

function TCalculoMenor.Calcular(Nota1, Nota2, Nota3, Nota4: Double): Double;
begin
  Result := 0;
  if (Nota1 < Nota2) and (Nota1 < Nota3) and (Nota1 < Nota4) then
    Result := Nota1
  else
    if (Nota2 < Nota1) and (Nota2 < Nota3) and (Nota2 < Nota4) then
      Result := Nota2
    else
      if (Nota3 < Nota2) and (Nota3 < Nota1) and (Nota3 < Nota4) then
        Result := Nota3
      else
        if (Nota4 < Nota2) and (Nota4 < Nota3) and (Nota4 < Nota1) then
          Result := Nota4;
end;

end.