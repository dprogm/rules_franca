#include "v1/org/example/HelloWorldProxy.hpp"
#include "CommonAPI/Runtime.hpp"
#include <iostream>
int main(int, char**) {
  auto runtime = CommonAPI::Runtime::get();
  auto proxy = runtime->buildProxy<v1::org::example::HelloWorldProxy>("local", "test");
  proxy = runtime->buildProxy<v1::org::example::HelloWorldProxy>("local", "test");
  if(proxy) {
    proxy->isAvailableBlocking();
    std::cout << "service is available" << std::endl;
    v1::org::example::CommonTypes::Message msg;
    msg.setContent("Hello");
    CommonAPI::CallStatus stat;
    proxy->request(msg, stat, msg);
  }
  return 0;
}