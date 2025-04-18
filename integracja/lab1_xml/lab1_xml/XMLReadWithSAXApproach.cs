using System.Xml;

namespace lab1_xml
{
    internal class XMLReadWithSAXApproach
    {
        internal static void Read(string filepath)
        {
            XmlReaderSettings settings = new XmlReaderSettings();
            settings.IgnoreComments = true;
            settings.IgnoreProcessingInstructions = true;
            settings.IgnoreWhitespace = true;

            XmlReader reader = XmlReader.Create(filepath, settings);

            int count = 0;
            string form = "";
            string commonName = "";
            string entity = "";

            var commonNameDict = new Dictionary<string, HashSet<string>>();
            var creamDict = new Dictionary<string, int>();
            var pillDict = new Dictionary<string, int>();

            reader.MoveToContent();

            while (reader.Read())
            {
                if (reader.NodeType == XmlNodeType.Element && reader.Name == "produktLeczniczy")
                {
                    form = reader.GetAttribute("postac");
                    commonName = reader.GetAttribute("nazwaPowszechnieStosowana");
                    entity = reader.GetAttribute("podmiotOdpowiedzialny");
                    if (form == "Krem" && commonName == "Mometasoni furoas")
                        count++;

                    if (commonNameDict.ContainsKey(commonName))
                    {
                        commonNameDict[commonName].Add(form);
                    }
                    else
                    {
                        var temp = new HashSet<string>();
                        temp.Add(form);
                        commonNameDict.Add(commonName, temp);
                    }

                    if (form == "Krem")
                    {
                        if (creamDict.ContainsKey(entity))
                        {
                            creamDict[entity]++;
                        }
                        else
                        {
                            creamDict.Add(entity, 1);
                        }
                    }
                    else if (form == "Tabletki")
                    {
                        if (pillDict.ContainsKey(entity))
                        {
                            pillDict[entity]++;
                        }
                        else
                        {
                            pillDict.Add(entity, 1);
                        }
                    }

                }
            }

            Console.WriteLine("Liczba produktów leczniczych w postaci kremu, których jedyną substancją czynną jest Mometasoni furoas {0}", count);

            count = 0;

            foreach (var el in commonNameDict)
            {
                if (el.Value.Count > 1)
                {
                    count++;
                }
            }

            Console.WriteLine("Liczba produktów leczniczych o tej samej nazwie powszechnej, pod roznymi postaciami {0}", count);

            var maxCreamValue = creamDict.Max(a => a.Value);
            var maxCreamEntities = creamDict
                .Where(a => a.Value == maxCreamValue)
                .Select(a => a.Key);

            Console.Write("Najwięcej kremów produkuje: ");

            foreach (var maxEnity in maxCreamEntities)
            {
                Console.Write(maxEnity + " ");
            }
            Console.WriteLine();

            var maxPillValue = pillDict.Max(a => a.Value);
            var maxPillEntities = pillDict
                .Where(a => a.Value == maxPillValue)
                .Select(a => a.Key);

            Console.Write("Najwiecej tabletek produkuje: ");
            foreach (var maxEntity in maxPillEntities)
            {
                Console.Write(maxEntity + " ");
            }
            Console.WriteLine();

            Console.WriteLine("Trzy podmioty produkujące najwięcej kremów: ");
            var top3cream = creamDict.OrderByDescending(a => a.Value).Take(3);
            foreach (var ent in top3cream)
            {
                Console.WriteLine("{0}\t{1}", ent.Key, ent.Value);
            }

            Console.WriteLine();
        }
    }
}
