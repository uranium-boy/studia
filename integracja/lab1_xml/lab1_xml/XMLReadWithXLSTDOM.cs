
using System.Xml;
using System.Xml.XPath;

namespace lab1_xml
{
    internal class XMLReadWithXLSTDOM
    {
        internal static void Read(string xmlpath)
        {
            XPathDocument document = new XPathDocument(xmlpath);
            XPathNavigator navigator = document.CreateNavigator();

            XmlNamespaceManager manager = new XmlNamespaceManager(navigator.NameTable);
            manager.AddNamespace("x", "http://rejestrymedyczne.ezdrowie.gov.pl/rpl/eksport-danych-v1.0");

            XPathExpression query = navigator.Compile("/x:produktyLecznicze/x:produktLeczniczy[@postac='Krem' and @nazwaPowszechnieStosowana='Mometasoni furoas']");
            query.SetContext(manager);

            int count = navigator.Select(query).Count;

            Console.WriteLine("Liczba produktów leczniczych, w postaci kremu, których jedyną substancją czynną jest Mometasoni furoas: {0}", count);

            query = navigator.Compile("/x:produktyLecznicze/x:produktLeczniczy");
            query.SetContext(manager);
            XPathNodeIterator nodeIter = navigator.Select(query);
            var commonNameDict = new Dictionary<String, HashSet<string>>();
            var creamDict = new Dictionary<String, int>();
            var pillDict = new Dictionary<string, int>();

            while (nodeIter.MoveNext())
            {
                string form = nodeIter.Current.GetAttribute("postac", "");
                string commonName = nodeIter.Current.GetAttribute("nazwaPowszechnieStosowana", "");
                string entity = nodeIter.Current.GetAttribute("podmiotOdpowiedzialny", "");

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