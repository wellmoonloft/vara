# Vara
![](https://img.shields.io/badge/Toolkit-Flutter-blue.svg)  ![](https://img.shields.io/badge/Language-Dart-orange.svg)  ![](https://img.shields.io/apm/l/vim-mode)  ![](https://img.shields.io/badge/Process-Developing-blueviolet.svg)

 个人资产管理APP

 🇨🇳简体中文 | 🇺🇸[English](https://github.com/wellmoonloft/vara)

## 简介

**Vara** 【爱沙尼亚语】，意思是资产，是使用**flutter**开发的个人资产管理APP。

因为Covid-19的原因，今年人们都非常重视“睡后收入”，因此对于个人资产的管理和增值需求有了突飞猛进的增长。而我个人也有“在过去是不重视的、非常少的”资金，希望通过一个手机APP来进行查阅资金、投资，和记账。

由于使用过市面上大部分主流的记账APP，但是记账这种事情，让程序员来用简直就是难受至极，都0202年了还要手动记账。此外最大的问题，就是需要登陆！需要登陆就会涉及资料上传，这可是资金管理软件啊，虽然我的口袋单薄，但这也是不能忍受的。

因此我需要一个这样的APP：
1. 能够自动记录投资、生活消费（至少支持EXCEL导入）
2. 不需要创建用户，完全本地化（可以拥有网络请求，但只允许get，用于接收汇率和账单）
3. 支持多币种，同时可以根据指定货币根据汇率汇总
4. 支持投资列表和日常消费列表，并且拥有多个报表用于查阅，每天喝咖啡的时候打开APP看看自己的收益率，以及什么时候才能实现最基本的财务自由（不工作也饿不死）
5. 最好能够自己写导入脚本，毕竟投资渠道那么多，日常消费的支付渠道也很多，每次都要更新APP似乎也是不太可能的事情

有了这五个需求，我决定自己撸一个APP给自己用。

![](https://gitee.com/wellmoonloft/images/raw/master/20200811223018.png)

------------------------------

## 快速开始

1. Clone 项目

2. 在项目目录中执行 `flutter create . `

3. 在项目目录中执行 `flutter packages get`


## 参考
- [Best-Flutter-UI-Templates](https://github.com/mitesh77/Best-Flutter-UI-Templates) 引用了Best-Flutter-UI-Templates的一些组件。

## 依赖

- [font_awesome_flutter: ^8.8.1](https://pub.dev/packages/font_awesome_flutter) Font Awesome Icon 的字体图标包，可以用于flutter的图标。
- [intl: ^0.16.1](https://pub.dev/packages/intl) 提供国际化和本地化功能，包括消息翻译，复数形式和性别，日期/数字格式和解析以及双向文本。
- [charts_flutter: ^0.9.0](https://pub.dev/packages/charts_flutter) 用Dart原生编写的Material Design数据可视化库。
- [sqflite: ^1.3.1](https://pub.dev/packages/sqflite) SQLite用于flutter的插件。
- [path: ^1.7.0](https://pub.dev/packages/path) 适用于Dart的全面的跨平台路径处理库。
- [path_provider: ^1.6.11](https://pub.dev/packages/path_provider) Flutter插件，用于查找文件系统上的常用位置。
- [file_picker: ^1.13.2](https://pub.dev/packages/file_picker) 用于本机文件浏览器来选择单个或多个绝对文件路径，并具有扩展名过滤支持。
- [excel: ^1.1.4](https://pub.dev/packages/excel) 用于创建和更新XLSX文件的excel-sheets的Flutter Dart库。
- [provider: ^4.3.2](https://pub.dev/packages/provider) InheritedWidget的包装 ，使它们更易于使用和可重复使用。

## 进度

目前还未完成，上传到git只是因为我办公室和家里面有两台电脑，嗯。

![](https://gitee.com/wellmoonloft/images/raw/master/20200908175957.jpg)
![](https://gitee.com/wellmoonloft/images/raw/master/20200818220058.jpg)

## Todo List 

### 页面  
 
- [x] 资产页面  
  - [x] 概览信息：净资产、资产、负债、资产负债率（负债/资产）
  - [x] 报表展示：添加净资产、资产、负债折线

- [x] 投资页面   
  - [x] 概览信息：投资收益、正在投资总额、短期投资额、中期投资额、长期投资额、总收益率（）
  - [x] 动态列表：完成投资的列表 
  - [x] 动态列表：添加投资详情  | 差时间选择判断    
  - [x] 动态列表：表头选项联动  
  - [x] 报表展示：逾期投资风险散点分布图   

- [x] 交易页面   
  - [x] 概览信息：净收入、收入、支出、流动性比率（流动资金+短期投资/支出）
  - [x] 动态列表：消费和收入的列表    
  - [x] 动态列表：表头选项联动 
         
- [x] 我的页面  
  - [x] 投资账户、流动账户、财富自由度（投资性收入/支出）  
  - [ ] 设置：账户信息选项
  - [x] 设置：多货币选项：人民币、港币、日元、美元、欧元、英镑、澳元、加元、新加坡元、新西兰元（还需要存进数据库）
  - [x] 设置：多语言选项：简体中文、繁体中文、日文、英文、爱沙尼亚文（还需要存进数据库）
  - [ ] 设置：帮助选项：财务自由度、流动性比例、负债率、投资收益率

- [x] 插入及导入页面
  - [x] 投资数据导入：导入时可选择表头对应导入数据
  - [ ] 交易数据导入：导入时可选择表头对应导入数据
  - [x] 手动添加（投资、支出、账户余额？资产） 

### 基础  
- [x] 数据库：SQLite
- [ ] 本地存储、云存储（iCloud、GooGle Driver）+ （还没对选择路径进行变更，目前不能用）
- [ ] 整体样式-v1、v2
- [ ] 数据采集：目前只支持导入，非常非常不满意

### Widget  
- [x] 自定义日期弹窗(時間選擇器)
- [ ] 自定义下拉菜单

### 数据库表结构

**1.投资表**

|   字段名  | 字段类型 |
|   :----: | :----:  |
|    id    | INTEGER |
|    code  |  INTEGER   |
| date |  TEXT   |
|    amount   |  INTEGER   |
| country |  TEXT   |
|  originator  | TEXT |
|  brand    | TEXT |
| currency |  TEXT   |
|  term  | INTEGER |
|  type    | TEXT |

**2.投资细节表**

|   字段名  | 字段类型 |
|   :----: | :----:  |
|    id    | INTEGER |
|    invest code  |  INTEGER   |
| number |  INTEGER   |
|    days   |  INTEGER   |
| per-payment date |  TEXT   |
|  final-payment date  | TEXT |
|  rate    | INTEGER |
| status |  TEXT   |
|  received  | INTEGER |
|  interest    | INTEGER |


**3.交易表**

|   字段名  | 字段类型 |
|   :----: | :----:  |
|    id    | INTEGER |
|    date  |  TEXT   |
| currency |  TEXT   |
|    use   |  TEXT   |
| categroy |  TEXT   |
|  amount  | INTEGER |
|  mark    | INTEGER |

**4.资产表**

|   字段名  | 字段类型 |
|   :----: | :----:  |
|    id    | INTEGER |
|    date  |  TEXT   |
| currency |  TEXT   |
|  asset  | INTEGER |
|  debt    | INTEGER |

**5.用户表**

|   字段名  | 字段类型 |
|   :----: | :----:  |
|    id    | INTEGER |
|    firstname  |  TEXT   |
| midname |  TEXT   |
|    lastname   |  TEXT   |
|  age  | INTEGER |
|  sex    | INTEGER |


**6.设置表**

|   字段名  | 字段类型 |
|   :----: | :----:  |
|    id    | INTEGER |
|    currency  |  TEXT   |
| language |  TEXT   |
