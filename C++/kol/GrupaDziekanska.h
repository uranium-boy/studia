#include <map>
#include <set>
#include <string>

class GrupaDziekanska {
private:
    std::map<std::string, std::set<std::string>> grupa;
public:
    void wyswietlGrupe();
    void findKlucz(const std::string& key);
    void szukajWartosc(const std::string& value);
    void insert(const std::pair<std::string, std::set<std::string>>& value);
};
