using System.Text.Json.Serialization;
using YamlDotNet.Serialization;

namespace lab2_json_csharp;

public class DepartmentEntry
{
    [JsonPropertyName("Kod_TERYT")]
    public required int KodTeryt { get; init; }
    
    [JsonPropertyName("nazwa_samorządu")]
    public required string NazwaSamorzadu { get; init; }

    [JsonPropertyName("Województwo")]
    public required string Wojewodztwo { get; init; }
    
    [JsonPropertyName("Powiat")]
    public required string Powiat { get; init; }
    
    [JsonPropertyName("typ_JST")]
    public required string TypJst { get; init; }
    
    [JsonPropertyName("nazwa_urzędu_JST")]
    public required string NazwaUrzeduJst { get; init; }
    
    [JsonPropertyName("miejscowość")]
    public required string Miejscowosc { get; init; }
    
    [JsonPropertyName("Kod pocztowy")]
    public required string KodPocztowy { get; init; }
    
    [JsonPropertyName("poczta")]
    public required string Poczta { get; init; }
    
    [JsonPropertyName("Ulica")]
    public required string Ulica { get; init; }
    
    [JsonPropertyName("Nr domu")]
    public required string NrDomu { get; init; }
    
    [JsonPropertyName("telefon kierunkowy")]
    public required int TelefonKierunkowy { get; init; }
    
    [JsonPropertyName("telefon")]
    public required string Telefon { get; init; }
    
    [JsonPropertyName("telefon 2")]
    public required int? Telefon2 { get; init; }
    
    [JsonPropertyName("wewnętrzny")]
    public required string Wewnetrzny { get; init; }
    
    [JsonPropertyName("FAX kierunkowy")]
    public required int? FaxKierunkowy { get; init; }
    
    [JsonPropertyName("FAX")]
    public required string Fax { get; init; }
    
    [JsonPropertyName("FAX wewnętrzny")]
    public required int? FaxWewnetrzny { get; init; }
    
    [JsonPropertyName("ogólny adres poczty elektronicznej gminy")]
    public required PowiatContainer OgolnyAdresPocztyElektronicznejGminy { get; init; }
    
    [JsonPropertyName("adres www jednostki")]
    public required string AdresWwwJednostki { get; init; }
    public required string ESP { get; init; }
    public required string FIELD22 { get; init; }
    public required string FIELD23 { get; init; }
    public required string FIELD24 { get; init; }
    public required string FIELD25 { get; init; }
    public required string FIELD26 { get; init; }
    public required string FIELD27 { get; init; }
    public required string FIELD28 { get; init; }
    public required string FIELD29 { get; init; }
    public required string FIELD30 { get; init; }
    public required string FIELD31 { get; init; }
    public required string FIELD32 { get; init; }
    public required string FIELD33 { get; init; }
    public required string FIELD34 { get; init; }
    public required string FIELD35 { get; init; }
    public required string FIELD36 { get; init; }
    public required string FIELD37 { get; init; }
    public required string FIELD38 { get; init; }
    public required string FIELD39 { get; init; }
    public required string FIELD40 { get; init; }
    public required string FIELD41 { get; init; }
}

public class PowiatContainer
{
    [JsonPropertyName("powiatu")]
    public required WojewodztwoContainer Powiatu { get; init; }
}
public class WojewodztwoContainer
{
    [JsonPropertyName("województwa")]
    public required string Wojewodztwa { get; init; }
}

class Config
{
    [YamlMember(Alias = "paths")]
    public required Paths Paths { get; init; }

    [YamlMember(Alias = "jobs")]
    public required List<Job> Jobs { get; init; }
}
class Paths
{
    [YamlMember(Alias = "source_folder")]
    public required string SourceFolder { get; init; }

    [YamlMember(Alias = "json_source_file")]
    public required string JsonSourceFile { get; init; }

    [YamlMember(Alias = "json_destination_file")]
    public required string JsonDestinationFile { get; init; }

    [YamlMember(Alias = "yaml_destination_file")]
    public required string YamlDestinationFile { get; init; }

    [YamlMember(Alias = "xml_source_file")]
    public required string XmlSourceFile {get; init; }

    [YamlMember(Alias = "xml_destination_file")]
    public required string XmlDestinationFile { get; init; }
}
class Job
{
    [YamlMember(Alias = "name")]
    public required JobName Name { get; init; }

    [YamlMember(Alias = "format")]
    public Format? Format { get; init; }

    [YamlMember(Alias = "source")]
    public Source? Source { get; init; }
}
enum JobName
{
    [YamlMember(Alias = "deserialize")]
    deserialize,

    [YamlMember(Alias = "somestats")]
    Somestats,

    [YamlMember(Alias = "serialize")]
    Serialize
}
enum Format
{
    [YamlMember(Alias = "json")]
    Json,
    [YamlMember(Alias = "yaml")]
    Yaml,
    [YamlMember(Alias = "xml")]
    Xml
}
enum Source
{
    [YamlMember(Alias = "file")]
    File,
    [YamlMember(Alias = "object")]
    Object
}
