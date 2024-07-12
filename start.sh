#!/bin/bash
# Set NUMA node for all PCI devices to 0
echo "Setting NUMA node to 0 for all PCI devices..."
for a in /sys/bus/pci/devices/*; do
    echo 0 | sudo tee $a/numa_node > /dev/null
done
echo "Starting TensorFlow Jupyter Notebook..."
docker run -d \
  --name tf \
  --gpus all \
  -v $(pwd):/tf \
  -e TF_ENABLE_ONEDNN_OPTS=0 \
  --device=/dev/video0:/dev/video0 \
  --device=/dev/video1:/dev/video1 \
  tensorflow/tensorflow:2.13.0-gpu