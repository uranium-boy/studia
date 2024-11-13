#include <algorithm>
#include <iomanip>
#include <iostream>
#include <utility>
#include <vector>
#include <set>

std::pair<int, int> findDuplicate(std::vector<int> numbers);

template <typename T>
void symmetricDifference(std::set<T> set1, std::set<T> set2);

int main() {
    std::vector<int> vec;

    for (int i = 0; i <= 10; i++) {
        vec.push_back(i);
    }

    vec.push_back(10);
    
    std::pair<int, int> dup = findDuplicate(vec);
    std::cout << "Suma wartosci unikatowych: " << dup.first << std::endl << "Wartosc zduplikowana: " << dup.second << std::endl;

    return 0;
}

std::pair<int, int> findDuplicate(std::vector<int> numbers) {
    std::set<int> helperSet;
    int sum = 0;
    int duplicate;

    for (int num : numbers) {
        if (helperSet.insert(num).second == true) {
            sum += num;
        } else {
            duplicate = num;
            sum -= num;
        }
    }
    return std::pair(sum, duplicate);
}

template <typename T>
void symmetric_difference(std::set<T> set1, std::set<T> set2) {
    std::set difference = std::set_symmetric_difference(set1, set2);
    int sum = 0;

    for (T el : difference) {
        sum += el;
    }

    std::cout << "Suma elementow: " << sum << std::endl;
}
