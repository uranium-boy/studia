using System.Diagnostics;
using System.Text.Json;
using YamlDotNet.Serialization;

namespace lab2_json_csharp;
class SerializeYaml
{
    public static void Run(List<DepartmentEntry> deserializedData, string destinationPath)
    {
        Console.WriteLine("Converting deserialized object to Yaml...");

        var serializer = new SerializerBuilder()
            .Build();
        var yamlstring = serializer.Serialize(deserializedData);

        File.WriteAllText(destinationPath, yamlstring);

        Console.WriteLine("Done.");
    }

    public static void Run(string sourcePath, string destinationPath)
    {
        Console.WriteLine("Converting Json file to Yaml...");

        string jsonString = File.ReadAllText(sourcePath);
        var data = JsonSerializer.Deserialize<List<DepartmentEntry>>(jsonString) ?? throw new Exception();

        File.WriteAllText(destinationPath, new SerializerBuilder().Build().Serialize(data));

        Console.WriteLine("Done.");
    }
}
