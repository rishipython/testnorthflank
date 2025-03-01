# Use NVIDIA CUDA base image (runtime includes necessary libraries)
FROM nvidia/cuda:12.2.0-devel-ubuntu20.04

# Set the working directory inside the container
WORKDIR /app

# Install required dependencies
RUN apt-get update && apt-get install -y build-essential && rm -rf /var/lib/apt/lists/*

# Copy the CUDA source file into the container
COPY kernel.cu .

# Compile the CUDA program
RUN nvcc -arch=sm_90 -o kernel kernel.cu

# Run the compiled CUDA program when the container starts
CMD ["./kernel"]
