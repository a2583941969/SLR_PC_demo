SET NAMES UTF8;
-- 如果有数据库slr，丢弃
DROP DATABASE IF EXISTS slr;
-- 创建数据库slr
CREATE DATABASE slr CHARSET=UTF8;
USE slr;


-- 用户信息表
CREATE TABLE slr_user(
  uid INT PRIMARY KEY AUTO_INCREMENT, # 用户id
  uname VARCHAR(32),  #用户名
  phoneNum VARCHAR(11) NOT NULL UNIQUE, #用户手机号
  upwd VARCHAR(16) NOT NULL,  #用户密码
  gender TINYINT,  #性别1或0
  email VARCHAR(30),  #邮箱
  birthday DATE, #生日
  address VARCHAR(90)  #地址
);
-- 商品类型家族
CREATE TABLE slr_product_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,  # 分类ID
  fname VARCHAR(15) NOT NULL #分类名称
);

-- 商品详细信息
CREATE TABLE slr_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,  #商品ID
  brand VARCHAR(20) NOT NULL,  #品牌
  pname VARCHAR(100) NOT NULL, #商品名
  pro_num VARCHAR(15) NOT NULL,  #商品编号
  price DECIMAL(7,2) NOT NULL,  #商品价格
  discount VARCHAR(10),    #商品折扣
  index_rex BOOL,    #是否首页推荐
  pcolors VARCHAR(200),   #商品颜色
  spec VARCHAR(20),     #商品规格
  idx_img VARCHAR(200), #商品展示图
  pro_del VARCHAR(200),  #详情图
  repertory INT,   #库存
  f_id INT, #商品家族编号
  FOREIGN KEY(f_id) REFERENCES slr_product_family(fid)
);

-- 商品图片
CREATE TABLE slr_product_img(
  iid INT PRIMARY KEY AUTO_INCREMENT,  #图片id
  sm VARCHAR(200), #小图
  mm VARCHAR(200) ,#中图
  color VARCHAR(128), #颜色
  pro_id INT, #商品ID
  FOREIGN KEY(pro_id) REFERENCES slr_product(pid)
);
-- 首页轮播
CREATE TABLE slr_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  curl VARCHAR(128)
);


-- 插入用户信息
INSERT INTO slr_user VALUES(NULL,"赵秋豪","18228631560","123456789",1,"2583941969@qq.com","1997-10-27","四川省-成都市-成华区");

INSERT INTO slr_product_family VALUES
(10,"刀具"),
(20,"不锈钢锅具"),
(30,"小家电"),
(40,"中式炒锅"),
(50,"平底煎锅"),
(60,"装饰锅"),
(70,"心选配件"),
(80,"陶瓷产品"),
(90,"铸铁产品"),
(100,"其他");

INSERT INTO slr_index_carousel VALUES
(NULL,"http://127.0.0.1:3000/public/img/carousel/banner01.jpg"),
(NULL,"http://127.0.0.1:3000/public/img/carousel/banner02.jpg"),
(NULL,"http://127.0.0.1:3000/public/img/carousel/banner03.jpg"),
(NULL,"http://127.0.0.1:3000/public/img/carousel/banner04.jpg"),
(NULL,"http://127.0.0.1:3000/public/img/carousel/banner05.jpg"),
(NULL,"http://127.0.0.1:3000/public/img/carousel/banner06.jpg"),
(NULL,"http://127.0.0.1:3000/public/img/carousel/banner07.jpg");

INSERT INTO slr_product VALUES
(NULL,"ZWILLING","ZWILLING Now S 刀具7件套（3色）","ZWB060",2188.00,0.5,TRUE,'[{"pcolor":"石榴红","bg":"#8f1419"},{"pcolor":"青柠色","bg":"#555e49"},{"pcolor":"粉色","bg":"pink"}]',"套装","http://127.0.0.1:3000/public/img/details/qit.jpg","http://127.0.0.1:3000/public/img/details/qjt_dtl.jpg",500,10),
(NULL,"ZWILLING BALLARINI","Select花嫁刀具套装（含煎盘24cm）","TZWBL009",3724.00,0.3,TRUE,NULL,"套装","http://127.0.0.1:3000/public/img/details/hjdj.jpg","http://127.0.0.1:3000/public/img/details/huajia-PC.jpg",100,10),
(NULL,"ZWILLING","双立人NOW刀具榨汁机套装","ZWB038",2186.00,0.5,TRUE,'[{"pcolor":"石榴色","bg":"#f32b35"},{"pcolor":"青柠色","bg":"#555e49"}]',"套装","http://127.0.0.1:3000/public/img/details/djzzj.jpg","http://127.0.0.1:3000/public/img/details/djzzj_PC.jpg",150,10),
(NULL,"STAUB","珐琅铸铁圆形炖锅 22cm(3色)","STZT051",2588.00,0.55,TRUE,'[{"pcolor":"冰蓝","bg":"#77c7e4"},{"pcolor":"樱桃红","bg":"#fe0000"},{"pcolor":"酒红色","bg":"#750220"}]',"22cm","http://127.0.0.1:3000/public/img/details/fldg.jpg","http://127.0.0.1:3000/public/img/details/fldg_PC.jpg",130,90),
(NULL,"ZWILLING","ZWILLING Now S 刀具7件套（3色）","ZWB060",2188.00,0.5,TRUE,'[{"pcolor":"石榴红","bg":"#8f1419"},{"pcolor":"青柠色","bg":"#555e49"},{"pcolor":"粉色","bg":"pink"}]',"套装","http://127.0.0.1:3000/public/img/details/qit.jpg","http://127.0.0.1:3000/public/img/details/qjt_dtl.jpg",500,10),
(NULL,"ZWILLING BALLARINI","Select花嫁刀具套装（含煎盘24cm）","TZWBL009",3724.00,0.3,TRUE,NULL,"套装","http://127.0.0.1:3000/public/img/details/hjdj.jpg","http://127.0.0.1:3000/public/img/details/huajia-PC.jpg",100,10),
(NULL,"ZWILLING","双立人NOW刀具榨汁机套装","ZWB038",2186.00,0.5,TRUE,'[{"pcolor":"石榴色","bg":"#f32b35"},{"pcolor":"青柠色","bg":"#555e49"}]',"套装","http://127.0.0.1:3000/public/img/details/djzzj.jpg","http://127.0.0.1:3000/public/img/details/djzzj_PC.jpg",150,10),
(NULL,"STAUB","珐琅铸铁圆形炖锅 22cm(3色)","STZT051",2588.00,0.55,TRUE,'[{"pcolor":"冰蓝","bg":"#77c7e4"},{"pcolor":"樱桃红","bg":"#fe0000"},{"pcolor":"酒红色","bg":"#750220"}]',"22cm","http://127.0.0.1:3000/public/img/details/fldg.jpg","http://127.0.0.1:3000/public/img/details/fldg_PC.jpg",130,90),
(NULL,"ZWILLING","ZWILLING Now S 刀具7件套（3色）","ZWB060",2188.00,0.5,FALSE,'[{"pcolor":"石榴红","bg":"#8f1419"},{"pcolor":"青柠色","bg":"#555e49"},{"pcolor":"粉色","bg":"pink"}]',"套装","http://127.0.0.1:3000/public/img/details/qit.jpg","http://127.0.0.1:3000/public/img/details/qjt_dtl.jpg",500,10),
(NULL,"ZWILLING BALLARINI","Select花嫁刀具套装（含煎盘24cm）","TZWBL009",3724.00,0.3,FALSE,NULL,"套装","http://127.0.0.1:3000/public/img/details/hjdj.jpg","http://127.0.0.1:3000/public/img/details/huajia-PC.jpg",100,10),
(NULL,"ZWILLING","双立人NOW刀具榨汁机套装","ZWB038",2186.00,0.5,FALSE,'[{"pcolor":"石榴色","bg":"#f32b35"},{"pcolor":"青柠色","bg":"#555e49"}]',"套装","http://127.0.0.1:3000/public/img/details/djzzj.jpg","http://127.0.0.1:3000/public/img/details/djzzj_PC.jpg",150,10),
(NULL,"STAUB","珐琅铸铁圆形炖锅 22cm(3色)","STZT051",2588.00,0.55,FALSE,'[{"pcolor":"冰蓝","bg":"#77c7e4"},{"pcolor":"樱桃红","bg":"#fe0000"},{"pcolor":"酒红色","bg":"#750220"}]',"22cm","http://127.0.0.1:3000/public/img/details/fldg.jpg","http://127.0.0.1:3000/public/img/details/fldg_PC.jpg",130,90),
(NULL,"STAUB","珐琅陶瓷多功能碗 25cm","STTC011",398.00,1,FALSE,'[{"pcolor":"莳萝绿","bg":"#202f06"},{"pcolor":"樱桃红","bg":"#fe0000"}]',"25cm","http://127.0.0.1:3000/public/img/details/dgnw.jpg","http://127.0.0.1:3000/public/img/details/dgnw_PC.jpg",65,80);






-- 插入图片数据
INSERT INTO slr_product_img VALUES
(NULL,"http://127.0.0.1:3000/public/img/details/qjt_s01.jpg","http://127.0.0.1:3000/public/img/details/qjt_m01.jpg","石榴红",1),
(NULL,"http://127.0.0.1:3000/public/img/details/qjt_s02.jpg","http://127.0.0.1:3000/public/img/details/qjt_m02.jpg","石榴红",1),
(NULL,"http://127.0.0.1:3000/public/img/details/qjt_s04.jpg","http://127.0.0.1:3000/public/img/details/qjt_m03.jpg","粉色",1),
(NULL,"http://127.0.0.1:3000/public/img/details/qjt_s04.jpg","http://127.0.0.1:3000/public/img/details/qjt_m04.jpg","粉色",1),
(NULL,"http://127.0.0.1:3000/public/img/details/qjt_s05.jpg","http://127.0.0.1:3000/public/img/details/qjt_m05.jpg","粉色",1),
(NULL,"http://127.0.0.1:3000/public/img/details/hjdj_s01.jpg","http://127.0.0.1:3000/public/img/details/hjdj_m01.jpg",NULL,2),
(NULL,"http://127.0.0.1:3000/public/img/details/hjdj_s02.jpg","http://127.0.0.1:3000/public/img/details/hjdj_m02.jpg",NULL,2),
(NULL,"http://127.0.0.1:3000/public/img/details/hjdj_s03.jpg","http://127.0.0.1:3000/public/img/details/hjdj_m03.jpg",NULL,2),
(NULL,"http://127.0.0.1:3000/public/img/details/djzzj_s01.jpg","http://127.0.0.1:3000/public/img/details/djzzj_m01.jpg","石榴色",3),
(NULL,"http://127.0.0.1:3000/public/img/details/djzzj_s02.jpg","http://127.0.0.1:3000/public/img/details/djzzj_m02.jpg","石榴色",3),
(NULL,"http://127.0.0.1:3000/public/img/details/djzzj_s03.jpg","http://127.0.0.1:3000/public/img/details/djzzj_m03.jpg","石榴色",3),
(NULL,"http://127.0.0.1:3000/public/img/details/djzzj_s01.jpg","http://127.0.0.1:3000/public/img/details/djzzj_m01.jpg","青柠色",3),
(NULL,"http://127.0.0.1:3000/public/img/details/djzzj_s04.jpg","http://127.0.0.1:3000/public/img/details/djzzj_m04.jpg","青柠色",3),
(NULL,"http://127.0.0.1:3000/public/img/details/djzzj_s03.jpg","http://127.0.0.1:3000/public/img/details/djzzj_m03.jpg","青柠色",3),
(NULL,"http://127.0.0.1:3000/public/img/details/fldg_s01.jpg","http://127.0.0.1:3000/public/img/details/fldg_m01.jpg","冰蓝",4),
(NULL,"http://127.0.0.1:3000/public/img/details/fldg_s02.jpg","http://127.0.0.1:3000/public/img/details/fldg_m02.jpg","冰蓝",4),
(NULL,"http://127.0.0.1:3000/public/img/details/fldg_s03.jpg","http://127.0.0.1:3000/public/img/details/fldg_m03.jpg","冰蓝",4),
(NULL,"http://127.0.0.1:3000/public/img/details/fldg_s04.jpg","http://127.0.0.1:3000/public/img/details/fldg_m04.jpg","樱桃红",4),
(NULL,"http://127.0.0.1:3000/public/img/details/fldg_s05.jpg","http://127.0.0.1:3000/public/img/details/fldg_m05.jpg","樱桃红",4),
(NULL,"http://127.0.0.1:3000/public/img/details/fldg_s07.jpg","http://127.0.0.1:3000/public/img/details/fldg_m07.jpg","樱桃红",4),
(NULL,"http://127.0.0.1:3000/public/img/details/fldg_s06.jpg","http://127.0.0.1:3000/public/img/details/fldg_m06.jpg","樱桃红",4),
(NULL,"http://127.0.0.1:3000/public/img/details/fldg_s03.jpg","http://127.0.0.1:3000/public/img/details/fldg_m03.jpg","酒红色",4),
(NULL,"http://127.0.0.1:3000/public/img/details/fldg_s08.jpg","http://127.0.0.1:3000/public/img/details/fldg_m08.jpg","酒红色",4);

