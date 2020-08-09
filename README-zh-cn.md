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


![](https://gitee.com/wellmoonloft/images/raw/master/20200729235557.png)


------------------------------

## 快速开始

1. Clone 项目

2. 在项目目录中执行 `flutter create . `

3. 在项目目录中执行 `flutter packages get`


## 依赖

- [charts_flutter: ^0.9.0](https://pub.dev/packages/charts_flutter) 用Dart原生编写的Material Design数据可视化库。
- [font_awesome_flutter: ^8.8.1](https://pub.dev/packages/font_awesome_flutter) Font Awesome Icon 的字体图标包，可以用于flutter的图标。
- [intl: ^0.16.1](https://pub.dev/packages/intl) 提供国际化和本地化功能，包括消息翻译，复数形式和性别，日期/数字格式和解析以及双向文本。
- [sqflite: ^1.3.1](https://pub.dev/packages/sqflite) SQLite用于flutter的插件。
- [path: ^1.7.0](https://pub.dev/packages/path) 适用于Dart的全面的跨平台路径处理库。
- [path_provider: ^1.6.11](https://pub.dev/packages/path_provider) Flutter插件，用于查找文件系统上的常用位置。
- [file_picker: ^1.13.2](https://pub.dev/packages/file_picker) 用于本机文件浏览器来选择单个或多个绝对文件路径，并具有扩展名过滤支持。
- [excel: ^1.1.4](https://pub.dev/packages/excel) 用于创建和更新XLSX文件的excel-sheets的Flutter Dart库。
- [flutter_swiper: ^1.1.6](https://pub.dev/packages/flutter_swiper) flutter最强大的siwiper, 多种布局方式，无限轮播，Android和IOS双端适配。
- [http: ^0.12.2](https://pub.dev/packages/http) 一个可组合的，基于Future的库，用于发出HTTP请求。
- [provider: ^4.3.2](https://pub.dev/packages/provider) InheritedWidget的包装 ，使它们更易于使用和可重复使用。

## 进度

目前还未完成，上传到git只是因为我办公室和家里面有两台电脑，嗯。
![](https://gitee.com/wellmoonloft/images/raw/master/20200809224602.jpg)
![](https://gitee.com/wellmoonloft/images/raw/master/20200809224409.png)

## Todo List 

### 页面  

- [x] 头部信息：日期及比特币、美元、欧元汇率折线图  
- [x] 资产页面  
  - [ ] 报表展示：添加负债折线
- [x] 投资页面  
  - [x] 数据导入：导入时可选择表头对应导入数据
  - [ ] 数据导入：数据校验   
  - [ ] 数据导入：添加刷新资产和负债数据库 
  - [ ] 动态列表：完成投资的列表    
  - [ ] 动态列表：表头选项联动   
- [x] 账单页面  
  - [ ] 数据导入：导入时可选择表头对应导入数据
  - [ ] 数据导入：添加刷新资产和负债数据库 
  - [ ] 动态列表：消费和收入的列表    
  - [ ] 动态列表：表头选项联动      

### 基础  
- [x] 数据库
- [ ] 多语言
- [x] 引入provider，让数据调用变得更加灵活


