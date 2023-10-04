export COMMONAPI_CONFIG=$2

export VSOMEIP_APPLICATION_NAME=$6
# The following three parameters should contain
# * The binding library for the proxy or stub
# * The SomeIP cfg shared library (configuration)
# * The SomeIP sd shared library (service discovery)
export LD_LIBRARY_PATH=$(dirname $3):$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$(dirname $4):$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$(dirname $5):$LD_LIBRARY_PATH

./$1
