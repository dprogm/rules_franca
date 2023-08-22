export COMMONAPI_CONFIG=$2
export LD_LIBRARY_PATH=$(dirname $3):$LD_LIBRARY_PATH
gdb ./$1
