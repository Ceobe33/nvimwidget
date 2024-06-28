import numpy as np 
import torch
import matplotlib.pyplot as plt
from torch.utils import data
from d2l import torch as d2l

true_w = torch.tensor([2, -3.4])
true_b = 4.2
# features, labels = d2l.synthetic_data(true_w, true_b, 1000)
# print(features, labels)

# 代码用于生成 合成数据集
def synthetic_data(w, b, num_examples):
    # generate y=Xw+b+bias
    #@ torch.normal(mean, std, *, generator=None, out=None)-> Tensor
    X = torch.normal(0, 1, (num_examples, len(w)))
    #@ torch.matmul(input, other, *, out=None)-> Tensor
    y = torch.matmul(X, w) + b
    y += torch.normal(0, 0.01, y.shape)
    return X, y.reshape((-1, 1))

features, labels = d2l.synthetic_data(true_w, true_b, 1000)
# 注意，features 每一行都包含一个二维数据样本，labels 中每一行都包含一维标签值（一个标量）
print('features:', features[0], '\nlabel:', labels[0])

# 生成第二特征 features[:, 1] 和 labels 散点图
d2l.set_figsize()
plt.figure()
#@ features[:, (1)].detach().numpy(), 提取features二维张量中的第2列（索引是1）数据，转化为numpy数组. detach()用于用于从计算图中分离出这个张量，以便在可视化时使用
d2l.plt.scatter(features[:, (1)].detach().numpy(), labels.detach().numpy(), 1)
plt.show()


import random

def data_iter(batch_size, features, labels):
    num_examples = len(features)
    indices = list(range(num_examples))
    # 打乱顺序
    random.shuffle(indices)
    for i in range(0, num_examples, batch_size):
        batch_indices = torch.tensor(
            indices[i: min(i + batch_size, num_examples)])
        yield features[batch_indices], labels[batch_indices]


batch_size = 10

# for X, y in data_iter(batch_size, features, labels):
#     print(X, '\n', y)
#     break

# 初始化模型参数
w = torch.normal(0, 0.01, size=(2, 1), requires_grad=True)
b = torch.zeros(1, requires_grad=True)

print('torch.normal size=(2, 1):', w)
def linreg(X, w, b):
    # 线性回归模型
    return torch.matmul(X, w) + b

# 定义损失函数
def squared_loss(y_hat, y):
    # 均方损失
    return (y_hat - y.reshape(y_hat.shape)) ** 2 / 2

# 定义优化算法
def sgd(params, lr, batch_size):
    with torch.no_grad():
        for param in params:
            param -= lr * param.grad / batch_size
            param.grad.zero_()

# training
# 学习率
lr = 0.01
# 迭代周期个数
num_epochs = 13
net = linreg
loss = squared_loss

for epoch in range(num_epochs):
    for X, y in data_iter(batch_size, features, labels):
        # X, y 的小批量损失
        l = loss(net(X, w, b), y)
        # 因为 l 形状是 (batch_size, 1) 而不是一个标量
        # l 中所有元素加到一起，并以此计算关于 [w, b] 的梯度
        l.sum().backward()
        # 使用参数的梯度更新参数
        sgd([w, b], lr, batch_size)
    with torch.no_grad():
        train_l = loss(net(features, w, b), labels)
    print(f'epoch {epoch + 1}, loss {float(train_l.mean()):f}')


print(f'w 的估计误差: { true_w - w.reshape(true_w.shape)}')
print(f'b 的估计误差: { true_b - b}')
