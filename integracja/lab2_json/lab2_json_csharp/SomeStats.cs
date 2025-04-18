namespace lab2_json_csharp;
class SomeStats
{
    public static void Somestats(List<DepartmentEntry> deserializedData)
    {
        int examplestat = 0;

        foreach (var dep in deserializedData)
        {
            if (dep.TypJst == "GM" && dep.Wojewodztwo == "dolnośląskie")
            {
                examplestat++;
            }
        }

        Console.WriteLine("Liczba urzędów miejskich w województwie dolnośląskim: {0}", examplestat);

        Dictionary<string, Dictionary<string, int>> wojewodztwa = deserializedData
                .GroupBy(dep => dep.Wojewodztwo.Trim())
                .ToDictionary(
                    g => g.Key,
                    g => g.GroupBy(dep => dep.TypJst)
                    .OrderBy(urz => urz.Key)
                    .ToDictionary(
                        urz => urz.Key,
                        urz => urz.Count()
                     )
                );

        foreach (var (woj, urzedy) in wojewodztwa)
        {
            Console.WriteLine("Województwo: " + woj);

            foreach (var urz in urzedy)
            {
                Console.WriteLine("\t{0}: {1}", urz.Key, urz.Value);
            }
        }
    }
}
