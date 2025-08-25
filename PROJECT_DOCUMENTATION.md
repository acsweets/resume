# Flutter 简历项目文档

## 项目概述

这是一个基于 Flutter 开发的个人简历展示应用，支持多语言（中文/英文）、响应式布局和 PDF 导出功能。项目采用现代化的 Flutter 架构，提供优雅的简历展示界面。

**作者**: 星星  
**联系方式**: 1395723441@qq.com  
**版本**: 1.0.0+1

## 技术栈

### 核心框架
- **Flutter**: 跨平台 UI 框架
- **Dart**: 编程语言 (>=3.4.0 <4.0.0)

### 主要依赖
- `flutter_screenutil: ^5.9.0` - 屏幕适配
- `flutter_localizations` - 国际化支持
- `intl: ^0.19.0` - 国际化工具
- `pdf: ^3.8.0` - PDF 生成
- `universal_html: ^2.2.4` - Web HTML 操作
- `url_launcher: ^6.0.3` - URL 启动器

## 项目结构

```
lib/
├── generated/          # 自动生成的国际化文件
│   ├── intl/          # 国际化消息文件
│   └── l10n.dart      # 本地化主文件
├── l10n/              # 国际化资源文件
│   ├── intl_en.arb    # 英文资源
│   └── intl_zh.arb    # 中文资源
├── local/             # 本地化相关
│   ├── language.dart  # 语言配置
│   └── language_provider.dart # 语言提供者
├── model/             # 数据模型
│   ├── load.dart      # 数据加载
│   └── resume.dart    # 简历数据模型
├── resume/            # 简历相关页面
│   ├── home_page.dart # 主页面
│   ├── my_web.dart    # 应用入口
│   └── resume_page.dart # 简历展示页面
├── untils/            # 工具类
│   └── pdf_generator.dart # PDF 生成工具
├── widgets/           # 自定义组件
│   ├── tag.dart       # 标签组件
│   └── toggle_button.dart # 切换按钮
└── main.dart          # 应用入口
```

## 核心功能

### 1. 响应式布局
- **移动端** (< 600px): 全屏显示
- **平板端** (600-1200px): 居中 600px 宽度
- **桌面端** (> 1200px): 弹性布局，简历居中显示

### 2. 多语言支持
- 支持中文和英文切换
- 使用 Flutter 国际化框架
- 动态语言切换，无需重启应用

### 3. PDF 导出
- 将简历页面转换为高质量 PNG 图片
- 生成 PDF 文档并自动下载
- 支持 Web 端直接下载

### 4. 简历内容模块
- **基本信息**: 姓名、年龄、联系方式等
- **专业技能**: 技能列表展示
- **工作经历**: 公司、职位、工作内容
- **项目经历**: 项目名称、技术栈、项目描述
- **教育经历**: 学校、专业、课程
- **自我评价**: 个人评价内容

## 数据模型

### Resume 类
```dart
class Resume {
  InfoBean info;              // 基本信息
  List<EducationBean> education;   // 教育经历
  List<ExperienceBean> experience; // 工作经历
  List<ProjectBean> project;       // 项目经历
  List<String> skills;            // 专业技能
  List<String> evaluate;          // 自我评价
}
```

### 主要数据实体
- **InfoBean**: 个人基本信息（姓名、年龄、邮箱、电话、学历、求职意向）
- **ExperienceBean**: 工作经历（公司名称、职位、时间、工作职责）
- **ProjectBean**: 项目经历（项目名称、时间、技术栈、项目描述）
- **EducationBean**: 教育经历（学校、专业、时间、课程）

## 关键技术实现

### 1. 屏幕适配
使用 `flutter_screenutil` 实现多设备适配：
```dart
ScreenUtilInit(
  designSize: const Size(1920, 1080),
  builder: (_, child) => HomePage()
)
```

### 2. PDF 生成流程
1. 使用 `RepaintBoundary` 包装简历页面
2. 通过 `RenderRepaintBoundary` 捕获页面为图片
3. 将图片转换为 PDF 格式
4. 在 Web 端创建下载链接

### 3. 国际化实现
- 使用 `intl_utils` 自动生成国际化代码
- ARB 文件管理多语言资源
- `LanguageProvider` 管理语言状态

## 部署配置

### GitHub Actions
项目包含自动化部署配置 (`.github/workflows/deploy.yml`)，支持：
- 自动构建 Web 版本
- 部署到 GitHub Pages
- 持续集成/持续部署 (CI/CD)

### Web 配置
- 支持 PWA (Progressive Web App)
- 自定义图标和 manifest 配置
- 优化的 Web 性能

## 开发指南

### 环境要求
- Flutter SDK >= 3.4.0
- Dart SDK >= 3.4.0

### 运行项目
```bash
# 获取依赖
flutter pub get

# 生成国际化文件
flutter pub global run intl_utils:generate

# 运行项目
flutter run -d web  # Web 版本
flutter run         # 移动端版本
```

### 数据配置
简历数据存储在 `assets/data/` 目录：
- `data_zh.json`: 中文简历数据
- `data_en.json`: 英文简历数据

### 自定义简历内容
1. 修改 `assets/data/data_zh.json` 和 `data_en.json` 文件
2. 更新个人头像：替换 `assets/images/avatar.png`
3. 调整样式：修改 `resume_page.dart` 中的 UI 组件

## 特色亮点

1. **现代化设计**: 简洁优雅的 Material Design 风格
2. **跨平台支持**: 一套代码支持 Web、Android、iOS
3. **高度可定制**: 易于修改样式和内容
4. **性能优化**: 响应式布局，适配各种屏幕尺寸
5. **用户友好**: 支持 PDF 导出，便于分享和打印

## 许可证

本项目为个人简历项目，仅供学习和参考使用。

---

*最后更新时间: 2024年*