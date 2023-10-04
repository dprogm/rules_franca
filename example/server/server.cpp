#include <iostream>
#include <thread>
#include <CommonAPI/CommonAPI.hpp>
#include <v1/org/example/HelloWorldStubDefault.hpp>

class HelloWorldStubImpl: public v1::org::example::HelloWorldStubDefault {

public:
    HelloWorldStubImpl() = default;
    virtual ~HelloWorldStubImpl() = default;

    virtual void request(const std::shared_ptr<CommonAPI::ClientId> client, const v1::org::example::CommonTypes::Message & msg, requestReply_t reply)
    {
      std::cout << "Got request from client: " << msg.getContent() << std::endl;
      v1::org::example::CommonTypes::Message ret;
      reply(ret);
    }
};

int main() {
  auto runtime = CommonAPI::Runtime::get();
  auto service = std::make_shared<HelloWorldStubImpl>();
  bool successfullyRegistered = runtime->registerService("local", "test", service);

  while (!successfullyRegistered) {
    std::cout << "Register Service failed, trying again in 100 milliseconds..." << std::endl;
    std::this_thread::sleep_for(std::chrono::milliseconds(100));
    successfullyRegistered = runtime->registerService("local", "test", service);
  }
  std::cout << "Successfully Registered Service!" << std::endl;

  while (true) {
    std::cout << "Waiting for calls... (Abort with CTRL+C)" << std::endl;
    std::this_thread::sleep_for(std::chrono::seconds(60));
  }
  return 0;
}