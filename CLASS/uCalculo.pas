unit uCalculo;

interface

type
  TCalculo = class
  public
    function Calcular(Nota1, Nota2, Nota3, Nota4: Double): Double;
      Virtual; Abstract;
  end;

implementation

end.
