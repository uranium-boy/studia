using System.Runtime.CompilerServices;
using System.Text.Json;

namespace lab2_json_csharp;
class SerializeJson
{
    public static void Run(List<DepartmentEntry> deserializedData, string destinationPath)
    {
        Console.WriteLine("Serializing data to JSON...");

        List<Dictionary<string, object>> list = [];

        foreach (var dep in deserializedData)
        {
            list.Add(new Dictionary<string, object>
            {
                ["Kod_TERYT"] = dep.KodTeryt,
                ["Województwo"] = dep.Wojewodztwo,
                ["Powiat"] = dep.Powiat,
                ["typ_JST"] = dep.TypJst,
                ["nazwa_urzędu_JST"] = dep.NazwaUrzeduJst,
                ["miejscowość"] = dep.Miejscowosc,
                ["telefon_z_numerem_kierunkowym"] = $"{dep.TelefonKierunkowy} {dep.Telefon}"
            });
        }

        var jsontemp = new { departments = list };

        JsonSerializerOptions jsonSerializerOptions = new()
        {
            Encoder = System.Text.Encodings.Web.JavaScriptEncoder.UnsafeRelaxedJsonEscaping,
            WriteIndented = true
        };
        JsonSerializerOptions jso = jsonSerializerOptions;

        var jsonstring = JsonSerializer.Serialize(jsontemp, jso);

        File.WriteAllText(destinationPath, jsonstring);

        Console.WriteLine("Done.");
    }
}
