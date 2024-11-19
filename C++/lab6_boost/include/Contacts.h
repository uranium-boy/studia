#include "Contact.h"
#include <boost/multi_index/indexed_by.hpp>
#include <boost/multi_index_container.hpp>
#include <boost/multi_index/hashed_index.hpp>
#include <boost/multi_index/member.hpp>
#include <string>

using namespace boost::multi_index;

typedef multi_index_container<
    Contact, 
    indexed_by<
        hashed_unique<member<Contact, std::string, &Contact::number>>,
        hashed_non_unique<member<Contact, std::string, &Contact::firstName>>,
        hashed_non_unique<member<Contact, std::string, &Contact::lastName>>,
        hashed_non_unique<member<Contact, std::string, &Contact::street>>,
        hashed_non_unique<member<Contact, int, &Contact::age>>
    >
> Contact_multi_index;

class Contacts {
private:
    Contact_multi_index contactList;

public:
    Contacts();
    void addContact(const Contact& contact);
    void showAll();
};
