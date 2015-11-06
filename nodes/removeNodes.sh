#!/bin/bash
source config.sh

### data imported from config.sh
cookie=$cookie
slice_id=$slice_id

data2=''
while [[ $# > 0 ]]
do
    data2="$data2"$'------WebKitFormBoundaryjtuco1d5HBMH0Bzf\nContent-Disposition: form-data; name="node_ids[]"\n\n'"$1"$'\n'
    shift
done

data1=$'------WebKitFormBoundaryjtuco1d5HBMH0Bzf\nContent-Disposition: form-data; name="slice_id"\n\n'"$slice_id"$'\n'
data3=$'------WebKitFormBoundaryjtuco1d5HBMH0Bzf\nContent-Disposition: form-data; name="remove-nodes-from-slice"\n\nRemove selected\n------WebKitFormBoundaryjtuco1d5HBMH0Bzf--\n'
data="$data1$data2$data3"

contentType='Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryjtuco1d5HBMH0Bzf'
wget -qO- --header="$contentType" --header="$cookie" 'https://www.planet-lab.eu/db/common/actions.php' --post-data="$data" > /dev/null

echo 'remove action completed'
