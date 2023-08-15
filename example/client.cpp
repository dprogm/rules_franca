#include "v1/org/example/HelloWorldProxy.hpp"
#include "CommonAPI/Runtime.hpp"
#include <iostream>
int main(int, char**) {
  auto runtime = CommonAPI::Runtime::get();
  auto proxy = runtime->buildProxy<v1::org::example::HelloWorldProxy>("local", "test");
  if(proxy)
    proxy->isAvailableBlocking();
  return 0;
}