#include <exception>
#include <iostream>
#include <ostream>
#include <stdexcept>
#include <string>

class FileOpenException : public std::runtime_error {
    public:
    explicit FileOpenException(const std::string& message) : std::runtime_error(message) {}
};

class SumMatchException : public std::runtime_error {
    public:
    explicit SumMatchException(const std::string& message) : std::runtime_error(message) {}
};

void oczko() {
    int tmp;
    int suma = 0;
    while (true) {
        std::cout << "Podaj liczbe: ";

        try {
            std::cin >> tmp;

            if (!std::cin) {
                std::cin.clear();
                std::cin.ignore();
                throw std::exception();
            }
            suma += tmp;
            std::cout << "Suma: " << suma << std::endl;
            if (suma > 21) {
                throw std::exception();
            } else if (suma == 21) {
                throw SumMatchException("Udalo sie osiagnac oczko!");
            } else {
                throw std::underflow_error("Suma ponizej 21");
            }
        }
        catch (const std::underflow_error& e) {
            std::cerr << e.what() << std::endl;
        }
        catch (const SumMatchException& e) {
            std::cerr << e.what() << std::endl;
            return;
        }
        catch (const std::exception& e) {
            std::cerr << e.what() << std::endl;
            suma = 0;
        }
    }
}

int main() {
    oczko();

    return 0;
}
