# 一级表-学院信息
INSERT INTO college VALUES
(1, '宇宙空间科学学院'),
(2, '人类进化科学学院'),
(3, '天下绝学研究学院'),
(4, '工业美食教育学院'),
(5, '狂野自然交流学院'),
(6, '炼金术士工程学院'),
(7, '社会观察创新学院'),
(8, '语言艺术交流学院');
SELECT * FROM college;


# 一级表-教师信息
# 25节课
# 15教师
INSERT INTO teachers VALUES
('20053701171003012', '霍土', '教授', '1-12', 4, 1), # 2005年教师，37山东省份，教师资格认定代码xxx随机，7高级教师，1男性
('20053701171000066', '达尔理', '教授', '1-15', 4, 2),
('20053701171000067', '森奈', '副教授', '1-17', 8, 2),
('20053701171000068', '孟德你', '讲师', '1-17', 12, 2),
('20053701171003172', '张万丰', '教授', '1-12', 4, 3),
('20053701171003173', '令牛冲', '副教授', '3-17', 8, 3),
('20053701171000122', '心机飞', '教授', '4-15', 4, 4),
('20053701171000123', '庸子', '讲师', '1-17', 12, 4),
('20053701171003010', '贝弟', '教授', '1-12', 4, 5),
('20053701171003020', '德弟', '副教授', '1-15', 8, 5),
('20053701170000876', '尼古拉斯', '教授', '4-15', 4, 6),
('20053701171301005', '韦白', '教授', '1-12', 4, 7),
('20053701171301006', '涂尔千', '讲师', '1-17', 12, 7),
('20053701171020010', '郭大胆', '教授', '1-12', 4, 8),
('20053701171020020', '于狂', '副教授', '1-17', 8, 8);
SELECT * FROM teachers;

INSERT INTO teachers VALUES
('20053701171003013', '霍土', '教授', '1-13', 5, 2);

UPDATE teachers AS t
SET t.`t_Name` = '霍水'
WHERE t.`t_No` = '20053701171003012';

# 一级表-教室信息
# 10教室
INSERT INTO classroom VALUES
('11101', 'A101', 1), # 1号楼 楼层1 主楼1 教室号07 C区
('12103', 'A203', 1),
('12212', 'C212', 0),
('21107', 'B107', 0),
('22201', 'A201', 1),
('23108', 'A308', 1),
('31105', 'A105', 1),
('32110', 'B210', 0),
('33117', 'C317', 0),
('33209', 'B309', 0);
SELECT * FROM classroom;

# 一级表-学生信息
# 45个学生
INSERT INTO students VALUES
('2019013119', '张胖胖', 1), # 入学年份+学院+班级+专业入学排名
('2019021094', '陈宝宝', 2),
('2019034043', '孙鑫鑫', 3),
('2019044124', '李墩墩', 4),
('2019052099', '赵嘿嘿', 5),
('2019061005', '钱跑跑', 6),
('2019072129', '周呜呜', 7),
('2019084142', '郑哈哈', 8),
('2019032013', '吴丽丽', 3),
('2019063001', '王莽莽', 6),
('2020014179', '冯恰恰', 1),
('2020023087', '卫冉冉', 2),
('2020032025', '褚悠悠', 3),
('2020041100', '蒋哈哈', 4),
('2020052046', '沈飞飞', 5),
('2020063099', '韩抄抄', 6),
('2020074103', '杨虚虚', 7),
('2020081004', '朱巴巴', 8),
('2020031149', '秦溜溜', 3),
('2020042217', '由文文', 4),
('2021013014', '许碌碌', 1),
('2021022113', '尤杰杰', 2),
('2021034218', '何太太', 3),
('2021041098', '吕布布', 4),
('2021052032', '施芳芳', 5),
('2021062152', '孔猪猪', 6),
('2021073042', '曹大大', 7),
('2021081189', '严鱼鱼', 8),
('2021011032', '华噢噢', 1),
('2021024039', '金元元', 2),
('2022013087', '陶处处', 1),
('2022024067', '魏武武', 2),
('2022032092', '姜公公', 3),
('2022041154', '戚饱饱', 4),
('2022051198', '谢甜甜', 5),
('2022062088', '邹妥妥', 6),
('2022073034', '喻啊啊', 7),
('2022084012', '柏威威', 8),
('2022072001', '水求求', 7),
('2022081039', '窦欧欧', 8),
('2019051066', '章泡泡', 5),
('2020033088', '云零零', 3),
('2021063099', '苏慢慢', 6),
('2022021010', '潘小小', 2),
('2020071023', '葛哥哥', 7);
SELECT * FROM students;

# 二级表-开课信息
# 25节课
INSERT INTO course VALUES
('013210013', '外星人儿牛牛研究', '霍土', '11101', '周一 8:00-12:00'), # 开课单位 + 开课层次3（本科）+ 课程类别（通识课1专业课2） + 课程性质（必修课1选修课2） + 课程流水号 + 开课学期
('023210023', '胖即正义', '达尔理', '32110', '周二 8：00-12:00'),
('023210033', '瘦即正义', '森奈', '33117', '周四 14:00-18:00'),
('023120043', '人类返祖现象', '森奈', '31105', '周五 14:00-18:00'),
('023210053', '人类自交技术', '孟德你', '32110', '周二 14:00-18:00'),
('023120063', '三头六臂或将成为可能', '孟德你', '21107', '周二 14:00-18:00'),
('023120073', '长眠万年', '孟德你', '31105', '周六 14:00-18:00'),
('033210083', '九阳神功进阶技巧', '张万丰', '12212', '周三 14:00-18:00'),
('033210093', '独孤九剑创新', '令牛冲', '23108', '周二 14:00-18:00'),
('033120103', '华山风景鉴赏', '令牛冲', '12212', '周三 14:00-18:00'),
('043210113', '科技与狠活儿', '心机飞', '12103', '周二 8：00-12:00'),
('043210123', '印度脆球', '庸子', '22201', '周一 8:00-12:00'),
('043120133', '干净又卫生', '庸子', '21107', '周三 8:00-12:00'),
('043120143', '一碗恒河水', '庸子', '32110', '周五 8:00-12:00'),
('053210153', '生吃猪大肠', '贝弟', '22201', '周一 8:00-12:00'),
('053210163', '与野猪斗智斗勇', '德弟', '33209', '周二 8:00-12:00'),
('053120173', '沙漠裸男品鉴', '德弟', '12103', '周一 8:00-12:00'),
('063210183', '点石成金', '尼古拉斯', '33117', '周四 8:00-12:00'),
('073210193', '反人类行为解析', '韦白', '23108', '周五 8:00-12:00'),
('073210203', '拜登的种种预兆', '涂尔千', '31105', '周四 8:00-12:00'),
('073120213', '人类迷惑行为大赏', '涂尔千', '33209', '周四 8:00-12:00'),
('073120223', '棒子为何乐衷抄袭', '涂尔千', '11101', '周四 8:00-12:00'),
('083210233', '消逝的亚特兰蒂斯语', '郭大胆', '11101', '周一 14:00-18:00'),
('083210243', '土话1000言', '于狂', '22201', '周四 8:00-12:00'),
('083120253', '没人比我更懂方言', '于狂', '31105', '周四 8:00-12:00');
SELECT * FROM course;



# 二级表-选课信息
INSERT INTO select_course VALUES
(),
();
SELECT * FROM select_course;
INSERT INTO select_course VALUES
(1, '033210083', '2019032013');
INSERT INTO select_course (sc_c_No, sc_s_No) VALUES ('013210013', '2019013119');
INSERT INTO select_course (sc_c_No, sc_s_No) VALUES ('013210013', '2019021094');
INSERT INTO select_course (sc_c_No, sc_s_No) VALUES ('013210013', '2019032013');
INSERT INTO select_course (sc_c_No, sc_s_No) VALUES ('013210013', '2019034043');
INSERT INTO select_course (sc_c_No, sc_s_No) VALUES ('013210013', '2019044124');
INSERT INTO select_course (sc_c_No, sc_s_No) VALUES ('013210013', '2019051066');

INSERT INTO select_course (sc_c_No, sc_s_No) VALUES ('023210023', '2020071023');
INSERT INTO select_course (sc_c_No, sc_s_No) VALUES ('023210023', '2022021010');
INSERT INTO select_course (sc_c_No, sc_s_No) VALUES ('023210023', '2021063099');
INSERT INTO select_course (sc_c_No, sc_s_No) VALUES ('023210023', '2020033088');
INSERT INTO select_course (sc_c_No, sc_s_No) VALUES ('023210023', '2019051066');


# 
UPDATE select_course
SET sc_c_No = '000000000' 
WHERE sc_s_No = '2019032013' AND sc_c_No = '033120103';

# 使用删除会导致id字段越来越大，这是一个隐患，目前我还没有找到好的解决方法
DELETE FROM select_course WHERE sc_s_No = '2019032013' AND sc_c_No = '033120103';



# 一级表-账户信息
INSERT INTO account(a_UserName) SELECT s_No
FROM students;
INSERT INTO account(a_UserName) SELECT t_No
FROM teachers;
INSERT INTO account VALUE
('root', 'root');

UPDATE account AS a
SET a.`a_UserName`=CONCAT('s', a.`a_UserName`);

UPDATE account AS a
SET a.`a_UserName`=CONCAT('t', a.`a_UserName`)
WHERE a.`a_UserName` NOT LIKE 's%';


# 查找固定账户语句
SELECT * FROM account WHERE a_UserName = 'root' AND a_Password = 'root';
SELECT * FROM account;
UPDATE account SET a_Password = '654321' WHERE a_UserName = 's2019013119' ;



# 以下是测试语句，与程序无关
# 课程详细信息以及已选课人数
INSERT INTO course2(c2_No, c2_Name, c2_Teacher, c2_Classroom) 
SELECT c_No, c_Name, c_Teacher, c_Classroom
FROM course;

SELECT * FROM course2;

UPDATE course2 AS c2
SET c2.`c2_alreadyselect` = (
	SELECT a1.count_c
	FROM (
		SELECT c2.`c_No` a1_No, c2.`c_Name` a1_Name, COUNT(c2.`c_Name`) count_c
		FROM select_course AS sc2
		JOIN course AS c2
		WHERE sc2.`sc_c_No` = c2.`c_No`
		GROUP BY c2.`c_Name`
		) AS a1
	WHERE  c2.c2_Name = a1.a1_Name
);


SELECT c2.`c_No`, c2.`c_Name`, COUNT(c2.`c_Name`) count_c
FROM course AS c2
JOIN select_course AS sc2
WHERE sc2.`sc_c_No` = c2.`c_No`
GROUP BY c2.`c_Name`;

SELECT COUNT(sc.`sc_c_No`) count_c
FROM select_course AS sc
WHERE sc.`sc_c_No` = '013210013';

SELECT * FROM course JOIN (SELECT COUNT(sc.`sc_c_No`) count_c FROM select_course AS sc WHERE sc.`sc_c_No` = '013210013') AS c WHERE c_No = '013210013';

SELECT * FROM course JOIN (SELECT COUNT(sc.`sc_c_No`) count_c FROM select_course AS sc WHERE sc.`sc_c_No` = '013210013') AS c WHERE c_No = '013210013';

SELECT * ,COUNT(sc.`sc_c_No`) count_c
FROM select_course AS sc
GROUP BY sc.`sc_c_No`;


SELECT * 
FROM course AS c;

SELECT * ,COUNT(sc.`sc_c_No`) count_c
FROM select_course AS sc
GROUP BY sc.`sc_c_No`;


SELECT c.c_No, c.c_Name, c.c_Teacher, c.c_Classroom, c.c_Time, COALESCE(sc.count_c, 0) select_c
FROM course AS c
LEFT JOIN (
	SELECT sc.sc_c_No ,COUNT(sc.`sc_c_No`) count_c
	FROM select_course AS sc
	GROUP BY sc.`sc_c_No`
) AS sc
ON sc.sc_c_No = c.c_No;


SELECT c.c_No, c.c_Name, c.c_Teacher, c.c_Classroom, c.c_Time, COALESCE(sc.count_c, 0) select_c FROM course AS c LEFT JOIN (SELECT sc.sc_c_No ,COUNT(sc.`sc_c_No`) count_c FROM select_course AS sc GROUP BY sc.sc_c_No) AS sc ON sc.sc_c_No = c.c_No;

SELECT c.c_No, c.c_Name, c.c_Teacher, c.c_Classroom, c.c_Time, COALESCE(sc.count_c, 0) select_c FROM course AS c LEFT JOIN (SELECT sc.sc_c_No ,COUNT(sc.`sc_c_No`) count_c FROM select_course AS sc GROUP BY sc.sc_c_No) AS sc ON sc.sc_c_No = c.c_No WHERE c.`c_Teacher` = '霍土';