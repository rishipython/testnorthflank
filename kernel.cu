#include <iostream>

// CUDA kernel that runs on the GPU
__global__ void helloCUDA() {
    printf("Hello from CUDA kernel! Block: %d, Thread: %d\n", blockIdx.x, threadIdx.x);
}

int main() {
    // Launch CUDA kernel with 1 block and 10 threads
    helloCUDA<<<1, 10>>>();

    // Wait for GPU to finish before accessing stdout
    cudaDeviceSynchronize();

    std::cout << "CUDA Kernel Execution Complete!" << std::endl;
    return 0;
}
