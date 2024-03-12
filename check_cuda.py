import torch

# 打印PyTorch版本
print(f"PyTorch Version: {torch.__version__}")

# 检查CUDA是否可用
cuda_available = torch.cuda.is_available()
print(f"CUDA Available: {cuda_available}")

if cuda_available:
    # 打印CUDA版本
    print(f"CUDA Version: {torch.version.cuda}")

    # 打印可用GPU数量
    print(f"Number of GPUs: {torch.cuda.device_count()}")

    # 打印每个GPU的名称
    for i in range(torch.cuda.device_count()):
        print(f"GPU {i}: {torch.cuda.get_device_name(i)}")
else:
    print("CUDA is not available. Check your installation.")



