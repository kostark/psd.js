# guide

### env problems

- 只能使用1.x 版本，2编译不过
- 调试使用 source map，源代码使用的 1.7.1 的 source map 有行偏移情况， 升级到 1.12 后问题修复
- 编译脚本为 `coffee --inline-map --compile ./lib`  
- npm 脚本中包含了 linux 特定指定，但是并不意味这 windows 下不可以开发，不使用即可。
