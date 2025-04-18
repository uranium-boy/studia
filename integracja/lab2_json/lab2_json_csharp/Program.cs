using lab2_json_csharp;
using YamlDotNet.Serialization;

string yamlString = File.ReadAllText(Path.Combine("Assets", "basic_config.yaml"));
var yamlDeserializer = new DeserializerBuilder().Build();

try
{
    Config config = yamlDeserializer.Deserialize<Config>(yamlString);
    List<DepartmentEntry>? deserializedData = null;

    foreach (var job in config.Jobs)
    {
        switch (job.Name)
        {
            case JobName.deserialize:
                switch (job.Format)
                {
                    case Format.Json:
                        deserializedData = DeserializeJson.GetDeserializedJson(Path.Combine(config.Paths.SourceFolder, config.Paths.JsonSourceFile));
                        break;
                    case Format.Xml:
                        deserializedData = DeserializeXml.GetDeserializedXml(Path.Combine(config.Paths.SourceFolder, config.Paths.XmlSourceFile));
                        break;
                    case Format.Yaml:
                        Console.WriteLine("Yaml files cannot be deserialized");
                        break;
                }
                break;
            case JobName.Somestats:
                if (deserializedData is null)
                {
                    Console.WriteLine("No data has been read before making stats, continuing...");
                    continue;
                }
                else
                {
                    SomeStats.Somestats(deserializedData);
                }
                break;
            case JobName.Serialize:
                if (deserializedData is null)
                {
                    Console.WriteLine("No data has been read before serialization, continuing...");
                    continue;
                }
                switch (job.Source)
                {
                    case Source.Object:
                        switch (job.Format)
                        {
                            case Format.Json:
                                SerializeJson.Run(deserializedData, Path.Combine(config.Paths.SourceFolder, config.Paths.JsonDestinationFile));
                                break;
                            case Format.Xml:
                                SerializeXml.Run(deserializedData, Path.Combine(config.Paths.SourceFolder, config.Paths.XmlDestinationFile));
                                break;
                            case Format.Yaml:
                                SerializeYaml.Run(deserializedData, Path.Combine(config.Paths.SourceFolder, config.Paths.YamlDestinationFile));
                                break;
                        }
                        break;
                    case Source.File:
                        // można serializować tylko z json
                        switch (job.Format)
                        {
                            case Format.Json:
                                Console.WriteLine("Serialize from Json to Json?");
                                break;
                            case Format.Xml:
                                SerializeXml.Run(Path.Combine(config.Paths.SourceFolder ,config.Paths.JsonSourceFile), Path.Combine(config.Paths.SourceFolder, config.Paths.XmlDestinationFile));
                                break;
                            case Format.Yaml:
                                SerializeYaml.Run(Path.Combine(config.Paths.SourceFolder, config.Paths.JsonSourceFile), Path.Combine(config.Paths.SourceFolder, config.Paths.YamlDestinationFile));
                                break;
                        }
                        break;
                }
                break;
        }
    }
    Console.ReadLine();
}
catch (Exception e)
{
    Console.WriteLine(e.Message);
}
