### 知识点
1. swift
2. json解析
3. mvvm


### MVVM注意事项
1. ViewModel绝不能包含View，不然会产生藕合，不方便调试和复用
2. Controller不能包含Model
3. ViewModel做业务处理、网络请求、数据处理等操作