class Allievo{
  final String Nome;
  final String Cognome;
  final String Username;

  Allievo(this.Nome,this.Cognome,this.Username);

  Map<dynamic, String> toMap()
  {
    return {
      "nome":this.Nome,
      "cognome":this.Cognome
    };
  }
}