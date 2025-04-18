using System.Text.Json;
using System.Text.Json.Serialization;

namespace lab2_json_csharp;

class DeserializeJson
{
    public static List<DepartmentEntry> GetDeserializedJson(string filepath)
    {
        Console.WriteLine("Deserializing JSON...");
        string jsonString = File.ReadAllText(filepath);
        var deserializedData = JsonSerializer.Deserialize<List<DepartmentEntry>>(jsonString);
        if (deserializedData is null)
        {
            throw new Exception();
        } else
        {
            Console.WriteLine("Done.");
            return deserializedData;
        }
    }
}
