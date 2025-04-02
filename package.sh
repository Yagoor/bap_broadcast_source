wget https://files.nordicsemi.com/artifactory/swtools/external/nrfutil/executables/x86_64-unknown-linux-gnu/nrfutil
chmod +x nrfutil
./nrfutil install nrf5sdk-tools
find . -name '*.hex' | while read line; do
    name=$(basename $(dirname $(dirname $line)) | tr . _)
    folder=$(dirname $line)
    ./nrfutil nrf5sdk-tools pkg generate \
         --hw-version 52 \
         --sd-req=0x00 \
         --application $line \
         --application-version 1 \
         $folder/$name.zip
done
rm nrfutil