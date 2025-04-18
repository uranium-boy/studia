using System.Xml;
using System.Xml.Serialization;

namespace lab2_json_csharp;
class DeserializeXml
{
    public static List<DepartmentEntry> GetDeserializedXml(string filepath)
    {
        Console.WriteLine("Deserializing XML...");

        XmlSerializer xs = new(typeof(List<DepartmentEntry>));
        var deserializedData = (List<DepartmentEntry>)(xs.Deserialize(XmlReader.Create(filepath)) ?? throw new Exception());

        if (deserializedData is null)
        {
            throw new Exception();
        }
        else
        {
            Console.WriteLine("Done.");
            return deserializedData;
        }
    }
}
