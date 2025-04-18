using System.Xml;

namespace lab1_xml
{

    internal class XMLReadWithDOMApproach
    {
        internal static void Read(string filepath)
        {
            XmlDocument doc = new XmlDocument();
            doc.Load(filepath);

            string form;
            string commonName;
            int count = 0;
            string entity;

            var commonNameDict = new Dictionary<string, HashSet<string>>();
            var creamDict = new Dictionary<string, int>();
            var pillDict = new Dictionary<string, int>();

            var drugs = doc.GetElementsByTagName("produktLeczniczy");
            foreach (XmlNode d in drugs)
            {
                form = d.Attributes.GetNamedItem("postac").Value;
                commonName = d.Attributes.GetNamedItem("nazwaPowszechnieStosowana").Value;
                entity = d.Attributes.GetNamedItem("podmiotOdpowiedzialny").Value;

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

            Console.Write("Najwiecej kremow produkuje: ");

            foreach (var maxEntity in maxCreamEntities)
            {
                Console.WriteLine(maxEntity + " ");
            }

            var maxPillValue = pillDict.Max(a => a.Value);
            var maxPillEntities = pillDict
                .Where(a => a.Value == maxPillValue)
                .Select(a => a.Key);

            Console.Write("Najwiecej tabletek produkuje: ");
            foreach (var maxEntity in maxPillEntities)
            {
                Console.WriteLine(maxEntity + " ");
            }


            /*            var maxCreamValue = creamDict.Max(a => a.Value);
                        string maxCreamEntity = "";

                        foreach(var a in creamDict)
                        {
                            if (a.Value == maxCreamValue)
                            {
                                maxCreamEntity = a.Key;
                            }
                        }
            */
            /*            var maxPillValue = pillDict.Max(a => a.Value);
                        string maxPillEntity = "";

                        foreach (var a in pillDict)
                        {
                            if (a.Value == maxPillValue)
                            {
                                maxPillEntity = a.Key;
                            }
                        }

            */
            /*            Console.WriteLine("Najwiecej kremow produkuje {0}", maxCreamEntity);
                        Console.WriteLine("Najwiecej tabletek produkuje {0}", maxPillEntity);
            */
            /*            var max = slownikKremy.Max(a->a.Value);

                        foreach (var a in slownikKremy)
                        {

                        }
            */

            Console.WriteLine("Trzy podmioty produkujące najwięcej kremów:");

            var top3cream = creamDict.OrderByDescending(a => a.Value).Take(3);

            foreach (var topEntity in top3cream)
            {
                Console.WriteLine("{0}\t{1}", topEntity.Key, topEntity.Value);
            }

            Console.WriteLine();
        }
    }
}