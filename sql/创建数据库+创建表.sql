CREATE DATABASE CourseManagement;
USE CourseManagement;
SET FOREIGN_KEY_CHECKS = 0;
SET FOREIGN_KEY_CHECKS = 1;

# 一级表-学院信息
CREATE TABLE college (
co_No CHAR(2) NOT NULL UNIQUE DEFAULT '' COMMENT '学院编号',
co_Name CHAR(8) NOT NULL DEFAULT '' COMMENT '学院名称',
PRIMARY KEY (co_Name)
)ENGINE=INNODB DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS college;
DESC college;
SHOW FULL COLUMNS FROM college;

# 一级表-教师信息
CREATE TABLE teachers (
# tno 可变长度字符串 非空 唯一 默认 '' 意义：教师编号
t_No CHAR(17) NOT NULL UNIQUE DEFAULT '' COMMENT '教师编号',
t_Name VARCHAR(20) NOT NULL DEFAULT '' COMMENT '教师姓名',
t_Title VARCHAR(20) NOT NULL DEFAULT '' COMMENT '教师职称',
t_StartStopWeekly CHAR(10) NOT NULL DEFAULT '' COMMENT '教师课程起止周次',
t_ClassTime CHAR(2) NOT NULL DEFAULT '' COMMENT '教师上课时间/周/h',
t_College CHAR(2) NOT NULL DEFAULT '' COMMENT '教师所属学院',
# PRIMARY KEY (t_No),
PRIMARY KEY (t_Name),
CONSTRAINT fk_college_teacher FOREIGN KEY (t_College) REFERENCES college (co_No)
ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB DEFAULT CHARSET=utf8; # 字符集
DROP TABLE IF EXISTS teachers;
DESC teachers;
SHOW FULL COLUMNS FROM teachers;

# 一级表-教室信息
CREATE TABLE classroom (
r_No CHAR(5) NOT NULL DEFAULT '' COMMENT '教室编号',
r_Name VARCHAR(20) NOT NULL DEFAULT '' COMMENT '教室名称',
r_IfMultimedia TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否为多媒体教室', # 是1否0
PRIMARY KEY (r_No)
)ENGINE=INNODB DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS classroom;
DESC classroom;
SHOW FULL COLUMNS FROM classroom;

# 一级表-学生信息
CREATE TABLE students(
s_No CHAR(17) NOT NULL UNIQUE DEFAULT '' COMMENT '学生学号',
s_Name VARCHAR(20) NOT NULL DEFAULT '' COMMENT '学生姓名',
s_College CHAR(2) NOT NULL DEFAULT '' COMMENT '学生所属学院',
PRIMARY KEY (s_No),
CONSTRAINT fk_college_students FOREIGN KEY (s_College) REFERENCES college (co_No)
)ENGINE=INNODB DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS students;
DESC students;
SHOW FULL COLUMNS FROM students;

# 二级表-开课信息
CREATE TABLE course (
c_No CHAR(9) NOT NULL UNIQUE DEFAULT '' COMMENT '所开课程编号',
c_Name VARCHAR(20) NOT NULL DEFAULT '' COMMENT '所开课程名称',
c_Teacher VARCHAR(20) NOT NULL DEFAULT '' COMMENT '教师姓名',
c_Classroom CHAR(5) NOT NULL DEFAULT '' COMMENT '授课教室',
c_Time VARCHAR(30) NOT NULL DEFAULT '' COMMENT '授课时间',
PRIMARY KEY (c_No),
CONSTRAINT fk_teachers_course FOREIGN KEY (c_Teacher) REFERENCES teachers (t_Name)
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_classroom_course FOREIGN KEY (c_Classroom) REFERENCES classroom (r_No)
ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS course;
DESC course;
SHOW FULL COLUMNS FROM course;

# 二级表-选课信息
CREATE TABLE select_course (
sc_No INT(4) AUTO_INCREMENT UNIQUE COMMENT '选课序号',
sc_c_No CHAR(9) NOT NULL DEFAULT '' COMMENT '所选课程编号',
sc_s_NO CHAR(10) NOT NULL DEFAULT '' COMMENT '学生学号',
# PRIMARY KEY (sc_No),
CONSTRAINT fk_sc_course FOREIGN KEY (sc_c_No) REFERENCES course (c_No)
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_sc_students FOREIGN KEY (sc_s_No) REFERENCES students (s_No)
ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS select_course;
DESC select_course;
SHOW FULL COLUMNS FROM select_course;

# 一级表-账号信息
CREATE TABLE account (
a_UserName VARCHAR(20) NOT NULL UNIQUE DEFAULT '' COMMENT '系统登录账号',
a_Password VARCHAR(20) NOT NULL DEFAULT '123456' COMMENT '系统登录密码'
)ENGINE=INNODB DEFAULT CHARSET=utf8; 
DROP TABLE IF EXISTS account;
DESC account;
SHOW FULL COLUMNS FROM account;

# 二级表-课程详细信息以及已选课人数(没有)
CREATE TABLE course2 (
c2_No CHAR(9) NOT NULL UNIQUE DEFAULT '' COMMENT '所开课程编号',
c2_Name VARCHAR(20) NOT NULL DEFAULT '' COMMENT '所开课程名称',
c2_Teacher VARCHAR(20) NOT NULL DEFAULT '' COMMENT '教师姓名',
c2_Classroom CHAR(5) NOT NULL DEFAULT '' COMMENT '授课教室',
c2_alreadyselect INT(3) NOT NULL DEFAULT 0 COMMENT '已经选课学生人数'
)ENGINE=INNODB DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS course2;
DESC course2;

USE coursemanagement;

# 查看创建的用户
SELECT HOST, USER FROM mysql.`user`;

# 为不同的登录账号赋予权限
# 创建带密码的用户_student
CREATE USER IF NOT EXISTS 'user_student'@'localhost'
IDENTIFIED BY 'student';
DROP USER IF EXISTS 'user_student'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'user_student'@'localhost';
# 赋予学生账号对教师表的查看权限
GRANT SELECT
ON teachers
TO 'user_student'@'localhost';
# 赋予学生账号对选课表的修改权限
GRANT INSERT, UPDATE, DELETE, SELECT
ON select_course
TO 'user_student'@'localhost';


# 创建带密码的用户_teacher
CREATE USER IF NOT EXISTS 'user_teacher'@'localhost'
IDENTIFIED BY 'teacher';
DROP USER IF EXISTS 'user_teacher'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'user_teacher'@'localhost';
# 赋予学生账号对教室表的查看权限
GRANT SELECT
ON classroom
TO 'user_teacher'@'localhost';
# 赋予学生账号对开课表的修改权限
GRANT INSERT, UPDATE, DELETE, SELECT
ON course
TO 'user_teacher'@'localhost';



