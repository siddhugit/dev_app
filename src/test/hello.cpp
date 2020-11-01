#include<iostream>
#include <iostream>
#include <fstream>
#include <string>
#include <google/protobuf/util/json_util.h>
#include <ctime>
#include <ratio>
#include <chrono>
#include "add.h"
#include "addressbook.pb.h"
#include "SearchRequest.pb.h"
using namespace std;

// This function fills in a Person message based on user input.
void PromptForAddress(tutorial::Person* person) {
    person->set_id(24);
    *person->mutable_name() = "siddharth";
    person->set_email("sid@xyz.com");
    tutorial::Person::PhoneNumber* phone_number = person->add_phones();
    phone_number->set_number("123-456-7890");
    phone_number->set_type(tutorial::Person::MOBILE);
}

void PrintPerson(tutorial::Person* person) {
    std::cout<<"id = "<<person->id()<<"\n";
    std::cout<<"name = "<<person->name()<<"\n";
    std::cout<<"email = "<<person->email()<<"\n";
    for(auto num : person->phones())
    {
        std::cout<<"phone = "<<num.number()<<"\n";
    }
}

// Main function:  Reads the entire address book from a file,
//   adds one person based on user input, then writes it back out to the same
//   file.
int main(int argc, char* argv[]) 
{
    std::cout << add(5, 3) << std::endl;
   std::cout << "Test Hello World!" << std::endl;
   
    tutorial::Person person;
    PromptForAddress(&person);

    google::protobuf::util::JsonPrintOptions options;
    options.add_whitespace = true;
    //options.always_print_primitive_fields = true;
    //options.preserve_proto_field_names = true;

    std::string json_string;

    using namespace std::chrono;
    steady_clock::time_point t1 = steady_clock::now();
    
    MessageToJsonString(person, &json_string, options);
    
    steady_clock::time_point t2 = steady_clock::now();
    auto int_millis = std::chrono::duration_cast<std::chrono::milliseconds>(t2 - t1);
    auto int_micros = std::chrono::duration_cast<std::chrono::microseconds>(t2 - t1);

    std::cout << json_string << std::endl;
    std::cout << "It took me " << static_cast<long long int>(int_millis.count())<< " milliseconds.\n";
    std::cout << "It took me " << static_cast<long long int>(int_micros.count())<< " microseconds.\n";
    
    tutorial::Person pout;
    google::protobuf::util::JsonParseOptions opts;
    JsonStringToMessage(json_string,&pout,opts);
    PrintPerson(&pout);
    
    SearchRequest sr;
    *sr.mutable_query() = "dadsdasdas";
    sr.set_page_number(12);
    sr.set_result_per_page(3);
    json_string.clear();
    MessageToJsonString(sr, &json_string, options);
    std::cout << "\n\n"<<json_string << std::endl;
    
	return 0;
}

