/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 11/05/2019 12:04:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `level` int(5) DEFAULT NULL COMMENT '层级',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `path` varchar(255) DEFAULT NULL,
  `sort` int(3) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
BEGIN;
INSERT INTO `admin_menu` VALUES (1, '用户管理', 0, NULL, '2019-03-27 11:11:51', '2019-05-08 20:09:31', '/user', 1);
INSERT INTO `admin_menu` VALUES (2, '用户列表', 1, 1, '2019-03-27 11:12:09', '2019-05-08 20:09:33', '/user/list', 2);
INSERT INTO `admin_menu` VALUES (3, '文章管理', 0, NULL, '2019-03-27 11:12:47', '2019-05-08 20:09:35', '/article', 3);
INSERT INTO `admin_menu` VALUES (4, '新增文章', 1, 3, '2019-03-27 11:13:25', '2019-05-08 20:09:44', '/article/add', 5);
INSERT INTO `admin_menu` VALUES (5, '文章列表', 1, 3, '2019-03-27 11:13:46', '2019-05-08 20:09:45', '/article/list', 4);
INSERT INTO `admin_menu` VALUES (6, '分类管理', 0, NULL, '2019-05-08 15:43:39', '2019-05-08 20:09:49', '/category', 6);
INSERT INTO `admin_menu` VALUES (7, '分类列表', 1, 6, '2019-05-08 15:44:13', '2019-05-08 20:09:50', '/category/list', 7);
COMMIT;

-- ----------------------------
-- Table structure for article
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
  `total_comment` int(11) DEFAULT '0' COMMENT '这列不存数据 用来给mybatis获取数据的。。',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
BEGIN;
INSERT INTO `article` VALUES (1, 'test', 'admin', NULL, '<p><img src=\"http://localhost:8080//statics/images/WX20190320-125533@2x.png\" style=\"\" width=\"569\"></p><p>dadsadas</p>', '2019-03-29 14:52:09', '2019-03-29 14:52:09', 2, 'http://localhost:8080//statics/images/WX20190320-125533@2x.png', NULL);
INSERT INTO `article` VALUES (3, 'aaa', 'admin', NULL, '<p>aaadasdasdadadasdasjJdkljaldjadldlJdl林科大建档立卡教大家胜利大街圣诞节拉三等奖了撒娇的拉萨的加拉涉及到洛杉矶的垃圾达拉斯基多拉时间到了撒娇的代课教师电话卡回单卡会打瞌睡的开奖号道具卡回单卡换端口客家话啊数据库很大声的空间撒谎的撒谎的蝴蝶结凯撒红就开始爱迪生奥斯卡级氨基酸等哈三季度哈师大哈师大哈师大had哈课后答案开始等哈看的哈看得开sdasjdkajdjalksjdlasjdasjalksdjaa</p>', '2019-03-29 14:30:39', '2019-03-29 14:30:39', 5, NULL, NULL);
INSERT INTO `article` VALUES (4, '打豆豆', 'admin', NULL, '<p>的都</p>', '2019-03-30 16:18:52', '2019-03-30 16:18:54', 2, NULL, NULL);
INSERT INTO `article` VALUES (5, 'dads', 'admin', NULL, '<p>ds</p>', '2019-03-14 16:18:55', '2019-03-30 16:18:58', 6, NULL, NULL);
INSERT INTO `article` VALUES (6, 'vv', 'admin', NULL, '<p>v</p>', '2019-03-04 16:18:59', '2019-03-30 16:19:01', 6, NULL, NULL);
INSERT INTO `article` VALUES (7, 'dasdasdsadsadas', 'admin', NULL, '<p>sdsda</p>', '2019-03-26 16:19:02', '2019-03-30 16:19:05', 6, NULL, NULL);
INSERT INTO `article` VALUES (8, '心力憔悴的一次webpack4 抽离.vue文件中的css文件', 'admin', NULL, '<p><a href=\"https://vue-loader.vuejs.org/zh/guide/extract-css.html#webpack-4\" target=\"_blank\" style=\"color: rgb(0, 56, 132);\">https://vue-loader.vuejs.org/zh/guide/extract-css.html#webpack-4</a></p><p>一开始参考官方文档的时候</p><p>由于我是分模块的  误以为要讲这个新的rules 配置在webpack.prod.js中</p><p>是这样的： </p><p><img src=\"http://localhost:8080//statics/images/1.png\" style=\"\" width=\"849\"></p><p>此时能抽离出import \'./index.less\' 这种形式的css出来，但是.vue中的css无法抽离，而且会出现莫名其妙的错误,</p><p>然后折腾process.env.NODE_ENV,</p><p>看官方文档 只要有设置mode, 下面就能通过process.env.NODE_ENV获取到，但是一直没有效果，</p><p>然后尝试在package.json中 使用NODE_ENV=production 也没有效果，</p><p>后来发现是mac设置环境变量  需要使用export NODE_ENV=production </p><p>于是：</p><p><img src=\"http://localhost:8080//statics/images/2.png\" style=\"\" width=\"573\"></p><p>然后根据官方文档上的那样 在webpack.base.js中设置一下，</p><p>竟然好了。。。</p><p><img src=\"http://localhost:8080//statics/images/3.png\" style=\"\" width=\"642\"></p><p><img src=\"http://localhost:8080//statics/images/4.png\" style=\"cursor: nesw-resize;\" width=\"434\"></p><p><br></p>', '2019-03-31 16:19:09', '2019-03-30 16:19:12', 6, NULL, NULL);
INSERT INTO `article` VALUES (9, '将redis命令添加到path中', 'admin', NULL, '<p><span style=\"color: rgb(79, 79, 79); background-color: rgb(255, 255, 255);\">由于redis-cli命令没有设置到PATH中, 每次想使用时, 都需要执行find命令去找这个命令在哪里</span></p><p><br></p><ol><li><span style=\"background-color: rgb(255, 255, 255);\">#&nbsp;find&nbsp;/&nbsp;-name&nbsp;redis-cli&nbsp;&nbsp;</span></li></ol><p><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);\">找到之后, 再执行命令, 这样实在太麻烦</span></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><span style=\"color: rgb(79, 79, 79); background-color: rgb(255, 255, 255);\">解决方案:</span></p><p class=\"ql-align-justify\"><span style=\"color: rgb(79, 79, 79); background-color: rgb(255, 255, 255);\">将redis-cli命令配置到PATH中, 这样每次使用时, 就像ls这种命令一样不加路径执行</span></p><p><br></p><ol><li><span style=\"background-color: rgb(255, 255, 255);\">#&nbsp;vi&nbsp;~/.bash_profile&nbsp;&nbsp;</span></li></ol><p><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);\">将redis-cli命令路径配置到PATH中</span></p><p><br></p><ol><li><span style=\"background-color: rgb(255, 255, 255);\">PATH=$PATH:$HOME/bin:/usr/local/redis-3.2.8/src/&nbsp;&nbsp;</span></li></ol><p><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);\">保存之后, 使用source命令使之生效</span></p><p><br></p><ol><li><span style=\"background-color: rgb(255, 255, 255);\">#&nbsp;source&nbsp;~/.bash_profile&nbsp;&nbsp;</span></li></ol><p><br></p>', '2019-03-31 16:19:13', '2019-03-30 16:19:17', 6, NULL, NULL);
INSERT INTO `article` VALUES (10, '啥？', 'admin', NULL, '<p><img src=\"https://user-gold-cdn.xitu.io/2019/3/26/169b78f9c88afd7c?imageView2/0/w/1280/h/960/format/webp/ignore-error/1\"></p><p>sha?</p>', '2019-03-19 16:19:18', '2019-03-30 16:19:21', 6, NULL, NULL);
INSERT INTO `article` VALUES (11, 'sss', 'admin', NULL, '<p class=\"ql-align-justify\">fff</p><p class=\"ql-align-justify\">da</p><p class=\"ql-align-justify\">das</p><p class=\"ql-align-justify\">da</p><p class=\"ql-align-justify\">da</p><p class=\"ql-align-justify\">dada</p><p class=\"ql-align-justify\">d</p><p class=\"ql-align-justify\">ad</p><p class=\"ql-align-justify\">ad</p><p class=\"ql-align-justify\">sd</p><p class=\"ql-align-justify\">asda</p><p class=\"ql-align-justify\">da</p><p class=\"ql-align-justify\">da</p><p class=\"ql-align-justify\">dada</p><p class=\"ql-align-justify\">da</p><p class=\"ql-align-justify\">da</p><p class=\"ql-align-justify\">d</p>', '2019-03-31 16:18:39', '2019-03-30 16:18:43', 5, NULL, NULL);
INSERT INTO `article` VALUES (12, '什么鬼', 'admin', NULL, '<p>。。。迷</p>', NULL, NULL, 2, NULL, NULL);
INSERT INTO `article` VALUES (13, 'test', 'admin', NULL, '<p><img src=\"http://localhost:7777//statics/images/logo.png\" style=\"\" width=\"98\">test</p>', NULL, NULL, 6, NULL, NULL);
INSERT INTO `article` VALUES (14, '测试一下啦', 'admin', NULL, '<p><img src=\"http://localhost:7777//statics/images/321.png\" style=\"\" width=\"477\"></p><p>感觉还行</p><p>挺好用的</p><p><a href=\"http://127.0.0.1:9999/#/archives/5\" target=\"_blank\">http://127.0.0.1:9999/#/archives/5</a></p><p><br></p>', NULL, NULL, 6, NULL, NULL);
INSERT INTO `article` VALUES (15, 'test code block', 'admin', NULL, '<p><span style=\"color: rgb(198, 120, 221);\">async</span> <span style=\"color: rgb(97, 175, 239);\">getCategory</span>() {</p><p>      <span style=\"color: rgb(198, 120, 221);\">if</span> (<span style=\"color: rgb(229, 192, 123);\">this</span>.<span style=\"color: rgb(224, 108, 117);\">$store</span>.<span style=\"color: rgb(224, 108, 117);\">state</span>.<span style=\"color: rgb(224, 108, 117);\">category</span>.<span style=\"color: rgb(224, 108, 117);\">length</span> <span style=\"color: rgb(86, 182, 194);\">===</span> <span style=\"color: rgb(209, 154, 102);\">0</span>) {</p><p>        <span style=\"color: rgb(198, 120, 221);\">await</span> <span style=\"color: rgb(229, 192, 123);\">this</span>.<span style=\"color: rgb(224, 108, 117);\">$store</span>.<span style=\"color: rgb(97, 175, 239);\">dispatch</span>(<span style=\"color: rgb(152, 195, 121);\">\'getCategory\'</span>)</p><p>      }</p><pre class=\"ql-syntax\" spellcheck=\"false\">\npineapple:~ user$ ls -la\n</pre><p><br></p><p><br></p>', '2019-04-29 18:43:17', '2019-04-29 18:43:17', 6, NULL, NULL);
INSERT INTO `article` VALUES (16, '无聊', 'admin', NULL, '<pre class=\"ql-syntax\" spellcheck=\"false\">&lt;template&gt;\n  &lt;div class=\"pagination\"&gt;\n    &lt;ul&gt;\n      &lt;li class=\"prev\" v-if=\"currentPage!==1\" @click=\"handerChange(--currentPage)\"&gt;\n        &lt;span&gt;上一页&lt;/span&gt;\n      &lt;/li&gt;\n      &lt;li :class=\"1 === currentPage? \'current\': \'\'\"&gt;\n        &lt;span @click=\"handerChange(1)\"&gt;1&lt;/span&gt;\n      &lt;/li&gt;\n      &lt;li v-if=\"leftellipsis\"&gt;\n        &lt;span&gt;...&lt;/span&gt;\n      &lt;/li&gt;\n      &lt;li v-for=\"num in pages\" :key=\"num\" :class=\"num === currentPage? \'current\': \'\'\"&gt;\n        &lt;span @click=\"handerChange(num)\"&gt;{{num}}&lt;/span&gt;\n      &lt;/li&gt;\n      &lt;li v-if=\"rightellipsis\"&gt;\n        &lt;span&gt;...&lt;/span&gt;\n      &lt;/li&gt;\n      &lt;li class=\"next\" v-if=\"currentPage!==totalPage\" @click=\"handerChange(++currentPage)\"&gt;\n        &lt;span&gt;下一页&lt;/span&gt;\n      &lt;/li&gt;\n    &lt;/ul&gt;\n  &lt;/div&gt;\n&lt;/template&gt;\n&lt;script&gt;\nexport default {\n  props: {\n    totalCount: Number,\n    pageSize: Number\n  },\n  data() {\n    return {\n      currentPage: 1,\n      totalShow: 4\n    }\n  },\n  methods: {\n    handerChange(currentPage) {\n      this.currentPage = currentPage\n      //触发父组件事件 将currentPage传回去\n      this.$emit(\'current-change\', this.currentPage)\n    }\n  },\n  computed: {\n    rightellipsis() {\n      let totalPage = Math.ceil(this.totalCount / this.pageSize)\n\n\n      let { currentPage, totalShow } = this\n      if (totalPage &gt; totalShow &amp;&amp; currentPage + totalShow &lt; totalPage) {\n        return true\n      }\n      return false\n    },\n    leftellipsis() {\n      if (this.currentPage &gt; 2 &amp;&amp; this.totalPage &gt; this.totalShow + 1) {\n        console.log(123)\n        return true\n      }\n\n\n      return false\n    },\n    totalPage() {\n      return Math.ceil(this.totalCount / this.pageSize)\n    },\n    pages() {\n      let page = []\n      let { totalShow, currentPage } = this\n      let length = 0\n      let totalPage = Math.ceil(this.totalCount / this.pageSize)\n\n\n      if (totalPage &lt;= totalShow) {\n        length = totalPage\n      } else {\n        length = totalShow + currentPage\n      }\n      if (length &gt; totalPage) {\n        length = totalPage\n      }\n      if (length &lt;= totalPage) {\n        if (currentPage + totalShow &gt;= totalPage) {\n          currentPage = totalPage - totalShow &lt; 1 ? 1 : totalPage - totalShow\n        }\n        for (let i = currentPage === 1 ? 2 : currentPage; i &lt;= length; i++) {\n          page.push(i)\n        }\n      }\n\n\n      console.log(page)\n      return page\n    }\n  }\n}\n&lt;/script&gt;\n&lt;style lang=\"less\" scoped&gt;\n.pagination {\n  background-color: #fff;\n  margin-top: 10px;\n  padding: 10px;\n  ul {\n    display: flex;\n    justify-content: center;\n    align-items: center;\n  }\n  li {\n    margin: 0 3px;\n    background-color: #eee;\n    &amp;.current {\n      background-color: #00a67c;\n      color: #fff;\n    }\n    span {\n      display: block;\n      cursor: pointer;\n      padding: 4px 12px 3px;\n      &amp;:hover {\n        background-color: #6fc299;\n        color: #fff;\n      }\n    }\n  }\n}\n&lt;/style&gt;\n</pre>', '2019-05-03 10:18:45', '2019-05-03 10:18:45', 6, NULL, NULL);
INSERT INTO `article` VALUES (17, 'test', 'admin', NULL, '<pre class=\"ql-syntax\" spellcheck=\"false\">import Vue from \'vue\'\nimport Vuex from \'vuex\'\nimport App from \'./App.vue\'\nimport router from \'./router/index\'\n\n\nimport ElementUI from \'element-ui\'\nimport \'highlight.js/styles/xcode.css\'\nimport \'./assets/reset.css\'\nimport \'./assets/fonts/iconfont.css\'\n// import \'element-ui/lib/theme-chalk/index.css\'; 使用cdn的时候不需要导入样式\nimport http from \'@/utils/Http\'\nimport store from \'./vuex/store\'\n\n\nVue.use(ElementUI)\nVue.use(Vuex)\nVue.prototype.$http = http\n\n\nrouter.beforeEach((to, from, next) =&gt; {\n  // 给每个路由传递一个name参数\n  to.params.name = to.name\n  \n  next()\n})\nnew Vue({\n  el: \'#app\',\n  store,\n  render: h =&gt; h(App),\n  router\n})\n</pre>', '2019-05-03 10:30:52', '2019-05-03 10:30:52', 6, NULL, NULL);
INSERT INTO `article` VALUES (18, 'zzz', 'admin', NULL, '<pre class=\"ql-syntax\" spellcheck=\"false\">import Vue from \'vue\'\nimport Vuex from \'vuex\'\nimport App from \'./App.vue\'\nimport router from \'./router/index\'\n\n\nimport ElementUI from \'element-ui\'\nimport \'highlight.js/styles/xcode.css\'\nimport \'./assets/reset.css\'\nimport \'./assets/fonts/iconfont.css\'\n// import \'element-ui/lib/theme-chalk/index.css\'; 使用cdn的时候不需要导入样式\nimport http from \'@/utils/Http\'\nimport store from \'./vuex/store\'\n\n\nVue.use(ElementUI)\nVue.use(Vuex)\nVue.prototype.$http = http\n\n\nrouter.beforeEach((to, from, next) =&gt; {\n  // 给每个路由传递一个name参数\n  to.params.name = to.name\n  \n  next()\n})\nnew Vue({\n  el: \'#app\',\n  store,\n  render: h =&gt; h(App),\n  router\n})\n</pre>', '2019-05-03 10:37:48', '2019-05-03 10:37:48', 6, NULL, NULL);
INSERT INTO `article` VALUES (19, 'test', 'admin', NULL, '<pre class=\"ql-syntax\" spellcheck=\"false\"><span class=\"hljs-comment\">/**\n * Custom module for quilljs to allow user to drag images from their file system into the editor\n * and paste images from clipboard (Works on Chrome, Firefox, Edge, not on Safari)\n * <span class=\"hljs-doctag\">@see</span> https://quilljs.com/blog/building-a-custom-module/\n */</span>\nexport <span class=\"hljs-keyword\">default</span> <span class=\"hljs-class\"><span class=\"hljs-keyword\">class</span> <span class=\"hljs-title\">ImageDrop</span> </span>{\n\n\n&nbsp;&nbsp;<span class=\"hljs-comment\">/**\n&nbsp;&nbsp; * Instantiate the module given a quill instance and any options\n&nbsp;&nbsp; * <span class=\"hljs-doctag\">@param</span> {Quill} quill\n&nbsp;&nbsp; * <span class=\"hljs-doctag\">@param</span> {Object} options\n&nbsp;&nbsp; */</span>\n&nbsp;&nbsp;<span class=\"hljs-keyword\">constructor</span>(quill, options = {}) {\n&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-comment\">// save the quill reference</span>\n&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-keyword\">this</span>.quill = quill;\n&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-comment\">// bind handlers to this instance</span>\n&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-keyword\">this</span>.handleDrop = <span class=\"hljs-keyword\">this</span>.handleDrop.bind(<span class=\"hljs-keyword\">this</span>);\n&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-keyword\">this</span>.handlePaste = <span class=\"hljs-keyword\">this</span>.handlePaste.bind(<span class=\"hljs-keyword\">this</span>);\n&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-comment\">// listen for drop and paste events</span>\n&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-keyword\">this</span>.quill.root.addEventListener(<span class=\"hljs-string\">\'drop\'</span>, <span class=\"hljs-keyword\">this</span>.handleDrop, <span class=\"hljs-literal\">false</span>);\n&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-keyword\">this</span>.quill.root.addEventListener(<span class=\"hljs-string\">\'paste\'</span>, <span class=\"hljs-keyword\">this</span>.handlePaste, <span class=\"hljs-literal\">false</span>);\n&nbsp;&nbsp;}\n\n\n&nbsp;&nbsp;<span class=\"hljs-comment\">/**\n&nbsp;&nbsp; * Handler for drop event to read dropped files from evt.dataTransfer\n&nbsp;&nbsp; * <span class=\"hljs-doctag\">@param</span> {Event} evt\n&nbsp;&nbsp; */</span>\n&nbsp;&nbsp;handleDrop(evt) {\n&nbsp;&nbsp;&nbsp;&nbsp;evt.preventDefault();\n&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-keyword\">if</span> (evt.dataTransfer &amp;&amp; evt.dataTransfer.files &amp;&amp; evt.dataTransfer.files.length) {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-keyword\">if</span> (document.caretRangeFromPoint) {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-keyword\">const</span> selection = document.getSelection();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-keyword\">const</span> range = document.caretRangeFromPoint(evt.clientX, evt.clientY);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-keyword\">if</span> (selection &amp;&amp; range) {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;selection.setBaseAndExtent(range.startContainer, range.startOffset, range.startContainer, range.startOffset);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-keyword\">this</span>.readFiles(evt.dataTransfer.files, <span class=\"hljs-keyword\">this</span>.insert.bind(<span class=\"hljs-keyword\">this</span>));\n&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;}\n\n\n&nbsp;&nbsp;<span class=\"hljs-comment\">/**\n&nbsp;&nbsp; * Handler for paste event to read pasted files from evt.clipboardData\n&nbsp;&nbsp; * <span class=\"hljs-doctag\">@param</span> {Event} evt\n&nbsp;&nbsp; */</span>\n&nbsp;&nbsp;handlePaste(evt) {\n&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-keyword\">if</span> (evt.clipboardData &amp;&amp; evt.clipboardData.items &amp;&amp; evt.clipboardData.items.length) {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-keyword\">this</span>.readFiles(evt.clipboardData.items, dataUrl =&gt; {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-keyword\">const</span> selection = <span class=\"hljs-keyword\">this</span>.quill.getSelection();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-keyword\">if</span> (selection) {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-comment\">// we must be in a browser that supports pasting (like Firefox)</span>\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-comment\">// so it has already been placed into the editor</span>\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-keyword\">else</span> {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-comment\">// otherwise we wait until after the paste when this.quill.getSelection()</span>\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-comment\">// will return a valid index</span>\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;setTimeout(() =&gt; <span class=\"hljs-keyword\">this</span>.insert(dataUrl), <span class=\"hljs-number\">0</span>);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});\n&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;}\n\n\n&nbsp;&nbsp;<span class=\"hljs-comment\">/**\n&nbsp;&nbsp; * Insert the image into the document at the current cursor position\n&nbsp;&nbsp; * <span class=\"hljs-doctag\">@param</span> {String} dataUrl  The base64-encoded image URI\n&nbsp;&nbsp; */</span>\n&nbsp;&nbsp;insert(dataUrl) {\n&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-keyword\">const</span> index = (<span class=\"hljs-keyword\">this</span>.quill.getSelection() || {}).index || <span class=\"hljs-keyword\">this</span>.quill.getLength();\n&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-keyword\">this</span>.quill.insertEmbed(index, <span class=\"hljs-string\">\'image\'</span>, dataUrl, <span class=\"hljs-string\">\'user\'</span>);\n&nbsp;&nbsp;}\n\n\n&nbsp;&nbsp;<span class=\"hljs-comment\">/**\n&nbsp;&nbsp; * Extract image URIs a list of files from evt.dataTransfer or evt.clipboardData\n&nbsp;&nbsp; * <span class=\"hljs-doctag\">@param</span> {File[]} files  One or more File objects\n&nbsp;&nbsp; * <span class=\"hljs-doctag\">@param</span> {Function} callback  A function to send each data URI to\n&nbsp;&nbsp; */</span>\n&nbsp;&nbsp;readFiles(files, callback) {\n&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-comment\">// check each file for an image</span>\n&nbsp;&nbsp;&nbsp;&nbsp;[].forEach.call(files, file =&gt; {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-keyword\">if</span> (!file.type.match(/^image\\/(gif|jpe?g|a?png|svg|webp|bmp|vnd\\.microsoft\\.icon)/i)) {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-comment\">// file is not an image</span>\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-comment\">// Note that some file formats such as psd start with image/* but are not readable</span>\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-keyword\">return</span>;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-comment\">// set up file reader</span>\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-keyword\">const</span> reader = new FileReader();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;reader.onload = (evt) =&gt; {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;callback(evt.target.result);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-comment\">// read the clipboard item or file</span>\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-keyword\">const</span> blob = file.getAsFile ? file.getAsFile() : file;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"hljs-keyword\">if</span> (blob instanceof Blob) {\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;reader.readAsDataURL(blob);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;});\n&nbsp;&nbsp;}\n\n\n}\n\n上面是代码块\n\n</pre>', '2019-05-03 11:33:14', '2019-05-03 11:33:14', 6, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for category
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
  `parent_url` varchar(30) DEFAULT NULL COMMENT '上级分类url',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES (1, '/backend', 0, '后端开发', 0, 3, NULL, NULL, '2019-03-28 10:44:41', '2019-03-28 10:44:45');
INSERT INTO `category` VALUES (2, '/java', 0, 'java', 1, 7, 1, '/backend', '2019-03-28 10:45:00', '2019-03-28 10:45:03');
INSERT INTO `category` VALUES (3, '/frontend', 0, '前端开发', 0, 2, NULL, NULL, '2019-03-28 10:45:36', '2019-03-28 10:45:40');
INSERT INTO `category` VALUES (4, '/vue', 0, 'vue', 1, 6, 1, '/backend', '2019-03-28 10:45:59', '2019-05-10 14:26:35');
INSERT INTO `category` VALUES (5, '/react', 0, 'react', 1, 5, 1, '/backend', '2019-03-28 10:46:16', '2019-05-10 14:26:18');
INSERT INTO `category` VALUES (6, '/thinkabout', 0, '个人随想', 0, 4, NULL, NULL, '2019-03-28 10:47:01', '2019-03-28 10:47:04');
INSERT INTO `category` VALUES (7, '/home', 1, '网站首页', 0, 1, NULL, NULL, '2019-04-27 18:25:47', '2019-04-27 18:25:50');
INSERT INTO `category` VALUES (15, '/tests', 0, 'test', 1, 1, 3, '/frontend', '2019-05-11 10:44:29', '2019-05-11 10:44:37');
COMMIT;

-- ----------------------------
-- Table structure for comment
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
INSERT INTO `comment` VALUES (24, 9, 1, NULL, '厉害啦', '2019-04-16 17:09:32', '2019-04-16 17:09:32', 'admin', NULL);
INSERT INTO `comment` VALUES (25, 9, 1, NULL, '厉害了。。', '2019-04-16 17:11:03', '2019-04-16 17:11:03', 'admin', NULL);
INSERT INTO `comment` VALUES (26, 9, 1, NULL, '喜欢', '2019-04-16 17:12:05', '2019-04-16 17:12:05', 'admin', NULL);
INSERT INTO `comment` VALUES (27, 9, 1, NULL, '珂珂', '2019-04-16 17:13:57', '2019-04-16 17:13:57', 'admin', NULL);
INSERT INTO `comment` VALUES (28, 10, 1, NULL, '厉害啦', '2019-04-19 17:32:35', '2019-04-19 17:32:35', 'admin', NULL);
INSERT INTO `comment` VALUES (29, 10, 1, NULL, '哈哈哈', '2019-04-19 17:41:44', '2019-04-19 17:41:44', 'admin', NULL);
INSERT INTO `comment` VALUES (30, 3, 1, NULL, '哎哎哎', '2019-04-20 10:38:42', '2019-04-20 10:38:42', 'admin', NULL);
INSERT INTO `comment` VALUES (31, 3, 1, 30, '123', '2019-04-20 10:38:50', '2019-04-20 10:38:50', 'admin', 'admin');
INSERT INTO `comment` VALUES (32, 3, 1, 30, '@admin 345', '2019-04-20 10:38:57', '2019-04-20 10:38:57', 'admin', 'admin');
INSERT INTO `comment` VALUES (33, 3, 1, NULL, '啊啊', '2019-04-20 11:14:55', '2019-04-20 11:14:55', 'admin', 'admin');
INSERT INTO `comment` VALUES (34, 9, 1, 24, '123', '2019-04-21 20:22:21', '2019-04-21 20:22:21', 'admin', 'admin');
INSERT INTO `comment` VALUES (35, 11, 1, NULL, '<script>alert(123)</script>', '2019-04-28 14:55:16', '2019-04-28 14:55:16', 'admin', NULL);
INSERT INTO `comment` VALUES (36, 15, 1, NULL, 'a', '2019-05-03 10:16:55', '2019-05-03 10:16:55', 'admin', NULL);
COMMIT;

-- ----------------------------
-- Table structure for file
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
BEGIN;
INSERT INTO `file` VALUES (4, 'WX20190320-125533@2x.png', 'statics/images/WX20190320-125533@2x.png', NULL, NULL);
INSERT INTO `file` VALUES (5, 'WX20190320-125533@2x.png', 'statics/images/WX20190320-125533@2x.png', NULL, NULL);
INSERT INTO `file` VALUES (6, 'logo.png', 'statics/images/logo.png', NULL, NULL);
INSERT INTO `file` VALUES (7, 'WX20190320-125533@2x.png', 'statics/images/WX20190320-125533@2x.png', NULL, NULL);
INSERT INTO `file` VALUES (8, '1.png', 'statics/images/1.png', NULL, NULL);
INSERT INTO `file` VALUES (9, '2.png', 'statics/images/2.png', NULL, NULL);
INSERT INTO `file` VALUES (10, '3.png', 'statics/images/3.png', NULL, NULL);
INSERT INTO `file` VALUES (11, '4.png', 'statics/images/4.png', NULL, NULL);
INSERT INTO `file` VALUES (12, '321.png', 'statics/images/321.png', NULL, NULL);
INSERT INTO `file` VALUES (13, 'logo.png', 'statics/images/logo.png', NULL, NULL);
INSERT INTO `file` VALUES (14, 'logo.png', 'statics/images/logo.png', NULL, NULL);
INSERT INTO `file` VALUES (15, 'logo.png', 'statics/images/logo.png', '2019-04-16 17:30:08', '2019-04-16 17:30:08');
INSERT INTO `file` VALUES (16, '321.png', 'statics/images/321.png', '2019-04-20 15:01:38', '2019-04-20 15:01:38');
COMMIT;

-- ----------------------------
-- Table structure for user
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
BEGIN;
INSERT INTO `user` VALUES (1, '3cf37ebc14874fd4a83f80dbf14363d6', 'admin', '28018c3efee5c747d5390951d1350ffe', '2019-03-25 12:53:48', '2019-03-25 12:53:52', NULL, 'admin');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
