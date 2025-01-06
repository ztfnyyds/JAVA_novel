-- -----------------------------------------------------------------public-------------------------------------------------------------------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `salt` varchar(8) NOT NULL COMMENT '加密盐值',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `name` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `sex` tinyint(3) unsigned DEFAULT NULL COMMENT '性别;0-男 1-女',
  `birth` datetime DEFAULT NULL COMMENT '出生日期',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;0-禁用 1-正常',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统用户';

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sys_id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) unsigned NOT NULL COMMENT '角色ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与角色对应关系';

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) NOT NULL COMMENT '角色名称',
  `role_sign` varchar(100) DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色';

-- ----------------------------
-- Table structure for admin_info
-- ----------------------------
DROP TABLE IF EXISTS `admin_info`;
CREATE TABLE `admin_info`(
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sys_id` bigint(20) unsigned NOT NULL COMMENT '系统ID',
  `admin_id` varchar(20) NOT NULL COMMENT '管理员ID',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `is_super_admin` tinyint(3) unsigned NOT NULL COMMENT '超管标识：0-普通管理员 1-超管',
  `authority` bigint unsigned NOT NULL COMMENT '管理员权限（从后往前按位标识）：0001-评论删除权限 0010-用户管理权限 0100-作评审核权限 等',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_sys_id` (`sys_id`) USING BTREE,
  UNIQUE KEY `uk_admin_id` (`admin_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='管理员信息';

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sys_id` bigint(20) unsigned NOT NULL COMMENT '系统ID',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '昵称',
  `user_photo` varchar(100) DEFAULT NULL COMMENT '用户头像',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '用户状态;0-正常 1-禁止评论 2-封禁',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息';

-- ----------------------------
-- Table structure for user_feedback
-- ----------------------------
DROP TABLE IF EXISTS `user_feedback`;
CREATE TABLE `user_feedback` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL COMMENT '反馈用户id',
  `content` varchar(512) NOT NULL COMMENT '反馈内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户反馈';

-- ----------------------------
-- Table structure for user_feedback_reply
-- ----------------------------
DROP TABLE IF EXISTS `user_feedback_reply`;
CREATE TABLE `user_feedback_reply` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `feedback_id` bigint(20) unsigned NOT NULL COMMENT '反馈id',
  `content` varchar(512) NOT NULL COMMENT '反馈内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_id` (`id`),
  KEY `idx_feedback_id` (`feedback_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户反馈回复';

-- ----------------------------
-- Table structure for forbidden_word
-- ----------------------------
DROP TABLE IF EXISTS `forbidden_word`;
CREATE TABLE `forbidden_word`(
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(512) NOT NULL COMMENT '违禁词',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_id` (`id`),
  KEY `idx_word` (`word`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='违禁词';

-- ----------------------------
-- Table structure for admin_message
-- ----------------------------
DROP TABLE IF EXISTS `admin_message`;
CREATE TABLE `admin_message` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户id',
  `content` varchar(512) NOT NULL COMMENT '消息内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_id` (`id`),
  KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统消息';







-- -----------------------------------------------------------------book-------------------------------------------------------------------------------------

-- ----------------------------
-- Table structure for book_category
-- ----------------------------
DROP TABLE IF EXISTS `book_category`;
CREATE TABLE `book_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `work_direction` tinyint(3) unsigned NOT NULL COMMENT '作品方向;0-男频 1-女频',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类别名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `pk_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说类别';

-- ----------------------------
-- Table structure for book_category_role
-- ----------------------------
DROP TABLE IF EXISTS `book_category_role`;
CREATE TABLE `book_category_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned NOT NULL COMMENT '类别ID',
  `book_id` bigint(20) unsigned NOT NULL COMMENT '小说ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `pk_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说类别与小说对应关系';

-- ----------------------------
-- Table structure for book_info
-- ----------------------------
DROP TABLE IF EXISTS `book_info`;
CREATE TABLE `book_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `main_category_id` bigint(20) unsigned DEFAULT NULL COMMENT '类别ID',
  `main_category_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '类别名',
  `pic_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '小说封面地址',
  `book_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '小说名',
  `author_id` bigint(20) unsigned NOT NULL COMMENT '作家id',
  `author_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '作家名',
  `book_desc` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '书籍描述',
  `score` tinyint(3) unsigned NOT NULL COMMENT '评分;总分:10 ，真实评分 = score/10',
  `book_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '书籍状态;0-连载中 1-已完结',
  `visit_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '点击量',
  `favourite_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '收藏量',
  `word_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总字数',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `last_chapter_num` smallint(5) unsigned DEFAULT NULL COMMENT '最新章节ID',
  `last_chapter_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '最新章节名',
  `last_chapter_update_time` datetime DEFAULT NULL COMMENT '最新章节更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_bookName_authorName` (`book_name`,`author_name`) USING BTREE,
  UNIQUE KEY `pk_id` (`id`) USING BTREE,
  KEY `idx_createTime` (`create_time`) USING BTREE,
  KEY `idx_lastChapterUpdateTime` (`last_chapter_update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1431630596354977793 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说信息';

-- ----------------------------
-- Table structure for book_chapter
-- ----------------------------
DROP TABLE IF EXISTS `book_chapter`;
CREATE TABLE `book_chapter` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `book_id` bigint(20) unsigned NOT NULL COMMENT '小说ID',
  `chapter_num` smallint(5) unsigned NOT NULL COMMENT '章节号',
  `chapter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '章节名',
  `word_count` int(10) unsigned NOT NULL COMMENT '章节字数',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_bookId_chapterNum` (`book_id`,`chapter_num`) USING BTREE,
  UNIQUE KEY `pk_id` (`id`) USING BTREE,
  KEY `idx_bookId` (`book_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1445988184596992001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说章节';

-- ----------------------------
-- Table structure for book_content
-- ----------------------------
DROP TABLE IF EXISTS `book_content`;
CREATE TABLE `book_content` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `chapter_id` bigint(20) unsigned NOT NULL COMMENT '章节ID',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '小说章节内容',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_chapterId` (`chapter_id`) USING BTREE,
  UNIQUE KEY `pk_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4256332 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说内容';

-- ----------------------------
-- Table structure for book_comment
-- ----------------------------
DROP TABLE IF EXISTS `book_comment`;
CREATE TABLE `book_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `book_id` bigint(20) unsigned NOT NULL COMMENT '评论小说ID',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '评论用户ID',
  `is_author` tinyint(3) unsigned NOT NULL COMMENT '作者评论标识；0-读者 1-作者',
  `is_reply` tinyint(3) unsigned NOT NULL COMMENT '回复评论标识：0-不是回复 1-回复',
  `is_top` tinyint(3) unsigned NOT NULL COMMENT '置顶标识： 0-普通评论 1-置顶评论',
  `dest_comment_id` bigint(20) unsigned DEFAULT NULL COMMENT '被回复评论ID，不是回复时为空',
  `comment_content` varchar(512) NOT NULL COMMENT '评论内容',
  `reply_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复数量',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_bookId_userId` (`book_id`,`user_id`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说评论';

-- ----------------------------
-- Table structure for book_mark
-- ----------------------------
DROP TABLE IF EXISTS `book_mark`;
CREATE TABLE `book_mark` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `book_id` bigint(20) unsigned NOT NULL COMMENT '小说ID',
  `chapter_id` bigint(20) unsigned NOT NULL COMMENT '章节ID',
  `content_id` bigint(20) unsigned DEFAULT NULL COMMENT '内容ID',
  `page` int unsigned DEFAULT '1' COMMENT '书签页',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间;',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间;',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_userId_bookId` (`user_id`,`book_id`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户书架';

-- ----------------------------
-- Table structure for user_bookshelf
-- ----------------------------
DROP TABLE IF EXISTS `user_bookshelf`;
CREATE TABLE `user_bookshelf` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `book_id` bigint(20) unsigned NOT NULL COMMENT '小说ID',
  `pre_content_id` bigint(20) unsigned DEFAULT NULL COMMENT '上一次阅读的章节内容表ID',
  `page` int unsigned DEFAULT '1' COMMENT '上一次读到的页',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间;',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间;',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_userId_bookId` (`user_id`,`book_id`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户书架';

-- ----------------------------
-- Table structure for user_read_history
-- ----------------------------
DROP TABLE IF EXISTS `user_read_history`;
CREATE TABLE `user_read_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `book_id` bigint(20) unsigned NOT NULL COMMENT '小说ID',
  `pre_content_id` bigint(20) unsigned NOT NULL COMMENT '上一次阅读的章节内容表ID',
  `page` int unsigned DEFAULT '1' COMMENT '上一次读到的页',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间;',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间;',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_userId_bookId` (`user_id`,`book_id`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户阅读历史';

-- ----------------------------
-- Table structure for author_info
-- ----------------------------
DROP TABLE IF EXISTS `author_info`;
CREATE TABLE `author_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `pen_name` varchar(20) NOT NULL COMMENT '笔名',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `work_direction` tinyint(3) unsigned DEFAULT NULL COMMENT '作品方向;0-男频 1-女频',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0：正常;1-封禁',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_userId` (`user_id`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='作者信息';

-- ----------------------------
-- Table structure for author_request
-- ----------------------------
DROP TABLE IF EXISTS `author_request`;
CREATE TABLE `author_request` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` bigint(20) unsigned NOT NULL COMMENT '作家id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '请求类型;0-新增小说 1-删除小说 2-修改小说 3-新增章节 4-修改章节',
  -- START
  -- 删除小说、新增章节、修改章节、修改小说
  `book_id` bigint(20) unsigned DEFAULT NULL COMMENT '小说ID',
  -- 新增小说、修改小说
  `book_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '小说名',
  `pic_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '小说封面地址',
  `book_desc` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '书籍描述',
  `work_direction` tinyint(3) unsigned DEFAULT NULL COMMENT '作品方向;0-男频 1-女频',
  `category_id` bigint(20) unsigned DEFAULT NULL COMMENT '类别ID',
  -- 修改章节
  `chapter_num` smallint(5) unsigned DEFAULT NULL COMMENT '章节号',
  -- 新增章节、修改章节
  `chapter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '章节名',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '小说章节内容',
  -- END
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',  
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='作品变更申请';

-- ----------------------------
-- Table structure for author_request_reply
-- ----------------------------
DROP TABLE IF EXISTS `author_request_reply`;
CREATE TABLE `author_request_reply` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `author_request_id` bigint(20) unsigned NOT NULL COMMENT '反馈id',
  `content` varchar(512) NOT NULL COMMENT '反馈内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_id` (`id`),
  KEY `idx_author_request_id` (`author_request_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='作品变更申请回复';

-- ----------------------------
-- Table structure for home_book
-- ----------------------------
DROP TABLE IF EXISTS `home_book`;
CREATE TABLE `home_book` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL COMMENT '推荐类型;0-轮播图 1-阅读榜 2-更新榜 3-推荐榜 4-收藏榜 5-新书榜',
  `sort` tinyint(3) unsigned NOT NULL COMMENT '推荐排序',
  `book_id` bigint(20) unsigned NOT NULL COMMENT '推荐小说ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小说推荐';





-- -----------------------------------------------------------------comic-------------------------------------------------------------------------------------

-- ----------------------------
-- Table structure for comic_category
-- ----------------------------
DROP TABLE IF EXISTS `comic_category`;
CREATE TABLE `comic_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `work_direction` tinyint(3) unsigned NOT NULL COMMENT '作品方向;0-男频 1-女频',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类别名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `pk_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='漫画类别';

-- ----------------------------
-- Table structure for comic_category_role
-- ----------------------------
DROP TABLE IF EXISTS `comic_category_role`;
CREATE TABLE `comic_category_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned NOT NULL COMMENT '类别ID',
  `comic_id` bigint(20) unsigned NOT NULL COMMENT '漫画ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `pk_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='漫画类别与漫画对应关系';

-- ----------------------------
-- Table structure for comic_info
-- ----------------------------
DROP TABLE IF EXISTS `comic_info`;
CREATE TABLE `comic_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `main_category_id` bigint(20) unsigned DEFAULT NULL COMMENT '类别ID',
  `main_category_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '类别名',
  `pic_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '漫画封面地址',
  `comic_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '漫画名',
  `drawer_id` bigint(20) unsigned NOT NULL COMMENT '作家id',
  `drawer_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '作家名',
  `comic_desc` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '漫画描述',
  `score` tinyint(3) unsigned NOT NULL COMMENT '评分;总分:10 ，真实评分 = score/10',
  `comic_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '漫画状态;0-连载中 1-已完结 2-断更',
  `visit_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '点击量',
  `favourite_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '收藏量',
  `chapter_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '章节总数',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `last_chapter_num` smallint(5) unsigned DEFAULT NULL COMMENT '最新章节ID',
  `last_chapter_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '最新章节名',
  `last_chapter_update_time` datetime DEFAULT NULL COMMENT '最新章节更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_comicName_drawerName` (`comic_name`,`drawer_name`) USING BTREE,
  UNIQUE KEY `pk_id` (`id`) USING BTREE,
  KEY `idx_createTime` (`create_time`) USING BTREE,
  KEY `idx_lastChapterUpdateTime` (`last_chapter_update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1431630596354977793 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='漫画信息';

-- ----------------------------
-- Table structure for comic_chapter
-- ----------------------------
DROP TABLE IF EXISTS `comic_chapter`;
CREATE TABLE `comic_chapter` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comic_id` bigint(20) unsigned NOT NULL COMMENT '漫画ID',
  `chapter_num` smallint(5) unsigned NOT NULL COMMENT '章节号',
  `chapter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '章节名',
  `page_count` int(10) unsigned NOT NULL COMMENT '章节页数',
  `page_id` bigint(20) unsigned NOT NULL COMMENT '首页ID',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_comicId_chapterNum` (`comic_id`,`chapter_num`) USING BTREE,
  UNIQUE KEY `pk_id` (`id`) USING BTREE,
  KEY `idx_comicId` (`comic_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1445988184596992001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='漫画章节';

-- ----------------------------
-- Table structure for comic_page
-- ----------------------------
DROP TABLE IF EXISTS `comic_page`;
CREATE TABLE `comic_page` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `chapter_id` bigint(20) unsigned NOT NULL COMMENT '章节ID',
  `page_number` smallint(5) unsigned NOT NULL COMMENT '页码',
  `next_page_id` bigint(20) unsigned DEFAULT NULL COMMENT '下一页ID',
  `image_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片地址',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_chapterId_pageNumber` (`chapter_id`,`page_number`) USING BTREE,
  UNIQUE KEY `pk_id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='漫画章节页';

-- ----------------------------
-- Table structure for comic_comment
-- ----------------------------
DROP TABLE IF EXISTS `comic_comment`;
CREATE TABLE `comic_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `comic_id` bigint(20) unsigned NOT NULL COMMENT '评论漫画ID',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '评论用户ID',
  `is_drawer` tinyint(3) unsigned NOT NULL COMMENT '作者评论标识；0-读者 1-作者',
  `is_reply` tinyint(3) unsigned NOT NULL COMMENT '回复评论标识：0-不是回复 1-回复',
  `is_top` tinyint(3) unsigned NOT NULL COMMENT '置顶标识： 0-普通评论 1-置顶评论',
  `dest_comment_id` bigint(20) unsigned DEFAULT NULL COMMENT '被回复评论ID，不是回复时为空',
  `comment_content` varchar(512) NOT NULL COMMENT '评价内容',
  `reply_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复数量',
  `audit_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '审核状态;0-待审核 1-审核通过 2-审核不通过',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_comicId_userId` (`comic_id`,`user_id`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='漫画评论';

-- ----------------------------
-- Table structure for user_comic_shelf
-- ----------------------------
DROP TABLE IF EXISTS `user_comic_shelf`;
CREATE TABLE `user_comic_shelf` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `comic_id` bigint(20) unsigned NOT NULL COMMENT '漫画ID',
  `pre_page_id` bigint(20) unsigned DEFAULT NULL COMMENT '上一次阅读的章节页码ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_userId_comicId` (`user_id`,`comic_id`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户漫画书架';

-- ----------------------------
-- Table structure for user_watch_history
-- ----------------------------
DROP TABLE IF EXISTS `user_watch_history`;
CREATE TABLE `user_watch_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `comic_id` bigint(20) unsigned NOT NULL COMMENT '漫画ID',
  `pre_page_id` bigint(20) unsigned DEFAULT NULL COMMENT '上一次阅读的章节页码ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_userId_comicId` (`user_id`,`comic_id`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户阅读历史';

-- ----------------------------
-- Table structure for drawer_info
-- ----------------------------
DROP TABLE IF EXISTS `drawer_info`;
CREATE TABLE `drawer_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `pen_name` varchar(20) NOT NULL COMMENT '笔名',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `work_direction` tinyint(3) unsigned DEFAULT NULL COMMENT '作品方向;0-男频 1-女频',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0：正常;1-封禁',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_userId` (`user_id`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='漫画作者信息';

-- ----------------------------
-- Table structure for drawer_request
-- ----------------------------
DROP TABLE IF EXISTS `drawer_request`;
CREATE TABLE `drawer_request` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `drawer_id` bigint(20) unsigned NOT NULL COMMENT '作者ID',
  `type` tinyint(3) unsigned NOT NULL COMMENT '请求类型;0-新增漫画 1-删除漫画 2-修改漫画 3-新增章节 4-修改章节',
  -- START
  -- 删除漫画、新增章节、修改章节、修改漫画
  `comic_id` bigint(20) unsigned DEFAULT NULL COMMENT '漫画ID',
  -- 新增漫画、修改漫画
  `comic_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '漫画名',
  `pic_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '漫画封面地址',
  `comic_desc` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '漫画描述',
  `work_direction` tinyint(3) unsigned DEFAULT NULL COMMENT '作品方向;0-男频 1-女频',
  `category_id` bigint(20) unsigned DEFAULT NULL COMMENT '类别ID',
  -- 修改章节
  `chapter_num` smallint(5) unsigned DEFAULT NULL COMMENT '章节号',
  -- 新增章节、修改章节
  `chapter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '章节名',
  `page_id` bigint(20) unsigned DEFAULT NULL COMMENT '首页ID',
  -- END
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',  
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='漫画作品变更申请';

-- ----------------------------
-- Table structure for drawer_request_reply
-- ----------------------------
DROP TABLE IF EXISTS `drawer_request_reply`;
CREATE TABLE `drawer_request_reply` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `drawer_request_id` bigint(20) unsigned NOT NULL COMMENT '反馈ID',
  `content` varchar(512) NOT NULL COMMENT '反馈内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_id` (`id`),
  KEY `idx_drawer_request_id` (`drawer_request_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='漫画作品变更申请回复';

-- ----------------------------
-- Table structure for home_comic
-- ----------------------------
DROP TABLE IF EXISTS `home_comic`;
CREATE TABLE `home_comic` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL COMMENT '推荐类型;0-轮播图 1-阅读榜 2-更新榜 3-推荐榜 4-收藏榜 5-新书榜',
  `sort` tinyint(3) unsigned NOT NULL COMMENT '推荐排序',
  `comic_id` bigint(20) unsigned NOT NULL COMMENT '推荐漫画ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='漫画推荐';


