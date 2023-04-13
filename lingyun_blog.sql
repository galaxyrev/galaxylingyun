/*
 Navicat MySQL Data Transfer

 Source Server         : galaxymysql
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : 47.108.228.223:3306
 Source Schema         : lingyun_blog

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 10/04/2023 09:53:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_album
-- ----------------------------
DROP TABLE IF EXISTS `t_album`;
CREATE TABLE `t_album`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '相册id',
  `album_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '相册名',
  `album_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '相册封面',
  `album_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '相册描述',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 (1公开 2私密)',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '相册管理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_album
-- ----------------------------
INSERT INTO `t_album` VALUES (12, '风景图片', 'https://static.galaxylingyun.top/photo/f8b28d639423f5c9853c0933e8416d6b.jpg', '自然风景', 1, '2023-04-08 20:08:07', NULL);
INSERT INTO `t_album` VALUES (13, '动漫壁纸', 'https://static.galaxylingyun.top/photo/44e4e0c1cf8d00d754f05c2e5caccd42.png', '二次元', 1, '2023-04-08 20:10:52', NULL);

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `user_id` int NOT NULL COMMENT '作者id',
  `category_id` int NOT NULL COMMENT '分类id',
  `article_cover` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '缩略图',
  `article_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章标题',
  `article_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章内容',
  `article_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '类型 (1原创 2转载 3翻译)',
  `is_top` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否置顶 (0否 1是）',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除 (0否 1是)',
  `is_recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否推荐 (0否 1是)',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 (1公开 2私密 3评论可见)',
  `create_time` datetime NOT NULL COMMENT '发表时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES (63, 1, 49, 'https://static.galaxylingyun.top/article/b6b21f1d7f23c60755baff677542c81a.jpg', '2023-03-26', '# 字符效果\n\n- ~~删除线~~ <s>删除线（开启识别 HTML 标签时）</s>\n\n- _斜体字_ _斜体字_\n- **粗体** **粗体**\n- **_粗斜体_** **_粗斜体_**\n\n- 上标：X<sub>2</sub>，下标：O<sup>2</sup>\n\n- ==高亮==\n\n- `Inline Code`\n\n> 引用：如果想要插入空白换行（即 `<br>` 标签），在插入处先键入两个以上的空格然后回车即可\n\n# 超链接\n\n- [普通链接](https://www.ttkwsd.top)\n- [_斜体链接_](https://www.ttkwsd.top)\n- [**粗体链接**](https://www.ttkwsd.top)\n\n# 脚注\n\n这是一个简单的脚注 [^1] 而这是一个更长的脚注 [^bignote].\n\n[^1]: 这是第一个脚注.\n[^bignote]: 这是一个非常长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长的脚注.\n\n# 图像\n\n下面是一张我家硝子的壁纸?:\n![硝子1](https://i.niupic.com/images/2022/03/11/9Wl7.jpg)\n再来一张好了?：\n![硝子2](https://i.niupic.com/images/2022/03/12/9Wme.jpg)\n\n# 代码\n\n## 行内代码\n\n在 VS Code 中按下 <kbd>Alt</kbd> + <kbd>T</kbd> + <kbd>R</kbd> 执行命令：`npm install marked`\n\n## 代码片\n\n### Python 代码\n\n```python\nclass Animal:\n    \"\"\" 动物类 \"\"\"\n\n    def __init__(self, age: int, name: str):\n        self.age = age\n        self.name = name\n\n    def getInfo(self) -> str:\n        \"\"\" 返回信息 \"\"\"\n        return f\'age: {self.age}; name: {self.name}\'\n\n\nclass Dog(Animal):\n    \"\"\" 狗狗类 \"\"\"\n\n    def __init__(self, age: int, name: str, gender=\'female\', color=\'white\'):\n        super().__init__(age, name)\n        self.gender = gender\n        self.__color = color\n\n    def bark(self):\n        \"\"\" 狗叫 \"\"\"\n        print(\'lololo\')\n\n    @property\n    def color(self):\n        return self.__color\n\n    @color.setter\n    def color(self, color: str):\n        if color not in [\'red\', \'white\', \'black\']:\n            raise ValueError(\'颜色不符合要求\')\n        self.__color = color\n\n\nif __name__ == \'__main__\':\n    dog = Dog(16, \'啸天\', gender=\'male\')\n    # 狗叫\n    dog.bark()\n    # 设置狗狗毛色\n    dog.color = \'blue\'\n```\n\n### HTML 代码\n\n```html\n<!DOCTYPE html>\n<html>\n    <head>\n        <mate charest=\"utf-8\" />\n        <title>Hello world!</title>\n    </head>\n    <body>\n        <h1>Hello world!</h1>\n    </body>\n</html>\n```\n\n# 列表\n\n## 无序列表\n\n- 福建\n  - 厦门\n  - 福州\n- 浙江\n- 江苏\n\n## 有序列表\n\n1. 动物\n   1. 人类\n   2. 犬类\n2. 植物\n3. 微生物\n\n## 任务列表\n\n- [x] 预习计算机网络\n- [ ] 复习现代控制理论\n- [ ] 刷现代控制理论历年卷\n  - [ ] 2019 年期末试卷\n  - [ ] 2020 年期末试卷\n\n# 表格\n\n| 项目   |  价格 | 数量 |\n| ------ | ----: | :--: |\n| 计算机 | $1600 |  5   |\n| 手机   |   $12 |  12  |\n| 管线   |    $1 | 234  |\n\n---\n\n# 特殊符号\n\n&copy; & &uml; &trade; &iexcl; &pound;\n&amp; &lt; &gt; &yen; &euro; &reg; &plusmn; &para; &sect; &brvbar; &macr; &laquo; &middot;\n\nX&sup2; Y&sup3; &frac34; &frac14; &times; &divide; &raquo;\n\n18&ordm;C &quot; &apos;\n\n# Emoji 表情 🎉\n\n- 马：🐎\n- 星星：✨\n- 笑脸：😀\n- 跑步：🏃‍\n\n# 数学公式\n\n行间公式：\n$\\sin(\\alpha)^{\\theta}=\\sum_{i=0}^{n}(x^i + \\cos(f))$\n行内公式 $E=mc^2$\n\n# Tip提示\n\n::: tip\n  在此输入内容\n:::\n::: warning\n  在此输入内容\n:::\n::: danger\n  在此输入内容\n:::\n::: details\n  内容\n:::', 2, 0, 0, 0, 1, '2023-03-26 12:40:34', '2023-04-08 20:25:00');
INSERT INTO `t_article` VALUES (65, 1, 49, 'https://static.galaxylingyun.top/article/b330e2220f43a0bc5cd96270b2e94026.jpg', '测试文章1', '# 字符效果\n1\n- ~~删除线~~ <s>删除线（开启识别 HTML 标签时）</s>\n\n- _斜体字_ _斜体字_\n- **粗体** **粗体**\n- **_粗斜体_** **_粗斜体_**\n\n- 上标：X<sub>2</sub>，下标：O<sup>2</sup>\n\n- ==高亮==\n\n- `Inline Code`\n\n> 引用：如果想要插入空白换行（即 `<br>` 标签），在插入处先键入两个以上的空格然后回车即可\n\n# 超链接\n\n- [普通链接](https://www.ttkwsd.top)\n- [_斜体链接_](https://www.ttkwsd.top)\n- [**粗体链接**](https://www.ttkwsd.top)\n\n# 脚注\n\n这是一个简单的脚注 [^1] 而这是一个更长的脚注 [^bignote].\n\n[^1]: 这是第一个脚注.\n[^bignote]: 这是一个非常长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长的脚注.\n\n# 图像\n\n下面是一张我家硝子的壁纸?:\n![硝子1](https://i.niupic.com/images/2022/03/11/9Wl7.jpg)\n再来一张好了?：\n![硝子2](https://i.niupic.com/images/2022/03/12/9Wme.jpg)\n\n# 代码\n\n## 行内代码\n\n在 VS Code 中按下 <kbd>Alt</kbd> + <kbd>T</kbd> + <kbd>R</kbd> 执行命令：`npm install marked`\n\n## 代码片\n\n### Python 代码\n\n```python\nclass Animal:\n    \"\"\" 动物类 \"\"\"\n\n    def __init__(self, age: int, name: str):\n        self.age = age\n        self.name = name\n\n    def getInfo(self) -> str:\n        \"\"\" 返回信息 \"\"\"\n        return f\'age: {self.age}; name: {self.name}\'\n\n\nclass Dog(Animal):\n    \"\"\" 狗狗类 \"\"\"\n\n    def __init__(self, age: int, name: str, gender=\'female\', color=\'white\'):\n        super().__init__(age, name)\n        self.gender = gender\n        self.__color = color\n\n    def bark(self):\n        \"\"\" 狗叫 \"\"\"\n        print(\'lololo\')\n\n    @property\n    def color(self):\n        return self.__color\n\n    @color.setter\n    def color(self, color: str):\n        if color not in [\'red\', \'white\', \'black\']:\n            raise ValueError(\'颜色不符合要求\')\n        self.__color = color\n\n\nif __name__ == \'__main__\':\n    dog = Dog(16, \'啸天\', gender=\'male\')\n    # 狗叫\n    dog.bark()\n    # 设置狗狗毛色\n    dog.color = \'blue\'\n```\n\n### HTML 代码\n\n```html\n<!DOCTYPE html>\n<html>\n    <head>\n        <mate charest=\"utf-8\" />\n        <title>Hello world!</title>\n    </head>\n    <body>\n        <h1>Hello world!</h1>\n    </body>\n</html>\n```\n\n# 列表\n\n## 无序列表\n\n- 福建\n  - 厦门\n  - 福州\n- 浙江\n- 江苏\n\n## 有序列表\n\n1. 动物\n   1. 人类\n   2. 犬类\n2. 植物\n3. 微生物\n\n## 任务列表\n\n- [x] 预习计算机网络\n- [ ] 复习现代控制理论\n- [ ] 刷现代控制理论历年卷\n  - [ ] 2019 年期末试卷\n  - [ ] 2020 年期末试卷\n\n# 表格\n\n| 项目   |  价格 | 数量 |\n| ------ | ----: | :--: |\n| 计算机 | $1600 |  5   |\n| 手机   |   $12 |  12  |\n| 管线   |    $1 | 234  |\n\n---\n\n# 特殊符号\n\n&copy; & &uml; &trade; &iexcl; &pound;\n&amp; &lt; &gt; &yen; &euro; &reg; &plusmn; &para; &sect; &brvbar; &macr; &laquo; &middot;\n\nX&sup2; Y&sup3; &frac34; &frac14; &times; &divide; &raquo;\n\n18&ordm;C &quot; &apos;\n\n# Emoji 表情 🎉\n\n- 马：🐎\n- 星星：✨\n- 笑脸：😀\n- 跑步：🏃‍\n\n# 数学公式\n\n行间公式：\n$\\sin(\\alpha)^{\\theta}=\\sum_{i=0}^{n}(x^i + \\cos(f))$\n行内公式 $E=mc^2$\n\n# Tip提示\n\n::: tip\n  在此输入内容\n:::\n::: warning\n  在此输入内容\n:::\n::: danger\n  在此输入内容\n:::\n::: details\n  内容\n:::', 1, 1, 0, 1, 1, '2023-03-26 12:41:40', '2023-04-08 20:33:03');
INSERT INTO `t_article` VALUES (66, 1, 71, 'https://static.galaxylingyun.top/article/7b2b7a83a85def2e0a2db20d155d530f.png', 'test', 'kaliLinux😎', 1, 0, 0, 0, 1, '2023-03-26 15:41:03', '2023-04-08 20:23:06');
INSERT INTO `t_article` VALUES (68, 1, 71, 'https://static.galaxylingyun.top/article/58bf5664c463f9d490abedbd20168b07.png', '222', '222', 1, 0, 0, 0, 1, '2023-03-26 18:37:02', '2023-04-09 10:05:49');
INSERT INTO `t_article` VALUES (71, 1, 71, 'https://static.galaxylingyun.top/article/3d773f7ffbb1c1487ad65f56e3a46855.jpg', '古风', '000', 1, 0, 0, 1, 1, '2023-04-03 15:24:40', '2023-04-08 20:23:53');
INSERT INTO `t_article` VALUES (72, 1, 71, 'https://static.galaxylingyun.top/config/a1b9b379ca122652c726430dc499cd91.jpg', '9999', '999', 3, 0, 0, 0, 1, '2023-04-08 20:25:54', NULL);

-- ----------------------------
-- Table structure for t_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_article_tag`;
CREATE TABLE `t_article_tag`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `article_id` int NOT NULL COMMENT '文章id',
  `tag_id` int NOT NULL COMMENT '标签id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章标签关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_article_tag
-- ----------------------------
INSERT INTO `t_article_tag` VALUES (112, 66, 16);
INSERT INTO `t_article_tag` VALUES (114, 71, 16);
INSERT INTO `t_article_tag` VALUES (115, 68, 16);
INSERT INTO `t_article_tag` VALUES (116, 63, 16);
INSERT INTO `t_article_tag` VALUES (117, 72, 16);
INSERT INTO `t_article_tag` VALUES (118, 72, 27);
INSERT INTO `t_article_tag` VALUES (119, 65, 16);

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `category_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES (49, '前端', '2023-03-21 11:56:17', NULL);
INSERT INTO `t_category` VALUES (50, 'HTMLCSS', '2023-03-21 11:56:29', '2023-03-21 12:19:46');
INSERT INTO `t_category` VALUES (53, 'TS/JS', '2023-03-21 11:57:08', '2023-04-09 10:27:45');
INSERT INTO `t_category` VALUES (63, 'Vue', '2023-03-21 12:00:32', NULL);
INSERT INTO `t_category` VALUES (64, 'React', '2023-03-21 12:00:44', NULL);
INSERT INTO `t_category` VALUES (65, '后端', '2023-03-21 12:01:16', NULL);
INSERT INTO `t_category` VALUES (66, 'Java', '2023-03-21 12:01:30', NULL);
INSERT INTO `t_category` VALUES (68, 'C/C++', '2023-03-21 12:01:52', '2023-03-21 12:20:20');
INSERT INTO `t_category` VALUES (69, 'Python', '2023-03-21 12:02:03', NULL);
INSERT INTO `t_category` VALUES (70, '数据结构算法', '2023-03-21 12:02:33', NULL);
INSERT INTO `t_category` VALUES (71, 'Test', '2023-03-21 12:02:45', NULL);
INSERT INTO `t_category` VALUES (72, '记录', '2023-03-21 12:02:58', '2023-04-09 10:26:16');
INSERT INTO `t_category` VALUES (74, '诗词', '2023-03-21 12:03:25', '2023-04-09 09:33:29');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `comment_type` tinyint(1) NOT NULL COMMENT '类型 (1文章 2友链 3说说)',
  `type_id` int NULL DEFAULT NULL COMMENT '类型id (类型为友链则没有值)',
  `parent_id` int NULL DEFAULT NULL COMMENT '父评论id',
  `reply_id` int NULL DEFAULT NULL COMMENT '回复评论id',
  `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `from_uid` int NOT NULL COMMENT '评论用户id',
  `to_uid` int NULL DEFAULT NULL COMMENT '回复用户id',
  `is_check` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否通过 (0否 1是)',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (15, 1, 63, NULL, NULL, '666<img src= \'https://static.galaxylingyun.top/emoji/xxy.png\' width=\'21\' height=\'21\' style=\'margin: 0 1px;vertical-align: text-bottom\'/>', 1, NULL, 1, '2023-04-09 08:36:05', NULL);
INSERT INTO `t_comment` VALUES (16, 2, NULL, NULL, NULL, '请看上面友链留言详情哟<img src= \'https://static.galaxylingyun.top/emoji/geixx.png\' width=\'21\' height=\'21\' style=\'margin: 0 1px;vertical-align: text-bottom\'/>', 1, NULL, 1, '2023-04-09 09:53:44', NULL);
INSERT INTO `t_comment` VALUES (17, 1, 71, NULL, NULL, '真不错！！<img src= \'https://static.galaxylingyun.top/emoji/guzhang.png\' width=\'21\' height=\'21\' style=\'margin: 0 1px;vertical-align: text-bottom\'/>', 1, NULL, 1, '2023-04-09 09:54:47', NULL);
INSERT INTO `t_comment` VALUES (18, 1, 71, 17, 17, '测试<img src= \'https://static.galaxylingyun.top/emoji/zhichi.png\' width=\'21\' height=\'21\' style=\'margin: 0 1px;vertical-align: text-bottom\'/><img src= \'https://static.galaxylingyun.top/emoji/wa.png\' width=\'21\' height=\'21\' style=\'margin: 0 1px;vertical-align: text-bottom\'/>', 1, 1, 1, '2023-04-09 09:55:16', NULL);
INSERT INTO `t_comment` VALUES (19, 1, 65, NULL, NULL, 'nice！nice<img src= \'https://static.galaxylingyun.top/emoji/aihei.png\' width=\'21\' height=\'21\' style=\'margin: 0 1px;vertical-align: text-bottom\'/>', 1, NULL, 1, '2023-04-09 10:04:36', NULL);

-- ----------------------------
-- Table structure for t_exception_log
-- ----------------------------
DROP TABLE IF EXISTS `t_exception_log`;
CREATE TABLE `t_exception_log`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '异常id',
  `module` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '异常模块',
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '异常uri',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '异常名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作描述',
  `error_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '异常方法',
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '异常信息',
  `params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请求参数',
  `request_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请求方式',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作ip',
  `ip_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作地址',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作系统',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '浏览器',
  `create_time` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 423 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作异常表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_exception_log
-- ----------------------------
INSERT INTO `t_exception_log` VALUES (416, '分类模块', '/admin/category/delete', 'java.lang.IllegalArgumentException', '删除分类', 'com.galaxy.controller.CategoryController.deleteCategory', 'java.lang.IllegalArgumentException:删除失败，分类下存在文章\ncn.hutool.core.lang.Assert.lambda$isFalse$1(Assert.java:106)\ncn.hutool.core.lang.Assert.isFalse(Assert.java:89)\ncn.hutool.core.lang.Assert.isFalse(Assert.java:106)\ncom.galaxy.service.impl.CategoryServiceImpl.deleteCategory(CategoryServiceImpl.java:72)\ncom.galaxy.service.impl.CategoryServiceImpl$$FastClassBySpringCGLIB$$daccea73.invoke(<generated>)\norg.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\norg.springframework.aop.framework.CglibAopProxy.invokeMethod(CglibAopProxy.java:386)\norg.springframework.aop.framework.CglibAopProxy.access$000(CglibAopProxy.java:85)\norg.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\ncom.galaxy.service.impl.CategoryServiceImpl$$EnhancerBySpringCGLIB$$75d7825f.deleteCategory(<generated>)\ncom.galaxy.controller.CategoryController.deleteCategory(CategoryController.java:72)\ncom.galaxy.controller.CategoryController$$FastClassBySpringCGLIB$$5d5eccdb.invoke(<generated>)\norg.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:793)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.framework.adapter.AfterReturningAdviceInterceptor.invoke(AfterReturningAdviceInterceptor.java:57)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.framework.adapter.MethodBeforeAdviceInterceptor.invoke(MethodBeforeAdviceInterceptor.java:58)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:64)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:708)\ncom.galaxy.controller.CategoryController$$EnhancerBySpringCGLIB$$cb3a8167.deleteCategory(<generated>)\njava.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\njava.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\njava.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\njava.base/java.lang.reflect.Method.invoke(Method.java:566)\norg.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\norg.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\norg.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:117)\norg.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\norg.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:808)\norg.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\norg.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1071)\norg.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:964)\norg.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\norg.springframework.web.servlet.FrameworkServlet.doDelete(FrameworkServlet.java:931)\njavax.servlet.http.HttpServlet.service(HttpServlet.java:702)\norg.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\njavax.servlet.http.HttpServlet.service(HttpServlet.java:779)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:227)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\ncn.dev33.satoken.filter.SaServletFilter.doFilter(SaServletFilter.java:179)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\norg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\norg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\norg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:177)\norg.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\norg.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:541)\norg.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:135)\norg.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\norg.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\norg.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:360)\norg.apache.coyote.http11.Http11Processor.service(Http11Processor.java:399)\norg.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\norg.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:891)\norg.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1784)\norg.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\norg.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\norg.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\norg.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\njava.base/java.lang.Thread.run(Thread.java:834)\n', '[[49]]', 'DELETE', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 10:26:51');
INSERT INTO `t_exception_log` VALUES (417, '登录模块', '/oauth/gitee', 'com.galaxy.exception.ServiceException', 'Gitee登录', 'com.galaxy.controller.LoginController.giteeLogin', 'com.galaxy.exception.ServiceException:Gitee登录错误\ncom.galaxy.strategy.impl.GiteeLoginStrategyImpl.getGiteeToken(GiteeLoginStrategyImpl.java:88)\ncom.galaxy.strategy.impl.GiteeLoginStrategyImpl.getSocialToken(GiteeLoginStrategyImpl.java:44)\ncom.galaxy.strategy.impl.AbstractLoginStrategyImpl.login(AbstractLoginStrategyImpl.java:37)\ncom.galaxy.strategy.context.SocialLoginStrategyContext.executeLoginStrategy(SocialLoginStrategyContext.java:29)\ncom.galaxy.service.impl.LoginServiceImpl.giteeLogin(LoginServiceImpl.java:123)\ncom.galaxy.service.impl.LoginServiceImpl$$FastClassBySpringCGLIB$$fecda4f0.invoke(<generated>)\norg.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:793)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\norg.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:388)\norg.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:708)\ncom.galaxy.service.impl.LoginServiceImpl$$EnhancerBySpringCGLIB$$f60fa7f6.giteeLogin(<generated>)\ncom.galaxy.controller.LoginController.giteeLogin(LoginController.java:90)\ncom.galaxy.controller.LoginController$$FastClassBySpringCGLIB$$b05f15e4.invoke(<generated>)\norg.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:793)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:64)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:708)\ncom.galaxy.controller.LoginController$$EnhancerBySpringCGLIB$$10ef0419.giteeLogin(<generated>)\njava.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\njava.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\njava.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\njava.base/java.lang.reflect.Method.invoke(Method.java:566)\norg.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\norg.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\norg.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:117)\norg.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\norg.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:808)\norg.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\norg.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1071)\norg.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:964)\norg.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\norg.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\njavax.servlet.http.HttpServlet.service(HttpServlet.java:696)\norg.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\njavax.servlet.http.HttpServlet.service(HttpServlet.java:779)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:227)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\ncn.dev33.satoken.filter.SaServletFilter.doFilter(SaServletFilter.java:179)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\norg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\norg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\norg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:177)\norg.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\norg.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:541)\norg.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:135)\norg.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\norg.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\norg.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:360)\norg.apache.coyote.http11.Http11Processor.service(Http11Processor.java:399)\norg.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\norg.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:891)\norg.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1784)\norg.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\norg.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\norg.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\norg.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\njava.base/java.lang.Thread.run(Thread.java:834)\n', '[{\"code\":\"2f9d4883168d8cf6c5f01c45bf8d76770b6702543904cac62148ba822f8463b2\"}]', 'POST', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 10:48:52');
INSERT INTO `t_exception_log` VALUES (418, '登录模块', '/oauth/gitee', 'com.galaxy.exception.ServiceException', 'Gitee登录', 'com.galaxy.controller.LoginController.giteeLogin', 'com.galaxy.exception.ServiceException:Gitee登录错误\ncom.galaxy.strategy.impl.GiteeLoginStrategyImpl.getGiteeToken(GiteeLoginStrategyImpl.java:88)\ncom.galaxy.strategy.impl.GiteeLoginStrategyImpl.getSocialToken(GiteeLoginStrategyImpl.java:44)\ncom.galaxy.strategy.impl.AbstractLoginStrategyImpl.login(AbstractLoginStrategyImpl.java:37)\ncom.galaxy.strategy.context.SocialLoginStrategyContext.executeLoginStrategy(SocialLoginStrategyContext.java:29)\ncom.galaxy.service.impl.LoginServiceImpl.giteeLogin(LoginServiceImpl.java:123)\ncom.galaxy.service.impl.LoginServiceImpl$$FastClassBySpringCGLIB$$fecda4f0.invoke(<generated>)\norg.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:793)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\norg.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:388)\norg.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:708)\ncom.galaxy.service.impl.LoginServiceImpl$$EnhancerBySpringCGLIB$$f60fa7f6.giteeLogin(<generated>)\ncom.galaxy.controller.LoginController.giteeLogin(LoginController.java:90)\ncom.galaxy.controller.LoginController$$FastClassBySpringCGLIB$$b05f15e4.invoke(<generated>)\norg.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:793)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:64)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:708)\ncom.galaxy.controller.LoginController$$EnhancerBySpringCGLIB$$10ef0419.giteeLogin(<generated>)\njava.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\njava.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\njava.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\njava.base/java.lang.reflect.Method.invoke(Method.java:566)\norg.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\norg.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\norg.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:117)\norg.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\norg.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:808)\norg.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\norg.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1071)\norg.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:964)\norg.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\norg.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\njavax.servlet.http.HttpServlet.service(HttpServlet.java:696)\norg.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\njavax.servlet.http.HttpServlet.service(HttpServlet.java:779)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:227)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\ncn.dev33.satoken.filter.SaServletFilter.doFilter(SaServletFilter.java:179)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\norg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\norg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\norg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:177)\norg.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\norg.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:541)\norg.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:135)\norg.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\norg.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\norg.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:360)\norg.apache.coyote.http11.Http11Processor.service(Http11Processor.java:399)\norg.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\norg.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:891)\norg.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1784)\norg.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\norg.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\norg.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\norg.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\njava.base/java.lang.Thread.run(Thread.java:834)\n', '[{\"code\":\"44db265b3747f3e36583da78115e2ca2366beec96fa1f478c46b37a1550a566c\"}]', 'POST', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 10:50:09');
INSERT INTO `t_exception_log` VALUES (419, '登录模块', '/oauth/gitee', 'com.galaxy.exception.ServiceException', 'Gitee登录', 'com.galaxy.controller.LoginController.giteeLogin', 'com.galaxy.exception.ServiceException:Gitee登录错误\ncom.galaxy.strategy.impl.GiteeLoginStrategyImpl.getGiteeToken(GiteeLoginStrategyImpl.java:88)\ncom.galaxy.strategy.impl.GiteeLoginStrategyImpl.getSocialToken(GiteeLoginStrategyImpl.java:44)\ncom.galaxy.strategy.impl.AbstractLoginStrategyImpl.login(AbstractLoginStrategyImpl.java:37)\ncom.galaxy.strategy.context.SocialLoginStrategyContext.executeLoginStrategy(SocialLoginStrategyContext.java:29)\ncom.galaxy.service.impl.LoginServiceImpl.giteeLogin(LoginServiceImpl.java:123)\ncom.galaxy.service.impl.LoginServiceImpl$$FastClassBySpringCGLIB$$fecda4f0.invoke(<generated>)\norg.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:793)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\norg.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:388)\norg.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:708)\ncom.galaxy.service.impl.LoginServiceImpl$$EnhancerBySpringCGLIB$$d6a50688.giteeLogin(<generated>)\ncom.galaxy.controller.LoginController.giteeLogin(LoginController.java:90)\ncom.galaxy.controller.LoginController$$FastClassBySpringCGLIB$$b05f15e4.invoke(<generated>)\norg.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:793)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:64)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:708)\ncom.galaxy.controller.LoginController$$EnhancerBySpringCGLIB$$a5950396.giteeLogin(<generated>)\njava.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\njava.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\njava.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\njava.base/java.lang.reflect.Method.invoke(Method.java:566)\norg.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\norg.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\norg.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:117)\norg.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\norg.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:808)\norg.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\norg.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1071)\norg.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:964)\norg.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\norg.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\njavax.servlet.http.HttpServlet.service(HttpServlet.java:696)\norg.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\njavax.servlet.http.HttpServlet.service(HttpServlet.java:779)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:227)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\ncn.dev33.satoken.filter.SaServletFilter.doFilter(SaServletFilter.java:179)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\norg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\norg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\norg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:177)\norg.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\norg.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:541)\norg.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:135)\norg.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\norg.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\norg.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:360)\norg.apache.coyote.http11.Http11Processor.service(Http11Processor.java:399)\norg.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\norg.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:891)\norg.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1784)\norg.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\norg.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\norg.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\norg.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\njava.base/java.lang.Thread.run(Thread.java:834)\n', '[{\"code\":\"f833025bf342861ad3f2a78439c20b8ea890bcba7aa5c806f3933824ecf0303c\"}]', 'POST', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 11:10:16');
INSERT INTO `t_exception_log` VALUES (420, '登录模块', '/oauth/github', 'com.galaxy.exception.ServiceException', 'Github登录', 'com.galaxy.controller.LoginController.githubLogin', 'com.galaxy.exception.ServiceException:Github登录错误\ncom.galaxy.strategy.impl.GithubLoginStrategyImpl.getGithubToken(GithubLoginStrategyImpl.java:95)\ncom.galaxy.strategy.impl.GithubLoginStrategyImpl.getSocialToken(GithubLoginStrategyImpl.java:46)\ncom.galaxy.strategy.impl.AbstractLoginStrategyImpl.login(AbstractLoginStrategyImpl.java:37)\ncom.galaxy.strategy.context.SocialLoginStrategyContext.executeLoginStrategy(SocialLoginStrategyContext.java:29)\ncom.galaxy.service.impl.LoginServiceImpl.githubLogin(LoginServiceImpl.java:129)\ncom.galaxy.service.impl.LoginServiceImpl$$FastClassBySpringCGLIB$$fecda4f0.invoke(<generated>)\norg.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:793)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\norg.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:388)\norg.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:708)\ncom.galaxy.service.impl.LoginServiceImpl$$EnhancerBySpringCGLIB$$d6a50688.githubLogin(<generated>)\ncom.galaxy.controller.LoginController.githubLogin(LoginController.java:102)\ncom.galaxy.controller.LoginController$$FastClassBySpringCGLIB$$b05f15e4.invoke(<generated>)\norg.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:793)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:64)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:708)\ncom.galaxy.controller.LoginController$$EnhancerBySpringCGLIB$$8bcfa152.githubLogin(<generated>)\njava.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\njava.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\njava.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\njava.base/java.lang.reflect.Method.invoke(Method.java:566)\norg.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\norg.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\norg.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:117)\norg.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\norg.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:808)\norg.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\norg.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1071)\norg.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:964)\norg.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\norg.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\njavax.servlet.http.HttpServlet.service(HttpServlet.java:696)\norg.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\njavax.servlet.http.HttpServlet.service(HttpServlet.java:779)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:227)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\ncn.dev33.satoken.filter.SaServletFilter.doFilter(SaServletFilter.java:179)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\norg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\norg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\norg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:177)\norg.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\norg.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:541)\norg.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:135)\norg.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\norg.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\norg.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:360)\norg.apache.coyote.http11.Http11Processor.service(Http11Processor.java:399)\norg.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\norg.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:891)\norg.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1784)\norg.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\norg.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\norg.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\norg.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\njava.base/java.lang.Thread.run(Thread.java:834)\n', '[{}]', 'POST', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 11:29:12');
INSERT INTO `t_exception_log` VALUES (421, '登录模块', '/oauth/github', 'org.springframework.web.client.HttpClientErrorException$Unauthorized', 'Github登录', 'com.galaxy.controller.LoginController.githubLogin', 'org.springframework.web.client.HttpClientErrorException$Unauthorized:401 Unauthorized: \"{\"message\":\"Bad credentials\",\"documentation_url\":\"https://docs.github.com/rest\"}\"\norg.springframework.web.client.HttpClientErrorException.create(HttpClientErrorException.java:105)\norg.springframework.web.client.DefaultResponseErrorHandler.handleError(DefaultResponseErrorHandler.java:168)\norg.springframework.web.client.DefaultResponseErrorHandler.handleError(DefaultResponseErrorHandler.java:122)\norg.springframework.web.client.ResponseErrorHandler.handleError(ResponseErrorHandler.java:63)\norg.springframework.web.client.RestTemplate.handleResponse(RestTemplate.java:825)\norg.springframework.web.client.RestTemplate.doExecute(RestTemplate.java:783)\norg.springframework.web.client.RestTemplate.execute(RestTemplate.java:717)\norg.springframework.web.client.RestTemplate.exchange(RestTemplate.java:608)\ncom.galaxy.strategy.impl.GithubLoginStrategyImpl.getSocialUserInfo(GithubLoginStrategyImpl.java:61)\ncom.galaxy.strategy.impl.AbstractLoginStrategyImpl.login(AbstractLoginStrategyImpl.java:39)\ncom.galaxy.strategy.context.SocialLoginStrategyContext.executeLoginStrategy(SocialLoginStrategyContext.java:29)\ncom.galaxy.service.impl.LoginServiceImpl.githubLogin(LoginServiceImpl.java:129)\ncom.galaxy.service.impl.LoginServiceImpl$$FastClassBySpringCGLIB$$fecda4f0.invoke(<generated>)\norg.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:793)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\norg.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:388)\norg.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:708)\ncom.galaxy.service.impl.LoginServiceImpl$$EnhancerBySpringCGLIB$$d6a50688.githubLogin(<generated>)\ncom.galaxy.controller.LoginController.githubLogin(LoginController.java:102)\ncom.galaxy.controller.LoginController$$FastClassBySpringCGLIB$$b05f15e4.invoke(<generated>)\norg.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:793)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:64)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:708)\ncom.galaxy.controller.LoginController$$EnhancerBySpringCGLIB$$8bcfa152.githubLogin(<generated>)\njava.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\njava.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\njava.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\njava.base/java.lang.reflect.Method.invoke(Method.java:566)\norg.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\norg.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\norg.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:117)\norg.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\norg.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:808)\norg.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\norg.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1071)\norg.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:964)\norg.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\norg.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\njavax.servlet.http.HttpServlet.service(HttpServlet.java:696)\norg.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\njavax.servlet.http.HttpServlet.service(HttpServlet.java:779)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:227)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\ncn.dev33.satoken.filter.SaServletFilter.doFilter(SaServletFilter.java:179)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\norg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\norg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\norg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:177)\norg.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\norg.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:541)\norg.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:135)\norg.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\norg.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\norg.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:360)\norg.apache.coyote.http11.Http11Processor.service(Http11Processor.java:399)\norg.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\norg.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:891)\norg.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1784)\norg.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\norg.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\norg.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\norg.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\njava.base/java.lang.Thread.run(Thread.java:834)\n', '[{}]', 'POST', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 11:30:53');
INSERT INTO `t_exception_log` VALUES (422, '登录模块', '/oauth/github', 'com.galaxy.exception.ServiceException', 'Github登录', 'com.galaxy.controller.LoginController.githubLogin', 'com.galaxy.exception.ServiceException:Github登录错误\ncom.galaxy.strategy.impl.GithubLoginStrategyImpl.getGithubToken(GithubLoginStrategyImpl.java:95)\ncom.galaxy.strategy.impl.GithubLoginStrategyImpl.getSocialToken(GithubLoginStrategyImpl.java:46)\ncom.galaxy.strategy.impl.AbstractLoginStrategyImpl.login(AbstractLoginStrategyImpl.java:37)\ncom.galaxy.strategy.context.SocialLoginStrategyContext.executeLoginStrategy(SocialLoginStrategyContext.java:29)\ncom.galaxy.service.impl.LoginServiceImpl.githubLogin(LoginServiceImpl.java:129)\ncom.galaxy.service.impl.LoginServiceImpl$$FastClassBySpringCGLIB$$fecda4f0.invoke(<generated>)\norg.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:793)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\norg.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:388)\norg.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:708)\ncom.galaxy.service.impl.LoginServiceImpl$$EnhancerBySpringCGLIB$$d6a50688.githubLogin(<generated>)\ncom.galaxy.controller.LoginController.githubLogin(LoginController.java:102)\ncom.galaxy.controller.LoginController$$FastClassBySpringCGLIB$$b05f15e4.invoke(<generated>)\norg.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:793)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:64)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\norg.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\norg.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\norg.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:708)\ncom.galaxy.controller.LoginController$$EnhancerBySpringCGLIB$$8bcfa152.githubLogin(<generated>)\njava.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\njava.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\njava.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\njava.base/java.lang.reflect.Method.invoke(Method.java:566)\norg.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\norg.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\norg.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:117)\norg.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\norg.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:808)\norg.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\norg.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1071)\norg.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:964)\norg.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\norg.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\njavax.servlet.http.HttpServlet.service(HttpServlet.java:696)\norg.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\njavax.servlet.http.HttpServlet.service(HttpServlet.java:779)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:227)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\ncn.dev33.satoken.filter.SaServletFilter.doFilter(SaServletFilter.java:179)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\norg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\norg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\norg.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\norg.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\norg.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\norg.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:177)\norg.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\norg.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:541)\norg.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:135)\norg.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\norg.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\norg.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:360)\norg.apache.coyote.http11.Http11Processor.service(Http11Processor.java:399)\norg.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\norg.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:891)\norg.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1784)\norg.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\norg.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\norg.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\norg.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\njava.base/java.lang.Thread.run(Thread.java:834)\n', '[{}]', 'POST', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 11:34:43');

-- ----------------------------
-- Table structure for t_friend
-- ----------------------------
DROP TABLE IF EXISTS `t_friend`;
CREATE TABLE `t_friend`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '友链id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '友链名称',
  `color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '友链颜色',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '友链头像',
  `url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '友链地址',
  `introduction` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '友链介绍',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `friend_user`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '友链表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_friend
-- ----------------------------
INSERT INTO `t_friend` VALUES (18, '阿东', '#409EFF', 'https://static.ttkwsd.top/config/05409c1ed50047535f28a40464f7b1ab.jpg', 'https://www.ttkwsd.top/', '博客原创大佬', '2023-03-26 15:24:16', '2023-04-09 10:18:05');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` int NOT NULL DEFAULT 0 COMMENT '父菜单id (paren_id为0且type为M则是一级菜单)',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限类型 (M目录 C菜单 B按钮)',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由地址',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `component` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单组件',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '权限标识',
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否隐藏 (0否 1是)',
  `is_disable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用 (0否 1是)',
  `order_num` int NOT NULL DEFAULT 1 COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (1, 0, 'M', '文章管理', 'article', 'archives', '', '', 0, 0, 1, '2022-12-04 09:13:31', '2023-02-21 15:36:45');
INSERT INTO `t_menu` VALUES (3, 1, 'C', '分类管理', 'category', 'category', '/blog/category/index', 'blog:category:list', 0, 0, 3, '2022-12-04 09:22:20', '2023-02-21 15:21:19');
INSERT INTO `t_menu` VALUES (4, 1, 'C', '标签管理', 'tag', 'tag', '/blog/tag/index', 'blog:tag:list', 0, 0, 4, '2022-12-04 09:23:01', '2023-02-21 15:21:23');
INSERT INTO `t_menu` VALUES (5, 3, 'B', '添加分类', NULL, NULL, NULL, 'blog:category:add', 0, 0, 1, '2022-12-04 09:30:55', NULL);
INSERT INTO `t_menu` VALUES (6, 3, 'B', '删除分类', NULL, NULL, NULL, 'blog:category:delete', 0, 0, 2, '2022-12-04 09:32:15', '2022-12-26 15:39:20');
INSERT INTO `t_menu` VALUES (7, 3, 'B', '修改分类', NULL, NULL, NULL, 'blog:category:update', 0, 0, 3, '2022-12-04 09:33:52', NULL);
INSERT INTO `t_menu` VALUES (8, 4, 'B', '添加标签', NULL, NULL, '', 'blog:tag:add', 0, 0, 1, '2022-12-04 10:19:51', NULL);
INSERT INTO `t_menu` VALUES (9, 4, 'B', '删除标签', NULL, NULL, NULL, 'blog:tag:delete', 0, 0, 2, '2022-12-04 10:20:41', NULL);
INSERT INTO `t_menu` VALUES (10, 4, 'B', '修改标签', NULL, NULL, NULL, 'blog:tag:update', 0, 0, 3, '2022-12-04 10:21:32', NULL);
INSERT INTO `t_menu` VALUES (11, 0, 'M', '系统管理', 'system', 'system', '', '', 0, 0, 4, '2022-12-06 10:58:50', '2023-03-15 09:48:55');
INSERT INTO `t_menu` VALUES (12, 11, 'C', '菜单管理', 'menu', 'tree-table', '/system/menu/index', 'system:menu:list', 0, 0, 3, '2022-12-06 16:33:56', '2023-03-15 09:53:19');
INSERT INTO `t_menu` VALUES (13, 11, 'C', '角色管理', 'role', 'peoples', '/system/role/index', 'system:role:list', 0, 0, 2, '2022-12-06 17:09:55', NULL);
INSERT INTO `t_menu` VALUES (14, 11, 'C', '用户管理', 'user', 'user', '/system/user/index', 'system:user:list', 0, 0, 1, '2022-12-06 17:10:28', '2023-03-15 09:52:48');
INSERT INTO `t_menu` VALUES (15, 12, 'B', '添加菜单', NULL, '', NULL, 'system:menu:add', 0, 0, 1, '2022-12-07 10:50:22', NULL);
INSERT INTO `t_menu` VALUES (16, 12, 'B', '删除菜单', NULL, '', NULL, 'system:menu:delete', 0, 0, 2, '2022-12-07 10:50:54', NULL);
INSERT INTO `t_menu` VALUES (17, 12, 'B', '修改菜单', NULL, '', NULL, 'system:menu:update', 0, 0, 3, '2022-12-07 10:55:21', NULL);
INSERT INTO `t_menu` VALUES (18, 13, 'B', '添加角色', NULL, NULL, NULL, 'system:role:add', 0, 0, 1, '2022-12-07 10:56:24', NULL);
INSERT INTO `t_menu` VALUES (19, 13, 'B', '删除角色', NULL, NULL, NULL, 'system:role:delete', 0, 0, 2, '2022-12-07 10:56:50', NULL);
INSERT INTO `t_menu` VALUES (20, 13, 'B', '修改角色', NULL, NULL, NULL, 'system:role:update', 0, 0, 3, '2022-12-07 10:57:15', NULL);
INSERT INTO `t_menu` VALUES (21, 0, 'M', '日志管理', 'log', 'log', '', '', 0, 0, 5, '2022-12-21 17:36:39', '2023-03-15 09:49:26');
INSERT INTO `t_menu` VALUES (22, 21, 'C', '操作日志', 'operation', 'form', '/system/log/operation', 'log:operation:list', 0, 0, 1, '2022-12-21 20:14:01', NULL);
INSERT INTO `t_menu` VALUES (23, 21, 'C', '异常日志', 'exception', 'bug', '/system/log/exception', 'log:exception:list', 0, 0, 2, '2022-12-21 20:48:25', NULL);
INSERT INTO `t_menu` VALUES (24, 22, 'B', '删除操作日志', NULL, NULL, NULL, 'log:operation:delete', 0, 0, 1, '2022-12-26 16:43:00', NULL);
INSERT INTO `t_menu` VALUES (25, 23, 'B', '删除异常日志', NULL, NULL, NULL, 'log:exception:delete', 0, 0, 1, '2022-12-27 13:21:50', NULL);
INSERT INTO `t_menu` VALUES (26, 0, 'M', '运维监控', 'monitor', 'monitor', NULL, '', 0, 0, 6, '2022-12-27 13:23:29', '2023-04-09 10:15:39');
INSERT INTO `t_menu` VALUES (27, 26, 'C', '定时任务', 'task', 'job', '/monitor/task/index', 'monitor:task:list', 0, 0, 2, '2022-12-27 13:26:29', '2023-01-01 21:08:35');
INSERT INTO `t_menu` VALUES (28, 27, 'B', '添加任务', NULL, NULL, NULL, 'monitor:task:add', 0, 0, 1, '2022-12-27 13:32:42', NULL);
INSERT INTO `t_menu` VALUES (29, 27, 'B', '修改任务', NULL, NULL, NULL, 'monitor:task:update', 0, 0, 2, '2022-12-27 13:33:45', NULL);
INSERT INTO `t_menu` VALUES (30, 27, 'B', '删除任务', NULL, NULL, NULL, 'monitor:task:delete', 0, 0, 3, '2022-12-27 13:34:29', NULL);
INSERT INTO `t_menu` VALUES (31, 27, 'B', '修改任务状态', NULL, NULL, NULL, 'monitor:task:status', 0, 0, 4, '2022-12-27 13:43:24', NULL);
INSERT INTO `t_menu` VALUES (32, 27, 'B', '运行任务', NULL, NULL, NULL, 'monitor:task:run', 0, 0, 5, '2022-12-27 13:45:34', NULL);
INSERT INTO `t_menu` VALUES (33, 13, 'B', '修改角色状态', NULL, NULL, NULL, 'system:role:status', 0, 0, 4, '2022-12-27 13:46:39', NULL);
INSERT INTO `t_menu` VALUES (34, 0, 'M', '网站管理', 'web', 'international', NULL, '', 0, 0, 3, '2022-12-30 17:22:33', '2023-03-15 09:48:06');
INSERT INTO `t_menu` VALUES (35, 34, 'C', '友链管理', 'friend', 'friend', '/web/friend/index', 'web:friend:list', 0, 0, 1, '2022-12-30 17:33:15', NULL);
INSERT INTO `t_menu` VALUES (36, 0, 'M', '消息管理', 'news', 'email', NULL, '', 0, 0, 2, '2022-12-30 17:50:06', '2022-12-30 18:02:12');
INSERT INTO `t_menu` VALUES (37, 36, 'C', '留言管理', 'message', 'form', '/news/message/index', 'news:message:list', 0, 0, 2, '2022-12-30 17:58:25', '2022-12-30 18:01:47');
INSERT INTO `t_menu` VALUES (38, 36, 'C', '评论管理', 'comment', 'comment', '/news/comment/index', 'news:comment:list', 0, 0, 1, '2022-12-30 17:59:37', '2022-12-30 18:03:35');
INSERT INTO `t_menu` VALUES (39, 35, 'B', '添加友链', NULL, NULL, NULL, 'web:friend:add', 0, 0, 1, '2022-12-30 18:56:22', NULL);
INSERT INTO `t_menu` VALUES (40, 35, 'B', '删除友链', NULL, NULL, NULL, 'web:friend:delete', 0, 0, 2, '2022-12-30 18:56:42', NULL);
INSERT INTO `t_menu` VALUES (41, 35, 'B', '修改友链', NULL, NULL, NULL, 'web:friend:update', 0, 0, 3, '2022-12-30 18:57:08', NULL);
INSERT INTO `t_menu` VALUES (42, 37, 'B', '删除留言', NULL, NULL, NULL, 'news:message:delete', 0, 0, 1, '2022-12-30 22:05:53', NULL);
INSERT INTO `t_menu` VALUES (45, 37, 'B', '审核留言', NULL, NULL, NULL, 'news:message:pass', 0, 0, 2, '2022-12-30 22:29:24', NULL);
INSERT INTO `t_menu` VALUES (46, 34, 'C', '网站配置', 'site', 'example', '/web/site/index', 'web:site:list', 0, 0, 5, '2022-12-31 11:50:45', '2023-01-03 18:49:17');
INSERT INTO `t_menu` VALUES (51, 34, 'C', '相册管理', 'album', 'album', '/web/album/index', 'web:album:list', 0, 0, 3, '2023-01-01 18:16:40', '2023-01-03 18:49:06');
INSERT INTO `t_menu` VALUES (52, 34, 'C', '照片管理', 'photo/:albumId', 'photo', '/web/photo/index', 'web:photo:list', 1, 0, 4, '2023-01-01 18:18:11', '2023-01-01 18:39:22');
INSERT INTO `t_menu` VALUES (53, 26, 'C', '在线用户', 'online', 'online', '/monitor/online/index', 'monitor:online:list', 0, 0, 1, '2023-01-01 21:07:48', '2023-01-01 21:08:29');
INSERT INTO `t_menu` VALUES (54, 51, 'B', '添加相册', NULL, NULL, NULL, 'web:album:add', 0, 0, 1, '2023-01-02 19:01:33', NULL);
INSERT INTO `t_menu` VALUES (55, 51, 'B', '删除相册', NULL, NULL, NULL, 'web:album:delete', 0, 0, 2, '2023-01-02 19:02:03', NULL);
INSERT INTO `t_menu` VALUES (56, 51, 'B', '修改相册', NULL, NULL, NULL, 'web:album:update', 0, 0, 3, '2023-01-02 19:02:50', NULL);
INSERT INTO `t_menu` VALUES (57, 51, 'B', '编辑相册', NULL, NULL, NULL, 'web:album:edit', 0, 0, 4, '2023-01-02 19:03:40', NULL);
INSERT INTO `t_menu` VALUES (58, 51, 'B', '上传相册封面', NULL, NULL, NULL, 'web:album:upload', 0, 0, 5, '2023-01-02 19:04:38', NULL);
INSERT INTO `t_menu` VALUES (60, 12, 'B', '编辑菜单', NULL, NULL, NULL, 'system:menu:edit', 0, 0, 4, '2023-01-03 18:29:57', NULL);
INSERT INTO `t_menu` VALUES (61, 34, 'C', '说说管理', 'talk', 'talk', '/web/talk/index', 'web:talk:list', 0, 0, 2, '2023-01-03 18:48:28', '2023-01-03 18:48:41');
INSERT INTO `t_menu` VALUES (62, 61, 'B', '添加说说', NULL, NULL, NULL, 'web:talk:add', 0, 0, 1, '2023-01-05 19:16:42', NULL);
INSERT INTO `t_menu` VALUES (63, 61, 'B', '删除说说', NULL, NULL, NULL, 'web:talk:delete', 0, 0, 2, '2023-01-05 19:17:07', NULL);
INSERT INTO `t_menu` VALUES (64, 61, 'B', '修改说说', NULL, NULL, NULL, 'web:talk:update', 0, 0, 3, '2023-01-05 19:17:36', NULL);
INSERT INTO `t_menu` VALUES (65, 61, 'B', '编辑说说', NULL, NULL, NULL, 'web:talk:edit', 0, 0, 4, '2023-01-05 19:18:27', NULL);
INSERT INTO `t_menu` VALUES (66, 61, 'B', '上传说说图片', NULL, NULL, NULL, 'web:talk:upload', 0, 0, 5, '2023-01-05 19:18:52', NULL);
INSERT INTO `t_menu` VALUES (67, 46, 'B', '修改网站配置', NULL, NULL, NULL, 'web:site:update', 0, 0, 1, '2023-01-08 09:15:56', NULL);
INSERT INTO `t_menu` VALUES (68, 46, 'B', '上传网站配置图片', NULL, NULL, NULL, 'web:site:upload', 0, 0, 2, '2023-01-08 14:53:16', NULL);
INSERT INTO `t_menu` VALUES (69, 14, 'B', '修改用户', NULL, NULL, NULL, 'system:user:update', 0, 0, 1, '2023-01-09 17:03:18', NULL);
INSERT INTO `t_menu` VALUES (70, 14, 'B', '修改用户状态', NULL, NULL, NULL, 'system:user:status', 0, 0, 2, '2023-01-09 17:03:51', NULL);
INSERT INTO `t_menu` VALUES (71, 53, 'B', '下线用户', NULL, NULL, NULL, 'monitor:online:kick', 0, 0, 1, '2023-01-09 19:18:33', NULL);
INSERT INTO `t_menu` VALUES (73, 1, 'C', '文章列表', 'list', 'chart', '/blog/article/list', 'blog:article:list', 0, 0, 2, '2023-01-10 17:37:29', '2023-02-21 15:36:09');
INSERT INTO `t_menu` VALUES (76, 52, 'B', '添加照片', NULL, NULL, NULL, 'web:photo:add', 0, 0, 1, '2023-01-11 18:45:28', NULL);
INSERT INTO `t_menu` VALUES (77, 52, 'B', '删除照片', NULL, NULL, NULL, 'web:photo:delete', 0, 0, 2, '2023-01-11 18:45:51', NULL);
INSERT INTO `t_menu` VALUES (78, 52, 'B', '修改照片', NULL, NULL, NULL, 'web:photo:update', 0, 0, 3, '2023-01-11 18:46:12', NULL);
INSERT INTO `t_menu` VALUES (79, 52, 'B', '上传照片', NULL, NULL, NULL, 'web:photo:upload', 0, 0, 3, '2023-01-11 18:46:48', NULL);
INSERT INTO `t_menu` VALUES (80, 73, 'B', '添加文章', NULL, NULL, NULL, 'blog:article:add', 0, 0, 1, '2023-01-14 15:25:29', NULL);
INSERT INTO `t_menu` VALUES (81, 73, 'B', '物理删除文章', NULL, NULL, NULL, 'blog:article:delete', 0, 0, 2, '2023-01-14 15:26:44', NULL);
INSERT INTO `t_menu` VALUES (82, 73, 'B', '逻辑删除文章', NULL, NULL, NULL, 'blog:article:recycle', 0, 0, 3, '2023-01-14 15:28:32', NULL);
INSERT INTO `t_menu` VALUES (83, 73, 'B', '更新文章', NULL, NULL, NULL, 'blog:article:update', 0, 0, 4, '2023-01-14 15:30:11', NULL);
INSERT INTO `t_menu` VALUES (84, 73, 'B', '编辑文章', NULL, NULL, NULL, 'blog:article:edit', 0, 0, 5, '2023-01-14 15:32:34', '2023-01-14 15:32:54');
INSERT INTO `t_menu` VALUES (85, 73, 'B', '上传文章图片', NULL, NULL, NULL, 'blog:article:upload', 0, 0, 6, '2023-01-14 15:34:05', '2023-01-15 11:19:13');
INSERT INTO `t_menu` VALUES (86, 73, 'B', '置顶文章', NULL, NULL, NULL, 'blog:article:top', 0, 0, 7, '2023-01-14 15:35:33', NULL);
INSERT INTO `t_menu` VALUES (87, 73, 'B', '推荐文章', NULL, NULL, NULL, 'blog:article:recommend', 0, 0, 8, '2023-01-14 15:36:08', NULL);
INSERT INTO `t_menu` VALUES (88, 73, 'B', '点赞文章', NULL, NULL, NULL, 'blog:article:like', 0, 0, 9, '2023-01-14 15:36:39', NULL);
INSERT INTO `t_menu` VALUES (93, 21, 'C', '访问日志', 'visit', 'logininfor', '/system/log/visit', 'log:visit:list', 0, 0, 3, '2023-01-28 19:04:09', '2023-01-28 19:06:52');
INSERT INTO `t_menu` VALUES (94, 93, 'B', '删除访问日志', NULL, NULL, NULL, 'log:visit:delete', 0, 0, 1, '2023-01-28 19:05:31', NULL);
INSERT INTO `t_menu` VALUES (95, 14, 'B', '修改用户邮箱', NULL, NULL, NULL, 'user:email:update', 0, 0, 3, '2023-01-31 09:26:22', NULL);
INSERT INTO `t_menu` VALUES (96, 14, 'B', '修改用户头像', NULL, NULL, NULL, 'user:avatar:update', 0, 0, 4, '2023-01-31 09:27:03', NULL);
INSERT INTO `t_menu` VALUES (97, 14, 'B', '修改用户信息', NULL, NULL, NULL, 'user:info:update', 0, 0, 5, '2023-01-31 09:27:37', NULL);
INSERT INTO `t_menu` VALUES (98, 14, 'B', '修改用户密码', NULL, NULL, NULL, 'user:password:update', 0, 0, 6, '2023-01-31 09:28:10', NULL);
INSERT INTO `t_menu` VALUES (99, 38, 'B', '添加评论', NULL, NULL, NULL, 'news:comment:add', 0, 0, 1, '2023-02-08 19:09:25', NULL);
INSERT INTO `t_menu` VALUES (100, 38, 'B', '删除评论', NULL, NULL, NULL, 'news:comment:delete', 0, 0, 2, '2023-02-08 19:09:57', NULL);
INSERT INTO `t_menu` VALUES (101, 38, 'B', '审核评论', NULL, NULL, NULL, 'news:comment:pass', 0, 0, 3, '2023-02-08 19:10:26', NULL);
INSERT INTO `t_menu` VALUES (102, 38, 'B', '点赞评论', NULL, NULL, NULL, 'news:comment:like', 0, 0, 4, '2023-02-08 19:10:45', NULL);
INSERT INTO `t_menu` VALUES (103, 61, 'B', '点赞说说', NULL, NULL, NULL, 'web:talk:like', 0, 0, 6, '2023-02-10 11:16:23', NULL);
INSERT INTO `t_menu` VALUES (104, 21, 'C', '任务日志', 'task', 'job', '/system/log/task', 'log:task:list', 0, 0, 3, '2023-02-14 10:28:28', '2023-02-14 10:28:41');
INSERT INTO `t_menu` VALUES (105, 104, 'B', '删除任务日志', NULL, NULL, NULL, 'log:task:delete', 0, 0, 1, '2023-02-14 11:21:06', NULL);
INSERT INTO `t_menu` VALUES (106, 104, 'B', '清空任务日志', NULL, NULL, NULL, 'log:task:clear', 0, 0, 2, '2023-02-14 11:21:28', NULL);
INSERT INTO `t_menu` VALUES (108, 1, 'C', '发布文章', 'write', 'edit', '/blog/article/write', 'blog:article:list', 0, 0, 1, '2023-02-21 13:32:22', '2023-02-21 15:36:04');
INSERT INTO `t_menu` VALUES (111, 1, 'C', '修改文章', 'write/:articleId', 'edit', '/blog/article/write', 'blog:article:list', 1, 0, 5, '2023-02-21 15:40:11', '2023-02-21 15:41:07');

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '留言id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '头像',
  `message_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '留言内容',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ip',
  `ip_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户地址',
  `is_check` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否通过 (0否 1是)',
  `create_time` datetime NOT NULL COMMENT '留言时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '留言表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES (4, 'Gnaf', 'https://q1.qlogo.cn/g?b=qq&nk=1519467168&s=40', '测试', '223.146.142.215', '中国|湖南省|衡阳市|电信', 1, '2022-08-25 20:32:13', NULL);
INSERT INTO `t_message` VALUES (6, '彰', 'https://q1.qlogo.cn/g?b=qq&nk=981038470&s=40', '太强了', '39.144.168.207', '中国|移动', 1, '2022-08-25 21:21:51', NULL);
INSERT INTO `t_message` VALUES (7, '存于心', 'https://q1.qlogo.cn/g?b=qq&nk=2390885491&s=40', '牛蛙牛蛙', '171.34.214.142', '中国|江西省|南昌市|联通', 1, '2022-08-26 14:48:08', NULL);
INSERT INTO `t_message` VALUES (8, '游客', 'https://static.ttkwsd.top/config/0bca52afdb2b9998132355d716390c9f.png', '111', '27.38.212.223', '中国|广东省|深圳市|联通', 1, '2022-09-08 19:50:35', NULL);
INSERT INTO `t_message` VALUES (9, '游客', 'https://static.ttkwsd.top/config/0bca52afdb2b9998132355d716390c9f.png', 'nice', '171.34.215.57', '中国|江西省|南昌市|联通', 1, '2022-09-12 09:52:40', NULL);
INSERT INTO `t_message` VALUES (10, '游客', 'https://static.ttkwsd.top/config/0bca52afdb2b9998132355d716390c9f.png', '牛蛙', '58.37.10.147', '中国|上海|上海市|电信', 1, '2022-09-13 10:37:56', NULL);
INSERT INTO `t_message` VALUES (11, '游客', 'https://static.ttkwsd.top/config/0bca52afdb2b9998132355d716390c9f.png', '111', '114.93.24.95', '中国|上海|上海市|电信', 1, '2022-09-13 12:04:52', NULL);
INSERT INTO `t_message` VALUES (14, '游客', 'https://static.ttkwsd.top/config/0bca52afdb2b9998132355d716390c9f.png', 'hello', '223.104.22.206', '中国|广西|南宁市|移动', 1, '2022-09-15 19:04:03', NULL);
INSERT INTO `t_message` VALUES (15, '故人已往', 'http://thirdqq.qlogo.cn/g?b=oidb&k=pbicG5Ircgp6AfMhdYR3usA&s=40&t=1660705139', '加油', '117.162.73.5', '中国|江西省|吉安市|移动', 1, '2022-09-16 14:49:53', NULL);
INSERT INTO `t_message` VALUES (16, '故人已往', 'http://thirdqq.qlogo.cn/g?b=oidb&k=pbicG5Ircgp6AfMhdYR3usA&s=40&t=1660705139', '666', '117.162.73.5', '中国|江西省|吉安市|移动', 1, '2022-09-19 11:42:35', NULL);
INSERT INTO `t_message` VALUES (18, '游客', 'https://static.ttkwsd.top/config/0bca52afdb2b9998132355d716390c9f.png', '欢迎回访~ https://www.hqxiaozou.top/category/java', '116.22.180.131', '中国|广东省|广州市|电信', 1, '2022-09-22 14:21:57', NULL);
INSERT INTO `t_message` VALUES (28, '清晨、初阳', 'http://thirdqq.qlogo.cn/g?b=oidb&k=iaY7ulx7PZp2886QNMCZSOA&s=40&t=1551769321', '**', '171.113.123.31', '中国|湖北省|武汉市|电信', 1, '2022-11-08 23:36:17', NULL);
INSERT INTO `t_message` VALUES (40, '小宇宙', 'http://thirdqq.qlogo.cn/g?b=oidb&k=L1m1ugGEjUvppP71vvicgCQ&kti=Y4BEGgAAAAE&s=40&t=1632151073', '请问而放弃阿**的', '117.181.105.64', '中国|广西|南宁市|移动', 1, '2022-11-25 12:34:15', NULL);
INSERT INTO `t_message` VALUES (95, 'Galaxy灵韵', 'https://static.galaxylingyun.top/config/2c62bd7c76d8c64e1c47d31419abf32e.jpg', '测试留言111', '222.209.154.43', '中国|四川省|成都市|电信', 1, '2023-04-09 09:59:34', NULL);
INSERT INTO `t_message` VALUES (96, '游客', 'https://static.galaxylingyun.top/config/7a29bd7ba17b6b3ffcbc5f84713216b6.jpg', '游客留言测试000', '222.209.154.43', '中国|四川省|成都市|电信', 1, '2023-04-09 10:00:07', NULL);

-- ----------------------------
-- Table structure for t_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `t_operation_log`;
CREATE TABLE `t_operation_log`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '操作id',
  `module` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作模块',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作类型',
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作uri',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '方法名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作描述',
  `params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请求参数',
  `method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请求方式',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返回数据',
  `user_id` int NOT NULL COMMENT '用户id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作ip',
  `ip_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作地址',
  `times` int NOT NULL COMMENT '操作耗时 (毫秒)',
  `create_time` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1133 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_operation_log
-- ----------------------------
INSERT INTO `t_operation_log` VALUES (1116, '评论模块', '删除', '/admin/comment/delete', 'com.galaxy.controller.CommentController.deleteComment', '删除评论', '[[9]]', 'DELETE', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Galaxy灵韵', '222.209.154.43', '中国|四川省|成都市|电信', 14, '2023-04-09 09:54:09');
INSERT INTO `t_operation_log` VALUES (1117, '留言模块', '删除', '/admin/message/delete', 'com.galaxy.controller.MessageController.deleteMessage', '删除留言', '[[93,94,92,91,90,89,88,57,56,55]]', 'DELETE', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Galaxy灵韵', '222.209.154.43', '中国|四川省|成都市|电信', 15, '2023-04-09 09:57:25');
INSERT INTO `t_operation_log` VALUES (1118, '留言模块', '删除', '/admin/message/delete', 'com.galaxy.controller.MessageController.deleteMessage', '删除留言', '[[54,53,52,51,50,49,48,47,45,43]]', 'DELETE', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Galaxy灵韵', '222.209.154.43', '中国|四川省|成都市|电信', 15, '2023-04-09 09:57:32');
INSERT INTO `t_operation_log` VALUES (1119, '留言模块', '删除', '/admin/message/delete', 'com.galaxy.controller.MessageController.deleteMessage', '删除留言', '[[42,41,39,38,37,36,35,34,33]]', 'DELETE', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Galaxy灵韵', '222.209.154.43', '中国|四川省|成都市|电信', 13, '2023-04-09 09:57:44');
INSERT INTO `t_operation_log` VALUES (1120, '留言模块', '删除', '/admin/message/delete', 'com.galaxy.controller.MessageController.deleteMessage', '删除留言', '[[32,31,30,29,27,26,25,24]]', 'DELETE', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Galaxy灵韵', '222.209.154.43', '中国|四川省|成都市|电信', 12, '2023-04-09 09:57:59');
INSERT INTO `t_operation_log` VALUES (1121, '留言模块', '删除', '/admin/message/delete', 'com.galaxy.controller.MessageController.deleteMessage', '删除留言', '[[23,22,21,20,19,17]]', 'DELETE', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Galaxy灵韵', '222.209.154.43', '中国|四川省|成都市|电信', 27, '2023-04-09 09:58:12');
INSERT INTO `t_operation_log` VALUES (1122, '留言模块', '删除', '/admin/message/delete', 'com.galaxy.controller.MessageController.deleteMessage', '删除留言', '[[12,13]]', 'DELETE', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Galaxy灵韵', '222.209.154.43', '中国|四川省|成都市|电信', 13, '2023-04-09 09:58:40');
INSERT INTO `t_operation_log` VALUES (1123, '文章模块', '修改', '/admin/article/recommend', 'com.galaxy.controller.ArticleController.updateArticleRecommend', '推荐文章', '[{\"id\":68,\"isRecommend\":0}]', 'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Galaxy灵韵', '222.209.154.43', '中国|四川省|成都市|电信', 26, '2023-04-09 10:05:49');
INSERT INTO `t_operation_log` VALUES (1124, '菜单模块', '修改', '/admin/menu/update', 'com.galaxy.controller.MenuController.updateMenu', '修改菜单', '[{\"icon\":\"monitor\",\"id\":26,\"isDisable\":0,\"isHidden\":0,\"menuName\":\"运维监控\",\"menuType\":\"M\",\"orderNum\":6,\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\"}]', 'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Galaxy灵韵', '222.209.154.43', '中国|四川省|成都市|电信', 32, '2023-04-09 10:15:39');
INSERT INTO `t_operation_log` VALUES (1125, '友链模块', '修改', '/admin/friend/update', 'com.galaxy.controller.FriendController.updateFriend', '修改友链', '[{\"avatar\":\"https://static.ttkwsd.top/config/05409c1ed50047535f28a40464f7b1ab.jpg\",\"color\":\"#409EFF\",\"id\":18,\"introduction\":\"博客原创大佬\",\"name\":\"阿东\",\"url\":\"https://www.ttkwsd.top/\"}]', 'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Galaxy灵韵', '222.209.154.43', '中国|四川省|成都市|电信', 20, '2023-04-09 10:18:05');
INSERT INTO `t_operation_log` VALUES (1126, '分类模块', '修改', '/admin/category/update', 'com.galaxy.controller.CategoryController.updateCategory', '修改分类', '[{\"categoryName\":\"记录\",\"id\":72}]', 'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Galaxy灵韵', '222.209.154.43', '中国|四川省|成都市|电信', 15, '2023-04-09 10:26:16');
INSERT INTO `t_operation_log` VALUES (1127, '分类模块', '修改', '/admin/category/update', 'com.galaxy.controller.CategoryController.updateCategory', '修改分类', '[{\"categoryName\":\"TS/JS\",\"id\":53}]', 'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Galaxy灵韵', '222.209.154.43', '中国|四川省|成都市|电信', 15, '2023-04-09 10:27:45');
INSERT INTO `t_operation_log` VALUES (1128, '分类模块', '删除', '/admin/category/delete', 'com.galaxy.controller.CategoryController.deleteCategory', '删除分类', '[[52]]', 'DELETE', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Galaxy灵韵', '222.209.154.43', '中国|四川省|成都市|电信', 14, '2023-04-09 10:27:49');
INSERT INTO `t_operation_log` VALUES (1129, '分类模块', '删除', '/admin/category/delete', 'com.galaxy.controller.CategoryController.deleteCategory', '删除分类', '[[75]]', 'DELETE', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Galaxy灵韵', '222.209.154.43', '中国|四川省|成都市|电信', 9, '2023-04-09 10:28:04');
INSERT INTO `t_operation_log` VALUES (1130, '用户模块', '修改', '/admin/user/update', 'com.galaxy.controller.UserController.updateUser', '修改用户', '[{\"id\":18,\"nickname\":\"漪漪\",\"roleIdList\":[\"2\"]}]', 'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Galaxy灵韵', '222.209.154.43', '中国|四川省|成都市|电信', 432, '2023-04-09 18:35:37');
INSERT INTO `t_operation_log` VALUES (1131, '网站配置模块', '修改', '/admin/site/update', 'com.galaxy.controller.SiteConfigController.updateSiteConfig', '更新网站配置', '[{\"aboutMe\":\"🍀个人简介\\n\\n古风诗词，文学道系，二次元，轻音乐，笛箫，编程爱好者\\n\\n小白一枚，感谢大佬们的开源精神💖\",\"aliCode\":\"https://static.galaxylingyun.top/config/d941f120cdda262e4fa4c7ac7901a061.jpg\",\"articleCover\":\"https://static.galaxylingyun.top/config/a1b9b379ca122652c726430dc499cd91.jpg\",\"authorAvatar\":\"https://static.galaxylingyun.top/config/2c62bd7c76d8c64e1c47d31419abf32e.jpg\",\"bilibili\":\"https://space.bilibili.com/1453328266\",\"commentCheck\":0,\"createSiteTime\":\"2023-03-25\",\"emailNotice\":1,\"gitee\":\"https://gitee.com/galaxy99\",\"github\":\"https://github.com/galaxyrev\",\"id\":1,\"isMusic\":1,\"isReward\":0,\"loginList\":\",qq,gitee,github\",\"messageCheck\":0,\"musicId\":\"8284968319\",\"qq\":\"2310844975\",\"recordNumber\":\"蜀ICP备2023007531\",\"siteAddress\":\"https://www.galaxylingyun.top\",\"siteAuthor\":\"Galaxy灵韵\",\"siteIntro\":\"灵韵BLOG\",\"siteName\":\"Galaxy灵韵\",\"siteNotice\":\"网站公告：无！！！\",\"socialList\":\"gitee,bilibili,github,qq\",\"touristAvatar\":\"https://static.galaxylingyun.top/config/7a29bd7ba17b6b3ffcbc5f84713216b6.jpg\",\"userAvatar\":\"https://static.galaxylingyun.top/config/6a00d646f872d4976200c5c783d5bbf7.jpg\",\"weiXinCode\":\"https://static.galaxylingyun.top/config/53d2739c5bba4dd24bc870b17bf1732f.jpg\"}]', 'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Galaxy灵韵', '218.88.29.90', '中国|四川省|成都市|电信', 31, '2023-04-10 09:39:57');
INSERT INTO `t_operation_log` VALUES (1132, '网站配置模块', '修改', '/admin/site/update', 'com.galaxy.controller.SiteConfigController.updateSiteConfig', '更新网站配置', '[{\"aboutMe\":\"🍀个人简介\\n\\n古风诗词，文学道系，二次元，轻音乐，笛箫，编程爱好者\\n\\n小白一枚，感谢大佬们的开源精神💖\",\"aliCode\":\"https://static.galaxylingyun.top/config/d941f120cdda262e4fa4c7ac7901a061.jpg\",\"articleCover\":\"https://static.galaxylingyun.top/config/a1b9b379ca122652c726430dc499cd91.jpg\",\"authorAvatar\":\"https://static.galaxylingyun.top/config/2c62bd7c76d8c64e1c47d31419abf32e.jpg\",\"bilibili\":\"https://space.bilibili.com/1453328266\",\"commentCheck\":0,\"createSiteTime\":\"2023-04-08\",\"emailNotice\":1,\"gitee\":\"https://gitee.com/galaxy99\",\"github\":\"https://github.com/galaxyrev\",\"id\":1,\"isMusic\":1,\"isReward\":0,\"loginList\":\",qq,gitee,github\",\"messageCheck\":0,\"musicId\":\"8284968319\",\"qq\":\"2310844975\",\"recordNumber\":\"蜀ICP备2023007531\",\"siteAddress\":\"https://www.galaxylingyun.top\",\"siteAuthor\":\"Galaxy灵韵\",\"siteIntro\":\"灵韵BLOG：古风诗词，编程技术\",\"siteName\":\"Galaxy灵韵\",\"siteNotice\":\"网站公告：暂无！！！\",\"socialList\":\"gitee,bilibili,github,qq\",\"touristAvatar\":\"https://static.galaxylingyun.top/config/7a29bd7ba17b6b3ffcbc5f84713216b6.jpg\",\"userAvatar\":\"https://static.galaxylingyun.top/config/6a00d646f872d4976200c5c783d5bbf7.jpg\",\"weiXinCode\":\"https://static.galaxylingyun.top/config/53d2739c5bba4dd24bc870b17bf1732f.jpg\"}]', 'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Galaxy灵韵', '218.88.29.90', '中国|四川省|成都市|电信', 20, '2023-04-10 09:41:13');

-- ----------------------------
-- Table structure for t_photo
-- ----------------------------
DROP TABLE IF EXISTS `t_photo`;
CREATE TABLE `t_photo`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '照片id',
  `album_id` int NOT NULL COMMENT '相册id',
  `photo_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '照片名',
  `photo_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '照片描述',
  `photo_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '照片链接',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '照片管理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_photo
-- ----------------------------
INSERT INTO `t_photo` VALUES (14, 12, '1644673631684423682', NULL, 'https://static.galaxylingyun.top/photo/e3268b174b8ab85b4bbdaa40e312f964.png', '2023-04-08 20:08:46', NULL);
INSERT INTO `t_photo` VALUES (15, 12, '1644673632766554114', NULL, 'https://static.galaxylingyun.top/photo/12c92da60387668aa16e98f390dc3130.jpg', '2023-04-08 20:08:46', NULL);
INSERT INTO `t_photo` VALUES (18, 13, '1644674372041994242', NULL, 'https://static.galaxylingyun.top/photo/9676455ebdf9160bddcc977586b87a81.jpg', '2023-04-08 20:11:42', NULL);
INSERT INTO `t_photo` VALUES (19, 13, '1644674372041994243', NULL, 'https://static.galaxylingyun.top/photo/4fddf6725e912a0a043a11778f6cbc5e.jpg', '2023-04-08 20:11:42', NULL);
INSERT INTO `t_photo` VALUES (20, 13, '1644674372041994244', NULL, 'https://static.galaxylingyun.top/photo/aa4fb8ae46da9329675e320801324245.jpg', '2023-04-08 20:11:42', NULL);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
  `role_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色描述',
  `is_disable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用 (0否 1是)',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色管理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'admin', '管理员', 0, '2022-11-03 17:41:57', '2023-02-21 15:40:28');
INSERT INTO `t_role` VALUES ('2', 'user', '普通用户', 0, '2022-11-03 17:42:17', '2023-04-03 15:55:43');
INSERT INTO `t_role` VALUES ('3', 'test', '测试账号', 0, '2022-11-03 17:42:31', '2023-02-21 13:31:31');

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色id',
  `menu_id` int NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4631 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES (4041, '2', 1);
INSERT INTO `t_role_menu` VALUES (4042, '2', 3);
INSERT INTO `t_role_menu` VALUES (4043, '2', 4);
INSERT INTO `t_role_menu` VALUES (4044, '2', 36);
INSERT INTO `t_role_menu` VALUES (4045, '2', 38);
INSERT INTO `t_role_menu` VALUES (4046, '2', 99);
INSERT INTO `t_role_menu` VALUES (4047, '2', 102);
INSERT INTO `t_role_menu` VALUES (4048, '2', 37);
INSERT INTO `t_role_menu` VALUES (4049, '2', 11);
INSERT INTO `t_role_menu` VALUES (4050, '2', 12);
INSERT INTO `t_role_menu` VALUES (4051, '2', 60);
INSERT INTO `t_role_menu` VALUES (4052, '2', 13);
INSERT INTO `t_role_menu` VALUES (4053, '2', 14);
INSERT INTO `t_role_menu` VALUES (4054, '2', 95);
INSERT INTO `t_role_menu` VALUES (4055, '2', 96);
INSERT INTO `t_role_menu` VALUES (4056, '2', 97);
INSERT INTO `t_role_menu` VALUES (4057, '2', 98);
INSERT INTO `t_role_menu` VALUES (4058, '2', 21);
INSERT INTO `t_role_menu` VALUES (4059, '2', 22);
INSERT INTO `t_role_menu` VALUES (4060, '2', 23);
INSERT INTO `t_role_menu` VALUES (4061, '2', 93);
INSERT INTO `t_role_menu` VALUES (4062, '2', 26);
INSERT INTO `t_role_menu` VALUES (4063, '2', 53);
INSERT INTO `t_role_menu` VALUES (4064, '2', 27);
INSERT INTO `t_role_menu` VALUES (4065, '2', 34);
INSERT INTO `t_role_menu` VALUES (4066, '2', 35);
INSERT INTO `t_role_menu` VALUES (4067, '2', 61);
INSERT INTO `t_role_menu` VALUES (4068, '2', 65);
INSERT INTO `t_role_menu` VALUES (4069, '2', 51);
INSERT INTO `t_role_menu` VALUES (4070, '2', 57);
INSERT INTO `t_role_menu` VALUES (4071, '2', 52);
INSERT INTO `t_role_menu` VALUES (4072, '2', 46);
INSERT INTO `t_role_menu` VALUES (4073, '3', 1);
INSERT INTO `t_role_menu` VALUES (4074, '3', 3);
INSERT INTO `t_role_menu` VALUES (4075, '3', 4);
INSERT INTO `t_role_menu` VALUES (4076, '3', 36);
INSERT INTO `t_role_menu` VALUES (4077, '3', 38);
INSERT INTO `t_role_menu` VALUES (4078, '3', 37);
INSERT INTO `t_role_menu` VALUES (4079, '3', 11);
INSERT INTO `t_role_menu` VALUES (4080, '3', 12);
INSERT INTO `t_role_menu` VALUES (4081, '3', 60);
INSERT INTO `t_role_menu` VALUES (4082, '3', 13);
INSERT INTO `t_role_menu` VALUES (4083, '3', 14);
INSERT INTO `t_role_menu` VALUES (4084, '3', 21);
INSERT INTO `t_role_menu` VALUES (4085, '3', 22);
INSERT INTO `t_role_menu` VALUES (4086, '3', 23);
INSERT INTO `t_role_menu` VALUES (4087, '3', 104);
INSERT INTO `t_role_menu` VALUES (4088, '3', 93);
INSERT INTO `t_role_menu` VALUES (4089, '3', 26);
INSERT INTO `t_role_menu` VALUES (4090, '3', 53);
INSERT INTO `t_role_menu` VALUES (4091, '3', 27);
INSERT INTO `t_role_menu` VALUES (4092, '3', 34);
INSERT INTO `t_role_menu` VALUES (4093, '3', 35);
INSERT INTO `t_role_menu` VALUES (4094, '3', 61);
INSERT INTO `t_role_menu` VALUES (4095, '3', 65);
INSERT INTO `t_role_menu` VALUES (4096, '3', 51);
INSERT INTO `t_role_menu` VALUES (4097, '3', 57);
INSERT INTO `t_role_menu` VALUES (4098, '3', 52);
INSERT INTO `t_role_menu` VALUES (4099, '3', 46);
INSERT INTO `t_role_menu` VALUES (4542, '1', 1);
INSERT INTO `t_role_menu` VALUES (4543, '1', 108);
INSERT INTO `t_role_menu` VALUES (4544, '1', 73);
INSERT INTO `t_role_menu` VALUES (4545, '1', 80);
INSERT INTO `t_role_menu` VALUES (4546, '1', 81);
INSERT INTO `t_role_menu` VALUES (4547, '1', 82);
INSERT INTO `t_role_menu` VALUES (4548, '1', 83);
INSERT INTO `t_role_menu` VALUES (4549, '1', 84);
INSERT INTO `t_role_menu` VALUES (4550, '1', 85);
INSERT INTO `t_role_menu` VALUES (4551, '1', 86);
INSERT INTO `t_role_menu` VALUES (4552, '1', 87);
INSERT INTO `t_role_menu` VALUES (4553, '1', 88);
INSERT INTO `t_role_menu` VALUES (4554, '1', 3);
INSERT INTO `t_role_menu` VALUES (4555, '1', 5);
INSERT INTO `t_role_menu` VALUES (4556, '1', 6);
INSERT INTO `t_role_menu` VALUES (4557, '1', 7);
INSERT INTO `t_role_menu` VALUES (4558, '1', 4);
INSERT INTO `t_role_menu` VALUES (4559, '1', 8);
INSERT INTO `t_role_menu` VALUES (4560, '1', 9);
INSERT INTO `t_role_menu` VALUES (4561, '1', 10);
INSERT INTO `t_role_menu` VALUES (4562, '1', 111);
INSERT INTO `t_role_menu` VALUES (4563, '1', 36);
INSERT INTO `t_role_menu` VALUES (4564, '1', 38);
INSERT INTO `t_role_menu` VALUES (4565, '1', 99);
INSERT INTO `t_role_menu` VALUES (4566, '1', 100);
INSERT INTO `t_role_menu` VALUES (4567, '1', 101);
INSERT INTO `t_role_menu` VALUES (4568, '1', 102);
INSERT INTO `t_role_menu` VALUES (4569, '1', 37);
INSERT INTO `t_role_menu` VALUES (4570, '1', 42);
INSERT INTO `t_role_menu` VALUES (4571, '1', 45);
INSERT INTO `t_role_menu` VALUES (4572, '1', 11);
INSERT INTO `t_role_menu` VALUES (4573, '1', 12);
INSERT INTO `t_role_menu` VALUES (4574, '1', 15);
INSERT INTO `t_role_menu` VALUES (4575, '1', 16);
INSERT INTO `t_role_menu` VALUES (4576, '1', 17);
INSERT INTO `t_role_menu` VALUES (4577, '1', 60);
INSERT INTO `t_role_menu` VALUES (4578, '1', 13);
INSERT INTO `t_role_menu` VALUES (4579, '1', 18);
INSERT INTO `t_role_menu` VALUES (4580, '1', 19);
INSERT INTO `t_role_menu` VALUES (4581, '1', 20);
INSERT INTO `t_role_menu` VALUES (4582, '1', 33);
INSERT INTO `t_role_menu` VALUES (4583, '1', 14);
INSERT INTO `t_role_menu` VALUES (4584, '1', 69);
INSERT INTO `t_role_menu` VALUES (4585, '1', 70);
INSERT INTO `t_role_menu` VALUES (4586, '1', 21);
INSERT INTO `t_role_menu` VALUES (4587, '1', 22);
INSERT INTO `t_role_menu` VALUES (4588, '1', 24);
INSERT INTO `t_role_menu` VALUES (4589, '1', 23);
INSERT INTO `t_role_menu` VALUES (4590, '1', 25);
INSERT INTO `t_role_menu` VALUES (4591, '1', 93);
INSERT INTO `t_role_menu` VALUES (4592, '1', 94);
INSERT INTO `t_role_menu` VALUES (4593, '1', 104);
INSERT INTO `t_role_menu` VALUES (4594, '1', 105);
INSERT INTO `t_role_menu` VALUES (4595, '1', 106);
INSERT INTO `t_role_menu` VALUES (4596, '1', 26);
INSERT INTO `t_role_menu` VALUES (4597, '1', 53);
INSERT INTO `t_role_menu` VALUES (4598, '1', 71);
INSERT INTO `t_role_menu` VALUES (4599, '1', 27);
INSERT INTO `t_role_menu` VALUES (4600, '1', 28);
INSERT INTO `t_role_menu` VALUES (4601, '1', 29);
INSERT INTO `t_role_menu` VALUES (4602, '1', 30);
INSERT INTO `t_role_menu` VALUES (4603, '1', 31);
INSERT INTO `t_role_menu` VALUES (4604, '1', 32);
INSERT INTO `t_role_menu` VALUES (4605, '1', 34);
INSERT INTO `t_role_menu` VALUES (4606, '1', 35);
INSERT INTO `t_role_menu` VALUES (4607, '1', 39);
INSERT INTO `t_role_menu` VALUES (4608, '1', 40);
INSERT INTO `t_role_menu` VALUES (4609, '1', 41);
INSERT INTO `t_role_menu` VALUES (4610, '1', 61);
INSERT INTO `t_role_menu` VALUES (4611, '1', 62);
INSERT INTO `t_role_menu` VALUES (4612, '1', 63);
INSERT INTO `t_role_menu` VALUES (4613, '1', 64);
INSERT INTO `t_role_menu` VALUES (4614, '1', 65);
INSERT INTO `t_role_menu` VALUES (4615, '1', 66);
INSERT INTO `t_role_menu` VALUES (4616, '1', 103);
INSERT INTO `t_role_menu` VALUES (4617, '1', 51);
INSERT INTO `t_role_menu` VALUES (4618, '1', 54);
INSERT INTO `t_role_menu` VALUES (4619, '1', 55);
INSERT INTO `t_role_menu` VALUES (4620, '1', 56);
INSERT INTO `t_role_menu` VALUES (4621, '1', 57);
INSERT INTO `t_role_menu` VALUES (4622, '1', 58);
INSERT INTO `t_role_menu` VALUES (4623, '1', 52);
INSERT INTO `t_role_menu` VALUES (4624, '1', 76);
INSERT INTO `t_role_menu` VALUES (4625, '1', 77);
INSERT INTO `t_role_menu` VALUES (4626, '1', 78);
INSERT INTO `t_role_menu` VALUES (4627, '1', 79);
INSERT INTO `t_role_menu` VALUES (4628, '1', 46);
INSERT INTO `t_role_menu` VALUES (4629, '1', 67);
INSERT INTO `t_role_menu` VALUES (4630, '1', 68);

-- ----------------------------
-- Table structure for t_site_config
-- ----------------------------
DROP TABLE IF EXISTS `t_site_config`;
CREATE TABLE `t_site_config`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户头像',
  `tourist_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '游客头像',
  `site_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站名称',
  `site_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站地址',
  `site_intro` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站简介',
  `site_notice` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站公告',
  `create_site_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '建站日期',
  `record_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '备案号',
  `author_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '作者头像',
  `site_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站作者',
  `about_me` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '关于我',
  `github` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'Github',
  `gitee` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'Gitee',
  `bilibili` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '哔哩哔哩',
  `qq` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'QQ',
  `comment_check` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否评论审核 (0否 1是)',
  `message_check` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否留言审核 (0否 1是)',
  `is_reward` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否开启打赏 (0否 1是)',
  `wei_xin_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '微信二维码',
  `ali_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '支付宝二维码',
  `email_notice` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否邮箱通知 (0否 1是)',
  `social_list` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '社交列表',
  `login_list` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录方式',
  `is_music` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否开启音乐播放器 (0否 1是)',
  `music_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '网易云歌单id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `article_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章默认封面',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '网站配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_site_config
-- ----------------------------
INSERT INTO `t_site_config` VALUES (1, 'https://static.galaxylingyun.top/config/6a00d646f872d4976200c5c783d5bbf7.jpg', 'https://static.galaxylingyun.top/config/7a29bd7ba17b6b3ffcbc5f84713216b6.jpg', 'Galaxy灵韵', 'https://www.galaxylingyun.top', '灵韵BLOG：古风诗词，编程技术', '网站公告：暂无！！！', '2023-04-08', '蜀ICP备2023007531', 'https://static.galaxylingyun.top/config/2c62bd7c76d8c64e1c47d31419abf32e.jpg', 'Galaxy灵韵', '🍀个人简介\n\n古风诗词，文学道系，二次元，轻音乐，笛箫，编程爱好者\n\n小白一枚，感谢大佬们的开源精神💖', 'https://github.com/galaxyrev', 'https://gitee.com/galaxy99', 'https://space.bilibili.com/1453328266', '2310844975', 0, 0, 0, 'https://static.galaxylingyun.top/config/53d2739c5bba4dd24bc870b17bf1732f.jpg', 'https://static.galaxylingyun.top/config/d941f120cdda262e4fa4c7ac7901a061.jpg', 1, 'gitee,bilibili,github,qq', ',qq,gitee,github', 1, '8284968319', '2023-01-07 19:31:33', '2023-04-10 09:41:13', 'https://static.galaxylingyun.top/config/a1b9b379ca122652c726430dc499cd91.jpg');

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `tag_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标签名',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '标签表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_tag
-- ----------------------------
INSERT INTO `t_tag` VALUES (16, 'html', '2023-03-21 12:04:55', NULL);
INSERT INTO `t_tag` VALUES (17, 'css', '2023-03-21 12:05:02', NULL);
INSERT INTO `t_tag` VALUES (18, 'javascript', '2023-03-21 12:05:12', NULL);
INSERT INTO `t_tag` VALUES (19, 'vue', '2023-03-21 12:05:24', NULL);
INSERT INTO `t_tag` VALUES (20, 'react', '2023-03-21 12:05:31', NULL);
INSERT INTO `t_tag` VALUES (21, 'springboot', '2023-03-21 12:05:40', NULL);
INSERT INTO `t_tag` VALUES (22, 'sa-token', '2023-03-21 12:05:58', '2023-03-21 12:06:05');
INSERT INTO `t_tag` VALUES (23, 'mybatisplus', '2023-03-21 12:06:17', NULL);
INSERT INTO `t_tag` VALUES (24, 'redis', '2023-03-21 12:06:26', NULL);
INSERT INTO `t_tag` VALUES (25, 'rabbitmq', '2023-03-21 12:06:45', NULL);
INSERT INTO `t_tag` VALUES (26, '二次元', '2023-03-21 12:07:56', NULL);
INSERT INTO `t_tag` VALUES (27, '诗词', '2023-03-21 12:08:03', NULL);

-- ----------------------------
-- Table structure for t_talk
-- ----------------------------
DROP TABLE IF EXISTS `t_talk`;
CREATE TABLE `t_talk`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '说说id',
  `user_id` int NOT NULL COMMENT '用户id',
  `talk_content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '说说内容',
  `images` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '说说图片',
  `is_top` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否置顶 (0否 1是)',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 (1公开  2私密)',
  `create_time` datetime NOT NULL COMMENT '发表时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '说说表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_talk
-- ----------------------------
INSERT INTO `t_talk` VALUES (37, 1, '<img src=\"https://static.galaxylingyun.top/emoji/xxy.png\" width=\"24\" height=\"24\" alt=\"[星星眼]\" style=\"margin: 0 1px;vertical-align: text-bottom\">原神壁纸', '[\"https://static.galaxylingyun.top/talk/f5071bf9f8bb7ab3c54c9cd2c0b82715.png\",\"https://static.galaxylingyun.top/talk/9d828dad412f4c500591cb21f9c93fb5.png\"]', 1, 1, '2023-03-26 15:21:15', '2023-04-08 20:15:30');
INSERT INTO `t_talk` VALUES (38, 1, '<img src=\"https://static.galaxylingyun.top/emoji/geixx.png\" width=\"24\" height=\"24\" alt=\"[给心心]\" style=\"margin: 0 1px;vertical-align: text-bottom\">古风图片', '[\"https://static.galaxylingyun.top/talk/87480ce550c1a6a9202947bcd0d217c1.jpg\"]', 0, 1, '2023-03-26 15:21:51', '2023-04-08 20:15:20');

-- ----------------------------
-- Table structure for t_task
-- ----------------------------
DROP TABLE IF EXISTS `t_task`;
CREATE TABLE `t_task`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `task_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `task_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'cron执行表达式',
  `misfire_policy` tinyint(1) NOT NULL DEFAULT 3 COMMENT '计划执行错误策略 (1立即执行 2执行一次 3放弃执行)',
  `concurrent` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否并发执行 (0否 1是)',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '任务状态 (0运行 1暂停)',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务备注信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统任务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_task
-- ----------------------------
INSERT INTO `t_task` VALUES (4, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '0 0 0 * * ?', 3, 0, 0, '清除redis中游客记录', '2023-02-14 09:49:39', '2023-04-08 19:24:35');
INSERT INTO `t_task` VALUES (5, '测试任务', 'SYSTEM', 'timedTask.test', '0/10 * * * * ? ', 3, 0, 1, '测试任务', '2023-02-17 21:54:47', NULL);
INSERT INTO `t_task` VALUES (6, '清除访问日志', 'SYSTEM', 'timedTask.clearVistiLog', '0 0 2 * * ?', 3, 0, 0, '清除一周前的访问日志', '2023-04-08 19:24:12', NULL);

-- ----------------------------
-- Table structure for t_task_log
-- ----------------------------
DROP TABLE IF EXISTS `t_task_log`;
CREATE TABLE `t_task_log`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `task_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `task_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `task_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '日志信息',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '执行状态 (0失败 1正常)',
  `error_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '错误信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_task_log
-- ----------------------------
INSERT INTO `t_task_log` VALUES (20, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '清除每日游客访问记录 总共耗时：5毫秒', 1, NULL, '2023-04-10 00:00:00');
INSERT INTO `t_task_log` VALUES (21, '清除访问日志', 'SYSTEM', 'timedTask.clearVistiLog', '清除访问日志 总共耗时：21毫秒', 1, NULL, '2023-04-10 02:00:00');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户密码',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '头像',
  `web_site` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '个人网站',
  `intro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '个人简介',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '邮箱',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录ip',
  `ip_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地址',
  `login_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '登录方式 (1邮箱 2QQ 3Gitee 4Github)',
  `is_disable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用 (0否 1是)',
  `login_time` datetime NULL DEFAULT NULL COMMENT '登录时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'Galaxy灵韵', 'admin@qq.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'https://static.galaxylingyun.top/config/2c62bd7c76d8c64e1c47d31419abf32e.jpg', 'https://www.galaxylingyun.top', '个人简介', '2310844975@qq.com', '218.88.29.90', '中国|四川省|成都市|电信', 1, 0, '2023-04-10 09:35:53', '2023-02-10 21:45:48', '2023-04-10 09:35:53');
INSERT INTO `t_user` VALUES (3, '测试账号', 'test@qq.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'https://static.galaxylingyun.top/config/7a29bd7ba17b6b3ffcbc5f84713216b6.jpg', 'https://www.galaxylingyun.top', '个人简介', 'test@qq.com', '222.209.154.46', '中国|四川省|成都市|电信', 1, 0, '2023-04-09 22:47:32', '2023-02-10 21:34:26', '2023-04-09 22:47:32');
INSERT INTO `t_user` VALUES (15, '冰凝', '3294947923@qq.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'https://static.galaxylingyun.top/config/6a00d646f872d4976200c5c783d5bbf7.jpg', '', '', '3294947923@qq.com', '192.168.19.1', '内网IP|内网IP', 1, 0, '2023-04-03 20:33:02', '2023-04-03 20:33:01', '2023-04-03 20:50:20');
INSERT INTO `t_user` VALUES (16, '御辰', '10279252', '712ce003da1b52b3d62e0c45c4ef1297', 'https://foruda.gitee.com/avatar/1676810791514616675/10279252_bshgss_1676810791.png', '', '', '2310844975@qq.com', '222.209.154.43', '中国|四川省|成都市|电信', 3, 0, '2023-04-09 19:56:04', '2023-04-09 11:24:43', '2023-04-09 19:56:04');
INSERT INTO `t_user` VALUES (17, 'galaxyrev', '96897772', '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', 'https://avatars.githubusercontent.com/u/96897772?v=4', 'github御辰', '', '', '222.209.154.43', '中国|四川省|成都市|电信', 4, 0, '2023-04-09 19:17:25', '2023-04-09 11:43:36', '2023-04-09 19:18:02');
INSERT INTO `t_user` VALUES (18, '漪漪', '3178380280@qq.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'https://static.galaxylingyun.top/config/6a00d646f872d4976200c5c783d5bbf7.jpg', '', '', '3178380280@qq.com', '222.209.154.46', '中国|四川省|成都市|电信', 1, 0, '2023-04-09 22:57:33', '2023-04-09 18:34:03', '2023-04-09 22:57:33');
INSERT INTO `t_user` VALUES (19, '用户1645041869720092674', '2298632115@qq.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'https://static.galaxylingyun.top/config/6a00d646f872d4976200c5c783d5bbf7.jpg', '', '', '2298632115@qq.com', '117.61.9.83', '中国|四川省|成都市|电信', 1, 0, '2023-04-09 20:32:00', '2023-04-09 20:32:00', '2023-04-09 20:32:00');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int NOT NULL COMMENT '用户id',
  `role_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (29, 1, '1');
INSERT INTO `t_user_role` VALUES (36, 3, '3');
INSERT INTO `t_user_role` VALUES (49, 15, '2');
INSERT INTO `t_user_role` VALUES (50, 16, '2');
INSERT INTO `t_user_role` VALUES (51, 17, '2');
INSERT INTO `t_user_role` VALUES (53, 18, '2');
INSERT INTO `t_user_role` VALUES (54, 19, '2');

-- ----------------------------
-- Table structure for t_visit_log
-- ----------------------------
DROP TABLE IF EXISTS `t_visit_log`;
CREATE TABLE `t_visit_log`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `page` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问页面',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问ip',
  `ip_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问地址',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作系统',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浏览器',
  `create_time` datetime NOT NULL COMMENT '访问时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2734 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '访问日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_visit_log
-- ----------------------------
INSERT INTO `t_visit_log` VALUES (2554, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 10:49:44');
INSERT INTO `t_visit_log` VALUES (2555, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 10:50:09');
INSERT INTO `t_visit_log` VALUES (2556, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 11:09:19');
INSERT INTO `t_visit_log` VALUES (2557, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 11:10:16');
INSERT INTO `t_visit_log` VALUES (2558, '首页', '65.154.226.171', '美国|德克萨斯|达拉斯|CenturyLink', 'Linux ??', 'HeadlessChrome 111.0.5563.64', '2023-04-09 11:16:42');
INSERT INTO `t_visit_log` VALUES (2559, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 11:24:48');
INSERT INTO `t_visit_log` VALUES (2560, '首页', '205.169.39.173', '美国|CenturyLink', 'Windows 10', 'Chrome 79.0.3945.79', '2023-04-09 11:25:05');
INSERT INTO `t_visit_log` VALUES (2561, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 11:27:12');
INSERT INTO `t_visit_log` VALUES (2562, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 11:30:52');
INSERT INTO `t_visit_log` VALUES (2563, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 11:32:36');
INSERT INTO `t_visit_log` VALUES (2564, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 11:43:14');
INSERT INTO `t_visit_log` VALUES (2565, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 11:43:21');
INSERT INTO `t_visit_log` VALUES (2566, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 11:43:34');
INSERT INTO `t_visit_log` VALUES (2567, '首页', '120.244.206.109', '中国|北京|北京市|移动', 'Windows NT ??', 'Edge 112', '2023-04-09 12:15:37');
INSERT INTO `t_visit_log` VALUES (2568, '首页', '120.244.206.109', '中国|北京|北京市|移动', 'Windows NT ??', 'Edge 112', '2023-04-09 12:31:58');
INSERT INTO `t_visit_log` VALUES (2569, '首页', '120.244.206.109', '中国|北京|北京市|移动', 'Windows NT ??', 'Edge 112', '2023-04-09 12:32:16');
INSERT INTO `t_visit_log` VALUES (2570, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 14:06:06');
INSERT INTO `t_visit_log` VALUES (2571, '首页', '120.244.206.109', '中国|北京|北京市|移动', 'Windows NT ??', 'Edge 112', '2023-04-09 14:15:19');
INSERT INTO `t_visit_log` VALUES (2572, '首页', '111.7.100.27', '中国|河南省|郑州市|移动', 'Windows 10', 'Chrome 72.0.3626.119', '2023-04-09 14:45:22');
INSERT INTO `t_visit_log` VALUES (2573, '首页', '111.7.100.27', '中国|河南省|郑州市|移动', 'Windows 10', 'Chrome 72.0.3626.119', '2023-04-09 14:45:22');
INSERT INTO `t_visit_log` VALUES (2574, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 14:50:45');
INSERT INTO `t_visit_log` VALUES (2575, '首页', '172.22.64.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 110', '2023-04-09 15:22:32');
INSERT INTO `t_visit_log` VALUES (2576, '首页', '172.22.64.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 110', '2023-04-09 15:40:12');
INSERT INTO `t_visit_log` VALUES (2577, '首页', '120.244.206.109', '中国|北京|北京市|移动', 'Windows NT ??', 'Edge 112', '2023-04-09 15:42:27');
INSERT INTO `t_visit_log` VALUES (2578, '首页', '120.244.206.109', '中国|北京|北京市|移动', 'Windows NT ??', 'Edge 112', '2023-04-09 15:50:25');
INSERT INTO `t_visit_log` VALUES (2579, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 17:27:33');
INSERT INTO `t_visit_log` VALUES (2580, '首页', '120.244.206.109', '中国|北京|北京市|移动', 'Windows NT ??', 'Edge 112', '2023-04-09 17:32:28');
INSERT INTO `t_visit_log` VALUES (2581, '首页', '120.244.206.109', '中国|北京|北京市|移动', 'Windows NT ??', 'Edge 112', '2023-04-09 18:24:41');
INSERT INTO `t_visit_log` VALUES (2582, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 18:26:34');
INSERT INTO `t_visit_log` VALUES (2583, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 18:26:43');
INSERT INTO `t_visit_log` VALUES (2584, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 18:29:22');
INSERT INTO `t_visit_log` VALUES (2585, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 18:30:19');
INSERT INTO `t_visit_log` VALUES (2586, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 18:30:44');
INSERT INTO `t_visit_log` VALUES (2587, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 18:36:40');
INSERT INTO `t_visit_log` VALUES (2588, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 19:04:21');
INSERT INTO `t_visit_log` VALUES (2589, '归档', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 19:04:27');
INSERT INTO `t_visit_log` VALUES (2590, '归档', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 19:04:29');
INSERT INTO `t_visit_log` VALUES (2591, '首页', '171.34.214.239', '中国|江西省|南昌市|联通', 'Windows NT ??', 'Edge 112', '2023-04-09 19:11:09');
INSERT INTO `t_visit_log` VALUES (2592, '首页', '171.34.214.239', '中国|江西省|南昌市|联通', 'Windows NT ??', 'Edge 112', '2023-04-09 19:11:16');
INSERT INTO `t_visit_log` VALUES (2593, '友链', '171.34.214.239', '中国|江西省|南昌市|联通', 'Windows NT ??', 'Edge 112', '2023-04-09 19:11:18');
INSERT INTO `t_visit_log` VALUES (2594, '留言', '171.34.214.239', '中国|江西省|南昌市|联通', 'Windows NT ??', 'Edge 112', '2023-04-09 19:11:20');
INSERT INTO `t_visit_log` VALUES (2595, '说说列表', '171.34.214.239', '中国|江西省|南昌市|联通', 'Windows NT ??', 'Edge 112', '2023-04-09 19:12:07');
INSERT INTO `t_visit_log` VALUES (2596, '相册', '171.34.214.239', '中国|江西省|南昌市|联通', 'Windows NT ??', 'Edge 112', '2023-04-09 19:12:21');
INSERT INTO `t_visit_log` VALUES (2597, '照片', '171.34.214.239', '中国|江西省|南昌市|联通', 'Windows NT ??', 'Edge 112', '2023-04-09 19:12:22');
INSERT INTO `t_visit_log` VALUES (2598, '照片', '171.34.214.239', '中国|江西省|南昌市|联通', 'Windows NT ??', 'Edge 112', '2023-04-09 19:12:25');
INSERT INTO `t_visit_log` VALUES (2599, '文章标签', '171.34.214.239', '中国|江西省|南昌市|联通', 'Windows NT ??', 'Edge 112', '2023-04-09 19:12:34');
INSERT INTO `t_visit_log` VALUES (2600, '标签文章', '171.34.214.239', '中国|江西省|南昌市|联通', 'Windows NT ??', 'Edge 112', '2023-04-09 19:12:39');
INSERT INTO `t_visit_log` VALUES (2601, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 19:13:29');
INSERT INTO `t_visit_log` VALUES (2602, '文章', '171.34.214.239', '中国|江西省|南昌市|联通', 'Windows NT ??', 'Edge 112', '2023-04-09 19:13:58');
INSERT INTO `t_visit_log` VALUES (2603, '首页', '171.34.214.239', '中国|江西省|南昌市|联通', 'Windows NT ??', 'Edge 112', '2023-04-09 19:14:07');
INSERT INTO `t_visit_log` VALUES (2604, '文章', '171.34.214.239', '中国|江西省|南昌市|联通', 'Windows NT ??', 'Edge 112', '2023-04-09 19:14:12');
INSERT INTO `t_visit_log` VALUES (2605, '文章分类', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 19:14:24');
INSERT INTO `t_visit_log` VALUES (2606, '文章', '171.34.214.239', '中国|江西省|南昌市|联通', 'Windows NT ??', 'Edge 112', '2023-04-09 19:14:26');
INSERT INTO `t_visit_log` VALUES (2607, '留言', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 19:21:10');
INSERT INTO `t_visit_log` VALUES (2608, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 19:21:21');
INSERT INTO `t_visit_log` VALUES (2609, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 19:21:30');
INSERT INTO `t_visit_log` VALUES (2610, '友链', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 19:21:37');
INSERT INTO `t_visit_log` VALUES (2611, '首页', '171.34.214.239', '中国|江西省|南昌市|联通', 'Windows NT ??', 'Edge 112', '2023-04-09 19:23:24');
INSERT INTO `t_visit_log` VALUES (2612, '友链', '171.34.214.239', '中国|江西省|南昌市|联通', 'Windows NT ??', 'Edge 112', '2023-04-09 19:26:46');
INSERT INTO `t_visit_log` VALUES (2613, '首页', '171.34.214.239', '中国|江西省|南昌市|联通', 'Windows NT ??', 'Edge 112', '2023-04-09 19:27:57');
INSERT INTO `t_visit_log` VALUES (2614, '首页', '171.34.214.239', '中国|江西省|南昌市|联通', 'Windows NT ??', 'Edge 112', '2023-04-09 19:28:38');
INSERT INTO `t_visit_log` VALUES (2615, '文章', '171.34.214.239', '中国|江西省|南昌市|联通', 'Windows NT ??', 'Edge 112', '2023-04-09 19:29:07');
INSERT INTO `t_visit_log` VALUES (2616, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 19:38:19');
INSERT INTO `t_visit_log` VALUES (2617, '说说列表', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 19:38:22');
INSERT INTO `t_visit_log` VALUES (2618, '文章分类', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 19:38:26');
INSERT INTO `t_visit_log` VALUES (2619, '留言', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 19:39:04');
INSERT INTO `t_visit_log` VALUES (2620, '留言', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 19:52:12');
INSERT INTO `t_visit_log` VALUES (2621, '说说列表', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 19:52:26');
INSERT INTO `t_visit_log` VALUES (2622, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 19:52:30');
INSERT INTO `t_visit_log` VALUES (2623, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 19:52:37');
INSERT INTO `t_visit_log` VALUES (2624, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 19:53:06');
INSERT INTO `t_visit_log` VALUES (2625, '归档', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 19:55:04');
INSERT INTO `t_visit_log` VALUES (2626, '归档', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 19:55:15');
INSERT INTO `t_visit_log` VALUES (2627, '友链', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 19:55:19');
INSERT INTO `t_visit_log` VALUES (2628, '友链', '222.209.154.43', '中国|四川省|成都市|电信', 'Android 6', 'Chrome 110', '2023-04-09 19:56:03');
INSERT INTO `t_visit_log` VALUES (2629, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Android 6', 'Chrome 110', '2023-04-09 19:56:13');
INSERT INTO `t_visit_log` VALUES (2630, '说说列表', '222.209.154.43', '中国|四川省|成都市|电信', 'Android 6', 'Chrome 110', '2023-04-09 19:58:55');
INSERT INTO `t_visit_log` VALUES (2631, '相册', '222.209.154.43', '中国|四川省|成都市|电信', 'Android 6', 'Chrome 110', '2023-04-09 19:58:58');
INSERT INTO `t_visit_log` VALUES (2632, '照片', '222.209.154.43', '中国|四川省|成都市|电信', 'Android 6', 'Chrome 110', '2023-04-09 19:59:01');
INSERT INTO `t_visit_log` VALUES (2633, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 20:04:50');
INSERT INTO `t_visit_log` VALUES (2634, '归档', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 20:05:09');
INSERT INTO `t_visit_log` VALUES (2635, '文章分类', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 20:05:15');
INSERT INTO `t_visit_log` VALUES (2636, '文章标签', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 20:05:20');
INSERT INTO `t_visit_log` VALUES (2637, '说说列表', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 20:05:23');
INSERT INTO `t_visit_log` VALUES (2638, '相册', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 20:05:24');
INSERT INTO `t_visit_log` VALUES (2639, '友链', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 20:05:26');
INSERT INTO `t_visit_log` VALUES (2640, '留言', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 20:05:29');
INSERT INTO `t_visit_log` VALUES (2641, '归档', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 20:06:12');
INSERT INTO `t_visit_log` VALUES (2642, '首页', '222.209.154.43', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 20:06:51');
INSERT INTO `t_visit_log` VALUES (2643, '首页', '223.104.220.233', '中国|四川省|成都市|移动', 'Android 12', 'WeChat 8.0.34.2340', '2023-04-09 20:07:46');
INSERT INTO `t_visit_log` VALUES (2644, '首页', '223.104.220.233', '中国|四川省|成都市|移动', 'Android 12', 'WeChat 8.0.34.2340', '2023-04-09 20:07:57');
INSERT INTO `t_visit_log` VALUES (2645, '首页', '223.104.220.233', '中国|四川省|成都市|移动', 'Android 12', 'WeChat 8.0.34.2340', '2023-04-09 20:08:00');
INSERT INTO `t_visit_log` VALUES (2646, '文章', '223.104.220.233', '中国|四川省|成都市|移动', 'Android 12', 'WeChat 8.0.34.2340', '2023-04-09 20:08:02');
INSERT INTO `t_visit_log` VALUES (2647, '首页', '223.104.220.233', '中国|四川省|成都市|移动', 'Android 12', 'WeChat 8.0.34.2340', '2023-04-09 20:08:44');
INSERT INTO `t_visit_log` VALUES (2648, '首页', '223.104.220.233', '中国|四川省|成都市|移动', 'Android 12', 'WeChat 8.0.34.2340', '2023-04-09 20:10:19');
INSERT INTO `t_visit_log` VALUES (2649, '归档', '223.104.220.233', '中国|四川省|成都市|移动', 'Android 12', 'WeChat 8.0.34.2340', '2023-04-09 20:10:26');
INSERT INTO `t_visit_log` VALUES (2650, '文章分类', '223.104.220.233', '中国|四川省|成都市|移动', 'Android 12', 'WeChat 8.0.34.2340', '2023-04-09 20:10:29');
INSERT INTO `t_visit_log` VALUES (2651, '文章标签', '223.104.220.233', '中国|四川省|成都市|移动', 'Android 12', 'WeChat 8.0.34.2340', '2023-04-09 20:10:30');
INSERT INTO `t_visit_log` VALUES (2652, '首页', '223.104.248.11', '中国|重庆|重庆市|移动', 'iOS 15', 'SP-engine 2.68.0', '2023-04-09 20:11:32');
INSERT INTO `t_visit_log` VALUES (2653, '首页', '223.104.220.233', '中国|四川省|成都市|移动', 'Android 12', 'WeChat 8.0.34.2340', '2023-04-09 20:11:57');
INSERT INTO `t_visit_log` VALUES (2654, '留言', '223.104.220.233', '中国|四川省|成都市|移动', 'Android 12', 'WeChat 8.0.34.2340', '2023-04-09 20:12:05');
INSERT INTO `t_visit_log` VALUES (2655, '首页', '223.104.220.233', '中国|四川省|成都市|移动', 'Android 12', 'WeChat 8.0.34.2340', '2023-04-09 20:15:30');
INSERT INTO `t_visit_log` VALUES (2656, '首页', '223.104.220.233', '中国|四川省|成都市|移动', 'Android 12', 'WeChat 8.0.34.2340', '2023-04-09 20:15:36');
INSERT INTO `t_visit_log` VALUES (2657, '首页', '223.104.220.233', '中国|四川省|成都市|移动', 'Android 12', 'WeChat 8.0.34.2340', '2023-04-09 20:17:54');
INSERT INTO `t_visit_log` VALUES (2658, '首页', '223.104.220.233', '中国|四川省|成都市|移动', 'Android 12', 'WeChat 8.0.34.2340', '2023-04-09 20:17:58');
INSERT INTO `t_visit_log` VALUES (2659, '归档', '223.104.220.233', '中国|四川省|成都市|移动', 'Android 12', 'WeChat 8.0.34.2340', '2023-04-09 20:18:04');
INSERT INTO `t_visit_log` VALUES (2660, '文章标签', '223.104.220.233', '中国|四川省|成都市|移动', 'Android 12', 'WeChat 8.0.34.2340', '2023-04-09 20:18:07');
INSERT INTO `t_visit_log` VALUES (2661, '说说列表', '223.104.220.233', '中国|四川省|成都市|移动', 'Android 12', 'WeChat 8.0.34.2340', '2023-04-09 20:18:10');
INSERT INTO `t_visit_log` VALUES (2662, '相册', '223.104.220.233', '中国|四川省|成都市|移动', 'Android 12', 'WeChat 8.0.34.2340', '2023-04-09 20:18:12');
INSERT INTO `t_visit_log` VALUES (2663, '友链', '223.104.220.233', '中国|四川省|成都市|移动', 'Android 12', 'WeChat 8.0.34.2340', '2023-04-09 20:18:27');
INSERT INTO `t_visit_log` VALUES (2664, '留言', '223.104.220.233', '中国|四川省|成都市|移动', 'Android 12', 'WeChat 8.0.34.2340', '2023-04-09 20:18:51');
INSERT INTO `t_visit_log` VALUES (2665, '首页', '117.61.9.83', '中国|四川省|成都市|电信', 'Windows 7', 'WeChat 7.0.20.1781', '2023-04-09 20:23:34');
INSERT INTO `t_visit_log` VALUES (2666, '首页', '223.104.220.233', '中国|四川省|成都市|移动', 'Android 12', 'WeChat 8.0.34.2340', '2023-04-09 20:26:35');
INSERT INTO `t_visit_log` VALUES (2667, '首页', '223.104.220.233', '中国|四川省|成都市|移动', 'Android 12', 'WeChat 8.0.34.2340', '2023-04-09 20:26:40');
INSERT INTO `t_visit_log` VALUES (2668, '首页', '117.61.9.83', '中国|四川省|成都市|电信', 'Windows 7', 'WeChat 7.0.20.1781', '2023-04-09 20:28:08');
INSERT INTO `t_visit_log` VALUES (2669, '首页', '117.61.9.83', '中国|四川省|成都市|电信', 'Windows 7', 'WeChat 7.0.20.1781', '2023-04-09 20:33:55');
INSERT INTO `t_visit_log` VALUES (2670, '留言', '117.61.9.83', '中国|四川省|成都市|电信', 'Windows 7', 'WeChat 7.0.20.1781', '2023-04-09 20:34:19');
INSERT INTO `t_visit_log` VALUES (2671, '友链', '117.61.9.83', '中国|四川省|成都市|电信', 'Windows 7', 'WeChat 7.0.20.1781', '2023-04-09 20:36:13');
INSERT INTO `t_visit_log` VALUES (2672, '说说列表', '117.61.9.83', '中国|四川省|成都市|电信', 'Windows 7', 'WeChat 7.0.20.1781', '2023-04-09 20:36:55');
INSERT INTO `t_visit_log` VALUES (2673, '首页', '222.209.154.46', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 22:46:38');
INSERT INTO `t_visit_log` VALUES (2674, '首页', '222.209.154.46', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 22:46:47');
INSERT INTO `t_visit_log` VALUES (2675, '首页', '222.209.154.46', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 22:46:49');
INSERT INTO `t_visit_log` VALUES (2676, '归档', '222.209.154.46', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 22:46:52');
INSERT INTO `t_visit_log` VALUES (2677, '归档', '222.209.154.46', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 22:46:54');
INSERT INTO `t_visit_log` VALUES (2678, '说说列表', '222.209.154.46', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 22:46:57');
INSERT INTO `t_visit_log` VALUES (2679, '相册', '222.209.154.46', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 22:47:02');
INSERT INTO `t_visit_log` VALUES (2680, '友链', '222.209.154.46', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 22:47:04');
INSERT INTO `t_visit_log` VALUES (2681, '留言', '222.209.154.46', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-09 22:47:08');
INSERT INTO `t_visit_log` VALUES (2682, '首页', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 22:55:26');
INSERT INTO `t_visit_log` VALUES (2683, '首页', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 22:56:02');
INSERT INTO `t_visit_log` VALUES (2684, '首页', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 22:56:05');
INSERT INTO `t_visit_log` VALUES (2685, '友链', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 22:57:50');
INSERT INTO `t_visit_log` VALUES (2686, '相册', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 22:57:54');
INSERT INTO `t_visit_log` VALUES (2687, '文章分类', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 22:58:01');
INSERT INTO `t_visit_log` VALUES (2688, '归档', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 22:58:40');
INSERT INTO `t_visit_log` VALUES (2689, '文章', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 22:58:42');
INSERT INTO `t_visit_log` VALUES (2690, '文章', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 22:58:44');
INSERT INTO `t_visit_log` VALUES (2691, '文章', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 22:58:48');
INSERT INTO `t_visit_log` VALUES (2692, '留言', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 22:59:21');
INSERT INTO `t_visit_log` VALUES (2693, '文章标签', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 22:59:36');
INSERT INTO `t_visit_log` VALUES (2694, '分类文章', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 23:00:41');
INSERT INTO `t_visit_log` VALUES (2695, '文章', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 23:00:46');
INSERT INTO `t_visit_log` VALUES (2696, '照片', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 23:01:08');
INSERT INTO `t_visit_log` VALUES (2697, '说说列表', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 23:01:11');
INSERT INTO `t_visit_log` VALUES (2698, '归档', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 23:01:16');
INSERT INTO `t_visit_log` VALUES (2699, '归档', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 23:01:18');
INSERT INTO `t_visit_log` VALUES (2700, '首页', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 23:01:30');
INSERT INTO `t_visit_log` VALUES (2701, '首页', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 23:04:55');
INSERT INTO `t_visit_log` VALUES (2702, '首页', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 23:05:55');
INSERT INTO `t_visit_log` VALUES (2703, '归档', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 23:06:48');
INSERT INTO `t_visit_log` VALUES (2704, '归档', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 23:06:50');
INSERT INTO `t_visit_log` VALUES (2705, '归档', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 23:06:52');
INSERT INTO `t_visit_log` VALUES (2706, '归档', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 23:06:53');
INSERT INTO `t_visit_log` VALUES (2707, '归档', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 23:06:56');
INSERT INTO `t_visit_log` VALUES (2708, '归档', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 23:06:57');
INSERT INTO `t_visit_log` VALUES (2709, '首页', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 23:09:43');
INSERT INTO `t_visit_log` VALUES (2710, '首页', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 23:10:18');
INSERT INTO `t_visit_log` VALUES (2711, '首页', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 23:10:21');
INSERT INTO `t_visit_log` VALUES (2712, '首页', '222.209.154.46', '中国|四川省|成都市|电信', 'iOS 16', 'WeChat 8.0.34', '2023-04-09 23:11:16');
INSERT INTO `t_visit_log` VALUES (2713, '首页', '111.7.100.22', '中国|河南省|郑州市|移动', 'Windows 10', 'Chrome 72.0.3626.119', '2023-04-10 05:14:45');
INSERT INTO `t_visit_log` VALUES (2714, '首页', '111.7.100.22', '中国|河南省|郑州市|移动', 'Windows 10', 'Chrome 72.0.3626.119', '2023-04-10 05:14:49');
INSERT INTO `t_visit_log` VALUES (2715, '分类文章', '111.7.100.21', '中国|河南省|郑州市|移动', 'Windows 10', 'Chrome 72.0.3626.119', '2023-04-10 05:17:44');
INSERT INTO `t_visit_log` VALUES (2716, '分类文章', '111.7.100.20', '中国|河南省|郑州市|移动', 'Windows 10', 'Chrome 72.0.3626.119', '2023-04-10 05:17:48');
INSERT INTO `t_visit_log` VALUES (2717, '文章', '111.7.100.21', '中国|河南省|郑州市|移动', 'Windows 10', 'Chrome 72.0.3626.119', '2023-04-10 05:18:07');
INSERT INTO `t_visit_log` VALUES (2718, '文章', '111.7.100.21', '中国|河南省|郑州市|移动', 'Windows 10', 'Chrome 72.0.3626.119', '2023-04-10 05:18:10');
INSERT INTO `t_visit_log` VALUES (2719, '分类文章', '36.99.136.139', '中国|河南省|郑州市|电信', 'Windows 10', 'Chrome 72.0.3626.119', '2023-04-10 05:21:41');
INSERT INTO `t_visit_log` VALUES (2720, '文章分类', '111.7.100.26', '中国|河南省|郑州市|移动', 'Windows 10', 'Chrome 72.0.3626.119', '2023-04-10 05:24:49');
INSERT INTO `t_visit_log` VALUES (2721, '文章', '36.99.136.132', '中国|河南省|郑州市|电信', 'Windows 10', 'Chrome 72.0.3626.119', '2023-04-10 05:24:57');
INSERT INTO `t_visit_log` VALUES (2722, '首页', '223.104.220.233', '中国|四川省|成都市|移动', 'Android 12', 'WeChat 8.0.34.2340', '2023-04-10 08:39:54');
INSERT INTO `t_visit_log` VALUES (2723, '首页', '223.104.220.233', '中国|四川省|成都市|移动', 'Android 12', 'WeChat 8.0.34.2340', '2023-04-10 08:40:38');
INSERT INTO `t_visit_log` VALUES (2724, '说说列表', '223.104.220.233', '中国|四川省|成都市|移动', 'Android 12', 'WeChat 8.0.34.2340', '2023-04-10 08:40:48');
INSERT INTO `t_visit_log` VALUES (2725, '首页', '218.88.29.90', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-10 09:16:11');
INSERT INTO `t_visit_log` VALUES (2726, '归档', '218.88.29.90', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-10 09:16:17');
INSERT INTO `t_visit_log` VALUES (2727, '留言', '218.88.29.90', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-10 09:31:52');
INSERT INTO `t_visit_log` VALUES (2728, '首页', '218.88.29.90', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-10 09:32:28');
INSERT INTO `t_visit_log` VALUES (2729, '文章', '218.88.29.90', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-10 09:32:34');
INSERT INTO `t_visit_log` VALUES (2730, '归档', '218.88.29.90', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-10 09:41:34');
INSERT INTO `t_visit_log` VALUES (2731, '首页', '218.88.29.90', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-10 09:41:36');
INSERT INTO `t_visit_log` VALUES (2732, '留言', '218.88.29.90', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-10 09:42:15');
INSERT INTO `t_visit_log` VALUES (2733, '留言', '218.88.29.90', '中国|四川省|成都市|电信', 'Windows NT ??', 'Chrome 110', '2023-04-10 09:42:32');

SET FOREIGN_KEY_CHECKS = 1;
