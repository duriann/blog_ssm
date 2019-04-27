/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2019-04-27 22:07:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `level` int(5) DEFAULT NULL COMMENT '层级',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级id',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES ('1', '用户管理', '0', null, '2019-03-27 11:11:51', '2019-03-27 11:11:55', '/user');
INSERT INTO `admin_menu` VALUES ('2', '用户列表', '1', '1', '2019-03-27 11:12:09', '2019-03-27 11:12:14', '/user/list');
INSERT INTO `admin_menu` VALUES ('3', '文章管理', '0', null, '2019-03-27 11:12:47', '2019-03-27 11:12:51', '/article');
INSERT INTO `admin_menu` VALUES ('4', '新增文章', '1', '3', '2019-03-27 11:13:25', '2019-03-27 11:13:30', '/article/add');
INSERT INTO `admin_menu` VALUES ('5', '文章列表', '1', '3', '2019-03-27 11:13:46', '2019-03-27 11:13:49', '/article/list');

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `author` varchar(20) DEFAULT NULL COMMENT '作者',
  `comment_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '评论',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '内容',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `category_id` int(10) DEFAULT NULL COMMENT '分类',
  `head_img` varchar(255) DEFAULT NULL COMMENT '文章的主图',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', 'test', 'admin', null, '<p><img src=\"http://localhost:8080//statics/images/WX20190320-125533@2x.png\" style=\"\" width=\"569\"></p><p>dadsadas</p>', '2019-03-29 14:52:09', '2019-03-29 14:52:09', '2', 'http://localhost:8080//statics/images/WX20190320-125533@2x.png');
INSERT INTO `article` VALUES ('3', 'aaa', 'admin', null, '<p>aaadasdasdadadasdasjJdkljaldjadldlJdl林科大建档立卡教大家胜利大街圣诞节拉三等奖了撒娇的拉萨的加拉涉及到洛杉矶的垃圾达拉斯基多拉时间到了撒娇的代课教师电话卡回单卡会打瞌睡的开奖号道具卡回单卡换端口客家话啊数据库很大声的空间撒谎的撒谎的蝴蝶结凯撒红就开始爱迪生奥斯卡级氨基酸等哈三季度哈师大哈师大哈师大had哈课后答案开始等哈看的哈看得开sdasjdkajdjalksjdlasjdasjalksdjaa</p>', '2019-03-29 14:30:39', '2019-03-29 14:30:39', '5', null);
INSERT INTO `article` VALUES ('4', '打豆豆', 'admin', null, '<p>的都</p>', '2019-03-30 16:18:52', '2019-03-30 16:18:54', '2', null);
INSERT INTO `article` VALUES ('5', 'dads', 'admin', null, '<p>ds</p>', '2019-03-14 16:18:55', '2019-03-30 16:18:58', '6', null);
INSERT INTO `article` VALUES ('6', 'vv', 'admin', null, '<p>v</p>', '2019-03-04 16:18:59', '2019-03-30 16:19:01', '6', null);
INSERT INTO `article` VALUES ('7', 'dasdasdsadsadas', 'admin', null, '<p>sdsda</p>', '2019-03-26 16:19:02', '2019-03-30 16:19:05', '6', null);
INSERT INTO `article` VALUES ('8', '心力憔悴的一次webpack4 抽离.vue文件中的css文件', 'admin', null, '<p><a href=\"https://vue-loader.vuejs.org/zh/guide/extract-css.html#webpack-4\" target=\"_blank\" style=\"color: rgb(0, 56, 132);\">https://vue-loader.vuejs.org/zh/guide/extract-css.html#webpack-4</a></p><p>一开始参考官方文档的时候</p><p>由于我是分模块的  误以为要讲这个新的rules 配置在webpack.prod.js中</p><p>是这样的： </p><p><img src=\"http://localhost:8080//statics/images/1.png\" style=\"\" width=\"849\"></p><p>此时能抽离出import \'./index.less\' 这种形式的css出来，但是.vue中的css无法抽离，而且会出现莫名其妙的错误,</p><p>然后折腾process.env.NODE_ENV,</p><p>看官方文档 只要有设置mode, 下面就能通过process.env.NODE_ENV获取到，但是一直没有效果，</p><p>然后尝试在package.json中 使用NODE_ENV=production 也没有效果，</p><p>后来发现是mac设置环境变量  需要使用export NODE_ENV=production </p><p>于是：</p><p><img src=\"http://localhost:8080//statics/images/2.png\" style=\"\" width=\"573\"></p><p>然后根据官方文档上的那样 在webpack.base.js中设置一下，</p><p>竟然好了。。。</p><p><img src=\"http://localhost:8080//statics/images/3.png\" style=\"\" width=\"642\"></p><p><img src=\"http://localhost:8080//statics/images/4.png\" style=\"cursor: nesw-resize;\" width=\"434\"></p><p><br></p>', '2019-03-31 16:19:09', '2019-03-30 16:19:12', '6', null);
INSERT INTO `article` VALUES ('9', '将redis命令添加到path中', 'admin', null, '<p><span style=\"color: rgb(79, 79, 79); background-color: rgb(255, 255, 255);\">由于redis-cli命令没有设置到PATH中, 每次想使用时, 都需要执行find命令去找这个命令在哪里</span></p><p><br></p><ol><li><span style=\"background-color: rgb(255, 255, 255);\">#&nbsp;find&nbsp;/&nbsp;-name&nbsp;redis-cli&nbsp;&nbsp;</span></li></ol><p><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);\">找到之后, 再执行命令, 这样实在太麻烦</span></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><span style=\"color: rgb(79, 79, 79); background-color: rgb(255, 255, 255);\">解决方案:</span></p><p class=\"ql-align-justify\"><span style=\"color: rgb(79, 79, 79); background-color: rgb(255, 255, 255);\">将redis-cli命令配置到PATH中, 这样每次使用时, 就像ls这种命令一样不加路径执行</span></p><p><br></p><ol><li><span style=\"background-color: rgb(255, 255, 255);\">#&nbsp;vi&nbsp;~/.bash_profile&nbsp;&nbsp;</span></li></ol><p><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);\">将redis-cli命令路径配置到PATH中</span></p><p><br></p><ol><li><span style=\"background-color: rgb(255, 255, 255);\">PATH=$PATH:$HOME/bin:/usr/local/redis-3.2.8/src/&nbsp;&nbsp;</span></li></ol><p><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);\">保存之后, 使用source命令使之生效</span></p><p><br></p><ol><li><span style=\"background-color: rgb(255, 255, 255);\">#&nbsp;source&nbsp;~/.bash_profile&nbsp;&nbsp;</span></li></ol><p><br></p>', '2019-03-31 16:19:13', '2019-03-30 16:19:17', '6', null);
INSERT INTO `article` VALUES ('10', '啥？', 'admin', null, '<p><img src=\"https://user-gold-cdn.xitu.io/2019/3/26/169b78f9c88afd7c?imageView2/0/w/1280/h/960/format/webp/ignore-error/1\"></p><p>sha?</p>', '2019-03-19 16:19:18', '2019-03-30 16:19:21', '6', null);
INSERT INTO `article` VALUES ('11', 'sss', 'admin', null, '<p class=\"ql-align-justify\">fff</p><p class=\"ql-align-justify\">da</p><p class=\"ql-align-justify\">das</p><p class=\"ql-align-justify\">da</p><p class=\"ql-align-justify\">da</p><p class=\"ql-align-justify\">dada</p><p class=\"ql-align-justify\">d</p><p class=\"ql-align-justify\">ad</p><p class=\"ql-align-justify\">ad</p><p class=\"ql-align-justify\">sd</p><p class=\"ql-align-justify\">asda</p><p class=\"ql-align-justify\">da</p><p class=\"ql-align-justify\">da</p><p class=\"ql-align-justify\">dada</p><p class=\"ql-align-justify\">da</p><p class=\"ql-align-justify\">da</p><p class=\"ql-align-justify\">d</p>', '2019-03-31 16:18:39', '2019-03-30 16:18:43', '5', null);
INSERT INTO `article` VALUES ('12', '什么鬼', 'admin', null, '<p>。。。迷</p>', null, null, '2', null);
INSERT INTO `article` VALUES ('13', 'test', 'admin', null, '<p><img src=\"http://localhost:7777//statics/images/logo.png\" style=\"\" width=\"98\">test</p>', null, null, '6', null);
INSERT INTO `article` VALUES ('14', '测试一下啦', 'admin', null, '<p><img src=\"http://localhost:7777//statics/images/321.png\" style=\"\" width=\"477\"></p><p>感觉还行</p><p>挺好用的</p><p><a href=\"http://127.0.0.1:9999/#/archives/5\" target=\"_blank\">http://127.0.0.1:9999/#/archives/5</a></p><p><br></p>', null, null, '6', null);

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `isNav` int(2) DEFAULT '0' COMMENT '鏄惁鏄疦av瀵艰埅 0 涓嶆槸 1鏄? 什么鬼',
  `name` varchar(10) DEFAULT NULL COMMENT '分类名称',
  `level` int(5) DEFAULT NULL COMMENT '层级',
  `sort` int(3) DEFAULT NULL,
  `parent_id` int(10) DEFAULT NULL COMMENT '上级分类id',
  `create_ime` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '/backend', '0', '后端开发', '0', '3', null, '2019-03-28 10:44:41', '2019-03-28 10:44:45');
INSERT INTO `category` VALUES ('2', '/java', '0', 'java', '1', '7', '1', '2019-03-28 10:45:00', '2019-03-28 10:45:03');
INSERT INTO `category` VALUES ('3', '/frontend', '0', '前端开发', '0', '2', null, '2019-03-28 10:45:36', '2019-03-28 10:45:40');
INSERT INTO `category` VALUES ('4', '/vue', '0', 'vue', '1', '6', '3', '2019-03-28 10:45:59', '2019-03-28 10:46:03');
INSERT INTO `category` VALUES ('5', '/react', '0', 'react', '1', '5', '3', '2019-03-28 10:46:16', '2019-03-28 10:46:20');
INSERT INTO `category` VALUES ('6', '/suixiang', '0', '个人随想', '0', '4', null, '2019-03-28 10:47:01', '2019-03-28 10:47:04');
INSERT INTO `category` VALUES ('7', '/home', '1', '网站首页', '0', '1', null, '2019-04-27 18:25:47', '2019-04-27 18:25:50');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `article_id` int(10) DEFAULT NULL COMMENT '文章id',
  `user_id` int(10) DEFAULT NULL COMMENT '评论人id',
  `parent_id` int(10) DEFAULT NULL COMMENT '父级评论',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '当前评论用户名',
  `parent_name` varchar(10) DEFAULT NULL COMMENT '父级评论用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('24', '9', '1', null, '厉害啦', '2019-04-16 17:09:32', '2019-04-16 17:09:32', 'admin', null);
INSERT INTO `comment` VALUES ('25', '9', '1', null, '厉害了。。', '2019-04-16 17:11:03', '2019-04-16 17:11:03', 'admin', null);
INSERT INTO `comment` VALUES ('26', '9', '1', null, '喜欢', '2019-04-16 17:12:05', '2019-04-16 17:12:05', 'admin', null);
INSERT INTO `comment` VALUES ('27', '9', '1', null, '珂珂', '2019-04-16 17:13:57', '2019-04-16 17:13:57', 'admin', null);
INSERT INTO `comment` VALUES ('28', '10', '1', null, '厉害啦', '2019-04-19 17:32:35', '2019-04-19 17:32:35', 'admin', null);
INSERT INTO `comment` VALUES ('29', '10', '1', null, '哈哈哈', '2019-04-19 17:41:44', '2019-04-19 17:41:44', 'admin', null);
INSERT INTO `comment` VALUES ('30', '3', '1', null, '哎哎哎', '2019-04-20 10:38:42', '2019-04-20 10:38:42', 'admin', null);
INSERT INTO `comment` VALUES ('31', '3', '1', '30', '123', '2019-04-20 10:38:50', '2019-04-20 10:38:50', 'admin', 'admin');
INSERT INTO `comment` VALUES ('32', '3', '1', '30', '@admin 345', '2019-04-20 10:38:57', '2019-04-20 10:38:57', 'admin', 'admin');
INSERT INTO `comment` VALUES ('33', '3', '1', null, '啊啊', '2019-04-20 11:14:55', '2019-04-20 11:14:55', 'admin', 'admin');
INSERT INTO `comment` VALUES ('34', '9', '1', '24', '123', '2019-04-21 20:22:21', '2019-04-21 20:22:21', 'admin', 'admin');

-- ----------------------------
-- Table structure for `file`
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件路径',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES ('4', 'WX20190320-125533@2x.png', 'statics/images/WX20190320-125533@2x.png', null, null);
INSERT INTO `file` VALUES ('5', 'WX20190320-125533@2x.png', 'statics/images/WX20190320-125533@2x.png', null, null);
INSERT INTO `file` VALUES ('6', 'logo.png', 'statics/images/logo.png', null, null);
INSERT INTO `file` VALUES ('7', 'WX20190320-125533@2x.png', 'statics/images/WX20190320-125533@2x.png', null, null);
INSERT INTO `file` VALUES ('8', '1.png', 'statics/images/1.png', null, null);
INSERT INTO `file` VALUES ('9', '2.png', 'statics/images/2.png', null, null);
INSERT INTO `file` VALUES ('10', '3.png', 'statics/images/3.png', null, null);
INSERT INTO `file` VALUES ('11', '4.png', 'statics/images/4.png', null, null);
INSERT INTO `file` VALUES ('12', '321.png', 'statics/images/321.png', null, null);
INSERT INTO `file` VALUES ('13', 'logo.png', 'statics/images/logo.png', null, null);
INSERT INTO `file` VALUES ('14', 'logo.png', 'statics/images/logo.png', null, null);
INSERT INTO `file` VALUES ('15', 'logo.png', 'statics/images/logo.png', '2019-04-16 17:30:08', '2019-04-16 17:30:08');
INSERT INTO `file` VALUES ('16', '321.png', 'statics/images/321.png', '2019-04-20 15:01:38', '2019-04-20 15:01:38');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` varchar(32) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `nickname` varchar(30) DEFAULT NULL,
  `realpwd` varchar(255) DEFAULT NULL COMMENT '真实密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '3cf37ebc14874fd4a83f80dbf14363d6', 'admin', '28018c3efee5c747d5390951d1350ffe', '2019-03-25 12:53:48', '2019-03-25 12:53:52', null, 'admin');
