using System.Diagnostics;
using System.Text;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Serialization;

namespace lab2_json_csharp;
class SerializeXml
{
    public static void ConvertAll(List<DepartmentEntry> deserializedData, string destinationPath)
    {
        Console.WriteLine("Creating XML data file...");
        XmlSerializer serializer = new(typeof(List<DepartmentEntry>));
        XmlWriterSettings settings = new()
        {
            Indent = true,
            Encoding = Encoding.UTF8
        };

        var writer = XmlWriter.Create(destinationPath, settings);

        serializer.Serialize(writer, deserializedData);

        writer.Close();
        Console.WriteLine("Done.");
    }

    public static void Run(List<DepartmentEntry> deserializedData, string destinationPath)
    {
        Console.WriteLine("Converting deserialized object to XML...");
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

        XElement root = new("departments",
            list.Select(dict => new XElement("department",
                dict.Select(kv => new XElement(kv.Key, kv.Value))
            ))
        );

        File.WriteAllText(destinationPath, root.ToString());
        Console.WriteLine("Done.");
    }

    public static void Run(string sourcePath, string destinationPath)
    {
        Console.WriteLine("Converting Json file to XML...");
        List<DepartmentEntry> deserializedData = DeserializeJson.GetDeserializedJson(sourcePath);
        SerializeXml.Run(deserializedData, destinationPath);
    }
}
