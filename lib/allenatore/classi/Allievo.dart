class Allievo{
  final String Nome;
  final String Cognome;

  Allievo(this.Nome,this.Cognome);

  Map<dynamic, String> toMap()
  {
    return {
      "nome":this.Nome,
      "cognome":this.Cognome
    };
  }
}