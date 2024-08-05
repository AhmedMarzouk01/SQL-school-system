USE [master]
GO
/****** Object:  Database [ITI_system]    Script Date: 8/5/2024 5:55:59 AM ******/
CREATE DATABASE [ITI_system]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ITI_system', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVERDEV\MSSQL\DATA\ITI_system.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ), 
 FILEGROUP [FG_Courses] 
( NAME = N'CoursesData', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVERDEV\MSSQL\DATA\ITI_system.ndf' , SIZE = 36864KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ), 
 FILEGROUP [FG_Exams] 
( NAME = N'ExamsData', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVERDEV\MSSQL\DATA\ExamsData.ndf' , SIZE = 36864KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ), 
 FILEGROUP [FG_Instructors] 
( NAME = N'InstructorsData', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVERDEV\MSSQL\DATA\InstructorsData.ndf' , SIZE = 36864KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ), 
 FILEGROUP [FG_StudentAnswers] 
( NAME = N'studentAnswerdata', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVERDEV\MSSQL\DATA\studentAnswerdata.ndf' , SIZE = 36864KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ), 
 FILEGROUP [FG_Students] 
( NAME = N'StudentsData', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVERDEV\MSSQL\DATA\StudentsData.ndf' , SIZE = 36864KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ITI_system_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVERDEV\MSSQL\DATA\ITI_system_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ITI_system] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ITI_system].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ITI_system] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ITI_system] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ITI_system] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ITI_system] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ITI_system] SET ARITHABORT OFF 
GO
ALTER DATABASE [ITI_system] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ITI_system] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ITI_system] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ITI_system] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ITI_system] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ITI_system] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ITI_system] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ITI_system] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ITI_system] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ITI_system] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ITI_system] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ITI_system] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ITI_system] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ITI_system] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ITI_system] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ITI_system] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ITI_system] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ITI_system] SET RECOVERY FULL 
GO
ALTER DATABASE [ITI_system] SET  MULTI_USER 
GO
ALTER DATABASE [ITI_system] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ITI_system] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ITI_system] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ITI_system] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ITI_system] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ITI_system] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ITI_system', N'ON'
GO
ALTER DATABASE [ITI_system] SET QUERY_STORE = ON
GO
ALTER DATABASE [ITI_system] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ITI_system]
GO
/****** Object:  UserDefinedTableType [dbo].[QuestionanswerType]    Script Date: 8/5/2024 5:55:59 AM ******/
CREATE TYPE [dbo].[QuestionanswerType] AS TABLE(
	[QuestionID] [int] NULL,
	[answer] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[QuestionTableType]    Script Date: 8/5/2024 5:55:59 AM ******/
CREATE TYPE [dbo].[QuestionTableType] AS TABLE(
	[QuestionID] [int] NULL,
	[Degree] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[StudentIDTableType]    Script Date: 8/5/2024 5:55:59 AM ******/
CREATE TYPE [dbo].[StudentIDTableType] AS TABLE(
	[StudentID] [int] NULL
)
GO
/****** Object:  Table [dbo].[mcq_questions]    Script Date: 8/5/2024 5:55:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mcq_questions](
	[mcq_question_ID] [int] NOT NULL,
	[question_ID] [int] NOT NULL,
	[question_text] [varchar](max) NULL,
	[correct_answer] [varchar](max) NULL,
	[Course_ID] [int] NOT NULL,
	[A] [varchar](max) NULL,
	[B] [varchar](max) NULL,
	[C] [varchar](max) NULL,
 CONSTRAINT [PK_mcq_questions] PRIMARY KEY CLUSTERED 
(
	[mcq_question_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG_Courses]
) ON [FG_Courses] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[true or false questions]    Script Date: 8/5/2024 5:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[true or false questions](
	[true_OR_False_Q_ID] [int] NOT NULL,
	[question_text] [varchar](max) NULL,
	[correct_answer] [varchar](max) NULL,
	[question_ID] [int] NULL,
	[CourseID] [int] NULL
) ON [FG_Courses] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [PK_true or false questions]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE CLUSTERED INDEX [PK_true or false questions] ON [dbo].[true or false questions]
(
	[true_OR_False_Q_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG_Courses]
GO
/****** Object:  Table [dbo].[text questions]    Script Date: 8/5/2024 5:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[text questions](
	[TEXT_QUESTION_ID] [int] NOT NULL,
	[question_text] [varchar](max) NULL,
	[AcceptedTextAnswer] [varchar](max) NULL,
	[question_ID] [int] NULL,
	[CourseID] [int] NULL
) ON [FG_Courses] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [PK_text questions]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE CLUSTERED INDEX [PK_text questions] ON [dbo].[text questions]
(
	[TEXT_QUESTION_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG_Courses]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 8/5/2024 5:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[Exam_ID] [int] IDENTITY(1,1) NOT NULL,
	[Exam_Type] [varchar](10) NULL,
	[Intake_ID] [int] NULL,
	[Track_ID] [int] NULL,
	[Branch_ID] [int] NULL,
	[Course_ID] [int] NULL,
	[Instructor_ID] [int] NULL,
	[Start_time] [datetime] NOT NULL,
	[End_time] [datetime] NOT NULL,
	[total_time] [int] NULL,
	[allowance_options] [varchar](max) NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[Exam_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG_Exams]
) ON [FG_Exams] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam_question]    Script Date: 8/5/2024 5:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam_question](
	[EQ_ID] [int] IDENTITY(1,1) NOT NULL,
	[Exam_ID] [int] NULL,
	[Question_ID] [int] NULL,
	[Degree] [float] NULL,
	[question_type] [varchar](12) NULL,
 CONSTRAINT [PK_Exam_question] PRIMARY KEY CLUSTERED 
(
	[EQ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_exam]    Script Date: 8/5/2024 5:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_exam](
	[SE_ID] [int] IDENTITY(1,1) NOT NULL,
	[Student_ID] [int] NULL,
	[Exam_ID] [int] NULL,
	[Start_date] [datetime] NULL,
	[End_date] [datetime] NULL,
	[result] [float] NULL,
 CONSTRAINT [PK_Student_exam] PRIMARY KEY CLUSTERED 
(
	[SE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[StudentExam]    Script Date: 8/5/2024 5:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create    view [dbo].[StudentExam]
as
select 
	e.Exam_ID,
	e.Course_ID,
	e.Branch_ID,
	e.Intake_ID,
	e.Track_ID,
	e.allowance_options,
	e.Exam_Type,
	se.Start_date,
	se.End_date,
	se.Student_ID,
	q.Question_ID,
	q.Degree,
		case
			when q.question_type = 'MCQ' then (select question_text from mcq_questions 
			where q.Question_ID =question_ID)
			
			when q.question_type = 'TF' then (select question_text from [true or false questions] 
			where q.Question_ID =question_ID)

			when q.question_type = 'Text' then (select question_text from  [text questions]
			where q.Question_ID =question_ID )
		End as question_TEXT,
	mc.A,
	mc.B,
	mc.C
	
	from Exam as e

	join Student_exam as se on e.Exam_ID= se.Exam_ID
	join Exam_question as q on e.Exam_ID = q.Exam_ID
	LEFT JOIN mcq_questions AS mc ON q.Question_ID = mc.question_ID AND q.question_type = 'MCQ'
GO
/****** Object:  Table [dbo].[Course]    Script Date: 8/5/2024 5:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Course_ID] [int] NOT NULL,
	[Crs_Name] [varchar](100) NULL,
	[Crs_description] [varchar](255) NULL,
	[Max_degree] [float] NOT NULL,
	[Min_degree] [float] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Course_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG_Courses]
) ON [FG_Courses]
GO
/****** Object:  Table [dbo].[Track]    Script Date: 8/5/2024 5:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Track](
	[Track_ID] [int] NOT NULL,
	[Track_Name] [varchar](255) NULL,
 CONSTRAINT [PK_Track] PRIMARY KEY CLUSTERED 
(
	[Track_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 8/5/2024 5:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Student_ID] [int] NOT NULL,
	[St_Fname] [varchar](100) NULL,
	[St_Lname] [varchar](100) NULL,
	[Email] [nvarchar](255) NULL,
	[Branch_ID] [int] NULL,
	[Intake_ID] [int] NULL,
	[Track_ID] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG_Students]
) ON [FG_Students]
GO
/****** Object:  View [dbo].[student_result]    Script Date: 8/5/2024 5:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[student_result]
as
select 
SE.Exam_ID,
se.Student_ID,
s.St_Fname,s.St_Lname,
c.Crs_Name,
se.result,
e.Exam_Type,
e.Start_time,
e.End_time,
e.Intake_ID,
e.Branch_ID,
t.Track_ID,
t.Track_Name

from Student_exam as se
join Student as s 
on se.Student_ID = s.Student_ID
join Exam as e
on e.Exam_ID = se.Exam_ID
join Course as c
on e.Course_ID =  c.Course_ID
join Track as t
on e.Track_ID = t.Track_ID
GO
/****** Object:  Table [dbo].[instructor]    Script Date: 8/5/2024 5:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instructor](
	[Instructor_ID] [int] NOT NULL,
	[Ins_Fname] [varchar](100) NULL,
	[ins_Lname] [varchar](100) NULL,
	[Email] [nvarchar](255) NULL,
	[Training_manager_ID] [int] NULL,
 CONSTRAINT [PK_instructor] PRIMARY KEY CLUSTERED 
(
	[Instructor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[instructor_course]    Script Date: 8/5/2024 5:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instructor_course](
	[IC_ID] [int] NOT NULL,
	[course_ID] [int] NULL,
	[instructor_ID] [int] NULL,
	[year] [int] NULL,
 CONSTRAINT [PK_instructor_course] PRIMARY KEY CLUSTERED 
(
	[IC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[course_info]    Script Date: 8/5/2024 5:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[course_info]
as 
select c.Course_ID,c.Crs_Name,
c.Max_degree,c.Min_degree
,ic.instructor_ID, i.Ins_Fname,i.ins_Lname,
t.Track_ID,t.Track_Name


from Course as c
join instructor_course as ic
on c.Course_ID = ic.course_ID
join instructor as i
on ic.instructor_ID = i.Instructor_ID
join Exam as e
on c.Course_ID = e.Course_ID
join Track as t
on e.Track_ID = t.Track_ID
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 8/5/2024 5:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[Branch_ID] [int] NOT NULL,
	[Branch_Name] [varchar](255) NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[Branch_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[student_exam_schedule]    Script Date: 8/5/2024 5:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[student_exam_schedule]
as
select e.Exam_ID,e.Exam_Type,
e.allowance_options,b.Branch_Name,
e.Start_time,e.End_time,
E.total_time as exam_duration,
c.Crs_Name,se.Student_ID,
CASE
        WHEN GETDATE() < e.Start_time THEN 'Upcoming'
        WHEN GETDATE() BETWEEN e.Start_time AND e.End_time THEN 'Ongoing'
        ELSE 'Completed'
    END AS ExamStatus


from Exam as e
join Student_exam as se
on e.Exam_ID = se.Exam_ID
join Course as c
on c.Course_ID= e.Course_ID
join Branch as b
on e.Branch_ID = b.Branch_ID
GO
/****** Object:  Table [dbo].[Student_course]    Script Date: 8/5/2024 5:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_course](
	[SC_ID] [int] NOT NULL,
	[Student_ID] [int] NULL,
	[Course_ID] [int] NULL,
	[year] [int] NULL,
 CONSTRAINT [PK_Student_course] PRIMARY KEY CLUSTERED 
(
	[SC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[getStudentsincourse]    Script Date: 8/5/2024 5:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   function [dbo].[getStudentsincourse](@coursename varchar(20))
returns table
as 
return
(
select concat(upper(left(st_fname,1))+lower(substring(st_fname,2,len(st_fname)-1)),'  ',upper(left(St_Lname,1))+lower(substring(St_Lname,2,len(st_fname)-1))) as [Student's Fullname]
from Student s inner join [dbo].[Student_course] sc
on s.Student_ID = sc.[Student_ID] inner join [dbo].[Course] c
on c.Course_ID=sc.[course_ID]
where [Crs_Name]= @coursename
)
GO
/****** Object:  Table [dbo].[question]    Script Date: 8/5/2024 5:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question](
	[Question_ID] [int] NOT NULL,
	[Course_ID] [int] NULL,
	[question_type] [varchar](30) NULL,
 CONSTRAINT [PK_question] PRIMARY KEY CLUSTERED 
(
	[Question_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[question_pool]    Script Date: 8/5/2024 5:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[question_pool]
as
select 
q.Question_ID,
q.question_type,
c.Course_ID,
c.Crs_Name,
mcq.question_text,
mcq.A,
mcq.B,
mcq.C,
mcq.correct_answer,
NULL AS TrueFalseAnswer,
NULL AS AcceptedTextAnswer


from mcq_questions as mcq
join question as q
on mcq.question_ID= q.Question_ID
join Course as c
on c.Course_ID = mcq.Course_ID
where q.question_type= 'mcq'

union all

select 
q.Question_ID,
q.question_type,
c.Course_ID,
c.Crs_Name,
tf.question_text,
null as A,
null as B,
null as c,
null as correct_answer,
tf.correct_answer AS TrueFalseAnswer,
NULL AS AcceptedTextAnswer


from [dbo].[true or false questions] as tf
join question as q
on tf.question_ID= q.Question_ID
join Course as c
on c.Course_ID = tf.CourseID
where q.question_type= 'TRUE OR FALSE'

union all

select 
q.Question_ID,
q.question_type,
c.Course_ID,
c.Crs_Name,
t.question_text,
null as A,
null as B,
null as c,
null as correct_answer,
null AS TrueFalseAnswer,
t.AcceptedTextAnswer AS AcceptedTextAnswer


from [dbo].[text questions] as t
join question as q
on t.question_ID= q.Question_ID
join Course as c
on c.Course_ID = t.CourseID
where q.question_type= 'Text'
GO
/****** Object:  UserDefinedFunction [dbo].[getinstructorcourse]    Script Date: 8/5/2024 5:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   function [dbo].[getinstructorcourse](@coursename varchar(20))
returns table
as 
return
(
select concat(upper(left(ins_fname,1))+lower(substring(ins_fname,2,len(ins_fname)-1)),'  ',
upper(left(ins_Lname,1))+lower(substring(ins_Lname,2,len(ins_fname)-1))) as [Instructor's Fullname]
from instructor i inner join [dbo].[instructor_course] ic
on i.Instructor_ID = ic.Instructor_ID inner join [dbo].[Course] c
on c.Course_ID=ic.Instructor_ID
where [Crs_Name]= @coursename
)
GO
/****** Object:  UserDefinedFunction [dbo].[getcoursesstudents]    Script Date: 8/5/2024 5:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   function [dbo].[getcoursesstudents](@id int)
returns table
as 
return
(select [Crs_Name] ,[Crs_description],concat(upper(left(st_fname,1))+lower(substring(st_fname,2,len(st_fname)-1)),'  ',upper(left(St_Lname,1))+lower(substring(St_Lname,2,len(st_fname)-1))) as [Student's Fullname]
from [dbo].[Course] c inner join [dbo].[Student_course] sc
on c.Course_ID=sc.[course_ID] inner join Student s
on s.Student_ID = sc.[Student_ID]
where s.Student_ID= @id
)
GO
/****** Object:  Table [dbo].[Student_answer]    Script Date: 8/5/2024 5:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_answer](
	[St_answer_ID] [int] IDENTITY(1,1) NOT NULL,
	[Student_ID] [int] NULL,
	[question_ID] [int] NULL,
	[Exam_ID] [int] NULL,
	[St_answer] [varchar](max) NULL,
	[Is_correct] [bit] NULL,
 CONSTRAINT [PK_Student_answer] PRIMARY KEY CLUSTERED 
(
	[St_answer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG_StudentAnswers]
) ON [FG_StudentAnswers] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[text_answer_for_evaluation]    Script Date: 8/5/2024 5:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create    view [dbo].[text_answer_for_evaluation]
as
select 
sa.Exam_ID,
sa.Student_ID,
sa.question_ID,
t.question_text,
t.AcceptedTextAnswer,
sa.St_answer,
sa.Is_correct




from student_answer as sa
join [text questions] as t
on sa.question_ID = t.question_ID
where sa.Is_correct = 0

GO
/****** Object:  UserDefinedFunction [dbo].[getcourseinstructor]    Script Date: 8/5/2024 5:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   function [dbo].[getcourseinstructor](@instructorid int)
returns table
as 
return
(
select [Crs_Name],[Crs_description],concat(upper(left(ins_fname,1))+lower(substring(ins_fname,2,len(ins_fname)-1)),'  ',
upper(left(ins_Lname,1))+lower(substring(ins_Lname,2,len(ins_fname)-1))) as [Instructor's Fullname]
from [dbo].[Course] c inner join [dbo].[instructor_course] ic
on c.Course_ID=ic.[course_ID] inner join instructor i
on ic.[instructor_ID] = i.[Instructor_ID]

where i.[Instructor_ID]= @instructorid
)
GO
/****** Object:  View [dbo].[instructor_info]    Script Date: 8/5/2024 5:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[instructor_info]
as 
select 
i.Instructor_ID,
i.Ins_Fname,i.ins_Lname,i.Email,
ic.course_ID,c.Crs_Name,c.Crs_description,
ic.year



from instructor as i 
join instructor_course as ic 
on i.Instructor_ID = ic.instructor_ID
join Course as c 
on ic.course_ID = c.Course_ID
GO
/****** Object:  Table [dbo].[Intake]    Script Date: 8/5/2024 5:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Intake](
	[Intake_ID] [int] NOT NULL,
	[Intake_Name] [varchar](255) NULL,
 CONSTRAINT [PK_Intake] PRIMARY KEY CLUSTERED 
(
	[Intake_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[student_info]    Script Date: 8/5/2024 5:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[student_info]
as
select s.Student_ID,s.St_Fname,s.St_Lname,s.Email,b.Branch_Name,
t.Track_Name,i.Intake_ID,i.Intake_Name,
sc.Course_ID ,sc.year,
c.Crs_Name,c.Crs_description

from Student as s 
join Student_course as sc
on s.Student_ID = sc.Student_ID
join Course as c 
on c.Course_ID = sc.Course_ID
join Branch as b
on s.Branch_ID= b.Branch_ID
join Intake as i 
on s.Intake_ID = i.Intake_ID
join Track as t 
on s.Track_ID = t.Track_ID
GO
/****** Object:  View [dbo].[intake_branch_track_details]    Script Date: 8/5/2024 5:56:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[intake_branch_track_details]
as
select i.Intake_ID,i.Intake_Name,b.Branch_ID,b.Branch_Name,
t.Track_ID,t.Track_Name



from  Intake as i 
join Student as s 
on i.Intake_ID =  s.Branch_ID
join Track as t 
on t.Track_ID =  s.Track_ID
join Branch as b 
on b.Branch_ID = s.Branch_ID
GO
INSERT [dbo].[Branch] ([Branch_ID], [Branch_Name]) VALUES (1, N'Banisweif')
GO
INSERT [dbo].[Branch] ([Branch_ID], [Branch_Name]) VALUES (2, N'Fayoum')
GO
INSERT [dbo].[Branch] ([Branch_ID], [Branch_Name]) VALUES (3, N'alexandria')
GO
INSERT [dbo].[Branch] ([Branch_ID], [Branch_Name]) VALUES (4, N'minia')
GO
INSERT [dbo].[Branch] ([Branch_ID], [Branch_Name]) VALUES (5, N'assuit')
GO
INSERT [dbo].[Branch] ([Branch_ID], [Branch_Name]) VALUES (6, N'matrouh')
GO
INSERT [dbo].[Branch] ([Branch_ID], [Branch_Name]) VALUES (7, N'south sinai')
GO
INSERT [dbo].[Branch] ([Branch_ID], [Branch_Name]) VALUES (8, N'north sinai')
GO
INSERT [dbo].[Branch] ([Branch_ID], [Branch_Name]) VALUES (9, N'qena')
GO
INSERT [dbo].[Branch] ([Branch_ID], [Branch_Name]) VALUES (10, N'tanta')
GO
INSERT [dbo].[Course] ([Course_ID], [Crs_Name], [Crs_description], [Max_degree], [Min_degree]) VALUES (1, N'sql', N'Learning functions,aggregate functions and joins', 100, 60)
GO
INSERT [dbo].[Course] ([Course_ID], [Crs_Name], [Crs_description], [Max_degree], [Min_degree]) VALUES (2, N'python', N'learning loops,IF statments and oop principles', 100, 60)
GO
INSERT [dbo].[Course] ([Course_ID], [Crs_Name], [Crs_description], [Max_degree], [Min_degree]) VALUES (3, N'communication skills', N'learning effective communication, effective listening', 100, 60)
GO
INSERT [dbo].[Course] ([Course_ID], [Crs_Name], [Crs_description], [Max_degree], [Min_degree]) VALUES (4, N'businness english', N'learning how to write and talk in bussiness english', 100, 60)
GO
INSERT [dbo].[Course] ([Course_ID], [Crs_Name], [Crs_description], [Max_degree], [Min_degree]) VALUES (5, N'excel', N'learning the basics functions of excel and pivot tables', 100, 60)
GO
INSERT [dbo].[Course] ([Course_ID], [Crs_Name], [Crs_description], [Max_degree], [Min_degree]) VALUES (6, N'statistics', N'linear regression ,probabilty and K-values', 100, 60)
GO
INSERT [dbo].[Course] ([Course_ID], [Crs_Name], [Crs_description], [Max_degree], [Min_degree]) VALUES (7, N'freelancing', N'learning how to get your first job remotely', 100, 60)
GO
INSERT [dbo].[Course] ([Course_ID], [Crs_Name], [Crs_description], [Max_degree], [Min_degree]) VALUES (8, N'presentation skills', N'learning how to make effective presentations ', 100, 60)
GO
INSERT [dbo].[Course] ([Course_ID], [Crs_Name], [Crs_description], [Max_degree], [Min_degree]) VALUES (9, N'RTOS', N'Operating system with two key feature predictability and determinism', 100, 60)
GO
INSERT [dbo].[Course] ([Course_ID], [Crs_Name], [Crs_description], [Max_degree], [Min_degree]) VALUES (10, N'Embedded System software', N'Specialized programming tool in Embedded devices that facilitate the functioing of machines  ', 100, 60)
GO
INSERT [dbo].[Course] ([Course_ID], [Crs_Name], [Crs_description], [Max_degree], [Min_degree]) VALUES (11, N'Communication Protocols', N'A set of formal rules describing how to trasnmit or exchange data ', 100, 60)
GO
INSERT [dbo].[Course] ([Course_ID], [Crs_Name], [Crs_description], [Max_degree], [Min_degree]) VALUES (12, N'HTML', N'Universal markup langauage for the web', 100, 60)
GO
INSERT [dbo].[Course] ([Course_ID], [Crs_Name], [Crs_description], [Max_degree], [Min_degree]) VALUES (13, N'CSS', N'Descripes how HTML elements are to be dislayed ', 100, 60)
GO
INSERT [dbo].[Course] ([Course_ID], [Crs_Name], [Crs_description], [Max_degree], [Min_degree]) VALUES (14, N'JavaScript', N'Programming language that adds interactivity to your website', 100, 60)
GO
INSERT [dbo].[Course] ([Course_ID], [Crs_Name], [Crs_description], [Max_degree], [Min_degree]) VALUES (15, N'Prototyping', N'an experimental process where design teams  implement ideas into tangible forms from paper  to digital', 100, 60)
GO
INSERT [dbo].[Course] ([Course_ID], [Crs_Name], [Crs_description], [Max_degree], [Min_degree]) VALUES (16, N'User Testing', N'The process of verifying the functionalities of the UI and keeping the UX in check ', 100, 60)
GO
INSERT [dbo].[Course] ([Course_ID], [Crs_Name], [Crs_description], [Max_degree], [Min_degree]) VALUES (17, N'Personalization', N'Gathering enough accurate data to understand your  customer''s journeys ', 100, 60)
GO
INSERT [dbo].[Course] ([Course_ID], [Crs_Name], [Crs_description], [Max_degree], [Min_degree]) VALUES (18, N'Content Marketing', N'A marketing strategy used to attract ,engage and retain an audience by creating sharing relevant articles ,videos and other media ', 100, 60)
GO
INSERT [dbo].[Course] ([Course_ID], [Crs_Name], [Crs_description], [Max_degree], [Min_degree]) VALUES (19, N'Social listenting', N'Analyzing online conversations surronding your brand to learn more about how your target market views it', 100, 60)
GO
INSERT [dbo].[Course] ([Course_ID], [Crs_Name], [Crs_description], [Max_degree], [Min_degree]) VALUES (20, N'DataWareHouse', N'integration the multi-data system database in modeling dimensions ', 100, 60)
GO
SET IDENTITY_INSERT [dbo].[Exam] ON 
GO
INSERT [dbo].[Exam] ([Exam_ID], [Exam_Type], [Intake_ID], [Track_ID], [Branch_ID], [Course_ID], [Instructor_ID], [Start_time], [End_time], [total_time], [allowance_options]) VALUES (2, N'Exam', 1, 1, 1, 1, 1, CAST(N'2024-07-23T10:00:00.000' AS DateTime), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 120, N'None')
GO
INSERT [dbo].[Exam] ([Exam_ID], [Exam_Type], [Intake_ID], [Track_ID], [Branch_ID], [Course_ID], [Instructor_ID], [Start_time], [End_time], [total_time], [allowance_options]) VALUES (3, N'corrective', 1, 1, 1, 1, 1, CAST(N'2024-07-23T10:00:00.000' AS DateTime), CAST(N'2024-07-23T12:00:00.000' AS DateTime), 120, N'None')
GO
SET IDENTITY_INSERT [dbo].[Exam] OFF
GO
SET IDENTITY_INSERT [dbo].[Exam_question] ON 
GO
INSERT [dbo].[Exam_question] ([EQ_ID], [Exam_ID], [Question_ID], [Degree], [question_type]) VALUES (14, 2, 6, 10, NULL)
GO
INSERT [dbo].[Exam_question] ([EQ_ID], [Exam_ID], [Question_ID], [Degree], [question_type]) VALUES (15, 2, 7, 10, NULL)
GO
INSERT [dbo].[Exam_question] ([EQ_ID], [Exam_ID], [Question_ID], [Degree], [question_type]) VALUES (16, 2, 8, 10, NULL)
GO
INSERT [dbo].[Exam_question] ([EQ_ID], [Exam_ID], [Question_ID], [Degree], [question_type]) VALUES (17, 2, 9, 10, NULL)
GO
INSERT [dbo].[Exam_question] ([EQ_ID], [Exam_ID], [Question_ID], [Degree], [question_type]) VALUES (18, 2, 10, 10, NULL)
GO
INSERT [dbo].[Exam_question] ([EQ_ID], [Exam_ID], [Question_ID], [Degree], [question_type]) VALUES (19, 2, 201, 10, NULL)
GO
INSERT [dbo].[Exam_question] ([EQ_ID], [Exam_ID], [Question_ID], [Degree], [question_type]) VALUES (20, 2, 202, 10, NULL)
GO
INSERT [dbo].[Exam_question] ([EQ_ID], [Exam_ID], [Question_ID], [Degree], [question_type]) VALUES (21, 2, 203, 10, NULL)
GO
INSERT [dbo].[Exam_question] ([EQ_ID], [Exam_ID], [Question_ID], [Degree], [question_type]) VALUES (22, 2, 1, 4, NULL)
GO
INSERT [dbo].[Exam_question] ([EQ_ID], [Exam_ID], [Question_ID], [Degree], [question_type]) VALUES (23, 2, 2, 4, NULL)
GO
INSERT [dbo].[Exam_question] ([EQ_ID], [Exam_ID], [Question_ID], [Degree], [question_type]) VALUES (24, 2, 3, 4, NULL)
GO
INSERT [dbo].[Exam_question] ([EQ_ID], [Exam_ID], [Question_ID], [Degree], [question_type]) VALUES (25, 2, 4, 4, NULL)
GO
INSERT [dbo].[Exam_question] ([EQ_ID], [Exam_ID], [Question_ID], [Degree], [question_type]) VALUES (26, 2, 5, 4, NULL)
GO
INSERT [dbo].[Exam_question] ([EQ_ID], [Exam_ID], [Question_ID], [Degree], [question_type]) VALUES (27, 3, 6, 10, N'mcq')
GO
INSERT [dbo].[Exam_question] ([EQ_ID], [Exam_ID], [Question_ID], [Degree], [question_type]) VALUES (28, 3, 8, 10, N'mcq')
GO
INSERT [dbo].[Exam_question] ([EQ_ID], [Exam_ID], [Question_ID], [Degree], [question_type]) VALUES (29, 3, 10, 10, N'mcq')
GO
INSERT [dbo].[Exam_question] ([EQ_ID], [Exam_ID], [Question_ID], [Degree], [question_type]) VALUES (30, 3, 9, 10, N'mcq')
GO
INSERT [dbo].[Exam_question] ([EQ_ID], [Exam_ID], [Question_ID], [Degree], [question_type]) VALUES (31, 3, 7, 10, N'mcq')
GO
INSERT [dbo].[Exam_question] ([EQ_ID], [Exam_ID], [Question_ID], [Degree], [question_type]) VALUES (32, 3, 202, 15, N'text')
GO
INSERT [dbo].[Exam_question] ([EQ_ID], [Exam_ID], [Question_ID], [Degree], [question_type]) VALUES (33, 3, 203, 15, N'text')
GO
INSERT [dbo].[Exam_question] ([EQ_ID], [Exam_ID], [Question_ID], [Degree], [question_type]) VALUES (34, 3, 1, 5, N'Tf')
GO
INSERT [dbo].[Exam_question] ([EQ_ID], [Exam_ID], [Question_ID], [Degree], [question_type]) VALUES (35, 3, 3, 5, N'Tf')
GO
INSERT [dbo].[Exam_question] ([EQ_ID], [Exam_ID], [Question_ID], [Degree], [question_type]) VALUES (36, 3, 4, 5, N'Tf')
GO
INSERT [dbo].[Exam_question] ([EQ_ID], [Exam_ID], [Question_ID], [Degree], [question_type]) VALUES (37, 3, 2, 5, N'Tf')
GO
SET IDENTITY_INSERT [dbo].[Exam_question] OFF
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (1, N'ahmed', N'lotfy', N'ahmed.lotfy614@gmail.com', NULL)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (2, N'ahmed', N'marzouk', N'ahmedmarzouk312@gmail.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (3, N'mahmoud', N'farhat', N'mahmoud.farhat98@yahoo.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (4, N'waleed', N'mohamed', N'waleedabdalbaky00@gmail.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (5, N'aly', N'omar', N'aly.omar1997_@gmail.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (6, N'Ahmed', N'Mohamed', N'Ahmedmohamed951@gmail.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (7, N'khaled', N'Ahmed', N'khaledahmed753@gmail.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (8, N'Amr', N'Yassib', N'Amryassin963@gmail.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (9, N'Eslam', N'Ahmed', N'Eslamahmed@gmail.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (10, N'Eslam ', N'khaled', N'Eslamkhaled423@gmail.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (11, N'khaled', N'amr', N'khaledamr023@gmail.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (12, N'mariam ', N'amr', N'mariamamr012@gmail.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (13, N'Alaa', N'amr', N'alaaamr@gmail.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (14, N'yasmin', N'khaled', N'yasminkhaled854@gmail.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (15, N'shreen', N'Ahmed', N'shreenahmed321@gmail.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (16, N'Ahmed', N'khaled', N'Ahmedkhaled056@gmail.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (17, N'yasmin', N'amr', N'yasminamr578@gmail.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (18, N'mariam', N'mohamed', N'mariammohamed023@gmail.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (19, N'marian', N'hany ', N'marianhany345@gmail.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (20, N'sara', N'ali', N'saraali@gmail.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (21, N'sara', N'ahmed', N'saraahmed031@gmail.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (22, N'nermeen', N'mohamed', N'nemreenmohamed84@gmail.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (23, N'heba', N'mohamed', N'hebamohamed356@gmail.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (24, N'dalia', N'mohamed', N'daliamohamed6556@gmail.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (25, N'Ahmed', N'sameh', N'ahmedsameh545@gmail.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (26, N'Mohamed', N'Amr', N'moahemdamr542@gmail.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (27, N'Areej', N'khaled', N'Areejkhaled098@gmail.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (28, N'Ahmed', N'Jumaa', N'AhmedJumaa542@gmail.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (29, N'Mohamed', N'emad', N'mohamedemad6453@gmail.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (30, N'esraa', N'khaled', N'esraakhaled542@gmail.com', 1)
GO
INSERT [dbo].[instructor] ([Instructor_ID], [Ins_Fname], [ins_Lname], [Email], [Training_manager_ID]) VALUES (605, N'mazen', N'magdy', N'mazenmagdy@gmail.com', 1)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (1, 1, 1, 2015)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (2, 1, 23, 2018)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (3, 2, 2, 2020)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (4, 2, 18, 2023)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (5, 3, 3, 2022)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (6, 3, 20, 2018)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (7, 4, 4, 2019)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (8, 5, 5, 2016)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (9, 5, 29, 2017)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (10, 6, 6, 2021)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (11, 6, 15, 2022)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (12, 7, 7, 2023)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (13, 8, 8, 2024)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (14, 8, 10, 2020)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (15, 9, 9, 2022)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (16, 10, 12, 2021)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (17, 11, 11, 2020)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (18, 12, 19, 2019)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (19, 13, 30, 2018)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (20, 14, 25, 2016)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (21, 14, 21, 2017)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (22, 15, 14, 2018)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (23, 15, 27, 2021)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (24, 16, 26, 2023)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (25, 17, 24, 2022)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (26, 18, 22, 2024)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (27, 19, 13, 2023)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (28, 19, 16, 2018)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (29, 20, 17, 2019)
GO
INSERT [dbo].[instructor_course] ([IC_ID], [course_ID], [instructor_ID], [year]) VALUES (30, 20, 28, 2020)
GO
INSERT [dbo].[Intake] ([Intake_ID], [Intake_Name]) VALUES (1, N'first')
GO
INSERT [dbo].[Intake] ([Intake_ID], [Intake_Name]) VALUES (2, N'second')
GO
INSERT [dbo].[Intake] ([Intake_ID], [Intake_Name]) VALUES (3, N'third')
GO
INSERT [dbo].[Intake] ([Intake_ID], [Intake_Name]) VALUES (4, N'fourth')
GO
INSERT [dbo].[Intake] ([Intake_ID], [Intake_Name]) VALUES (5, N'fifth')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (1, 6, N'Which SQL function is used to return the number of rows that match a specified condition?

', N'A', 1, N'Count', N'Max', N'Sum')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (2, 7, N'What does the GROUP BY clause in SQL do?

', N'B', 1, N'Performs a join operation between two or more tables.', N'Combines rows into groups based on matching values in specified columns.

', N'Sorts the result set in ascending order.')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (3, 8, N'Which SQL aggregate function calculates the average value of a numeric column?

', N'C', 1, N'SUM', N'COUNT', N'AVG')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (4, 9, N'In SQL, which type of join returns all rows from both tables, matching rows from both where available', N'B', 1, N'INNER JOIN', N'FULL OUTER JOIN', N'LEFT JOIN')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (5, 10, N'What does the DISTINCT keyword in SQL do', N'C', 1, N'Aggregates values from multiple rows into a single value', N'Groups rows based on common values in specified columns', N'Deletes duplicate rows from a result set')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (6, 16, N'Which of the following Python statements is used to execute a block of code only if a specified condition is true', N'A', 2, N'IF', N'FOR', N'WHILE')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (7, 17, N'What does the elif keyword signify in Python', N'B', 2, N'It is used to indicate the end of a loop.', N' It is short for "else if" and is used to specify a new condition to test if the previous if condition was false.', N'It is used to define a function in Python')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (8, 18, N'In Python, which loop is used to iterate over a sequence of elements?

', N'C', 2, N'if', N'while', N'for')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (9, 19, N'What is the purpose of the else clause in a Python loop?

', N'A', 2, N'It is executed if the loop completes normally (i.e., without break)', N' It is used to terminate the loop early.', N'It is used to define an alternate condition for the loop')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (10, 20, N'In Python, how do you define a class', N'B', 2, N'Using the def keyword', N'Using the class keyword', N'Using the object keyword.')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (11, 26, N'Which of the following is NOT a characteristic of effective listening', N'C', 3, N'Showing empathy and understanding
', N'Providing feedback', N'Interrupting to ask clarifying questions')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (12, 27, N'Which of the following is a barrier to effective listening', N'A', 3, N'Daydreaming', N'Taking notes', N'Maintaining eye contact')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (13, 28, N'What is a key benefit of active listening', N'B', 3, N'Dominating the conversation', N'Building trust and rapport', N'Interrupting frequently')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (14, 29, N'Which listening technique involves summarizing the speaker''s main points

', N'C', 3, N'Reflective listening', N'Critical listening', N'Paraphrasing')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (15, 30, N'During a conversation, what does providing feedback typically involve', N'A', 3, N'Asking probing questions', N'Checking your phone', N'Interrupting the speaker')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (16, 36, N'Which of the following is a key principle of writing effectively in business English

', N'B', 4, N'Using informal language and slang', N'Using clear and concise language', N'Using jargon extensively to impress readers')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (17, 37, N'When writing a business email, what should be included in the subject line', N'C', 4, N'A brief greeting', N'The recipient''s job title', N'A summary of the entire email')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (18, 38, N'In business presentations, what is essential for effective communication', N'A', 4, N'Speaking clearly and confidently', N'Reading directly from slides', N'Focusing on technical details')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (19, 39, N'Which of the following is a best practice for conducting meetings in business English', N'B', 4, N'Using informal language to build rapport', N'Sticking strictly to the agenda', N'Ignoring questions from participants')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (20, 40, N'What should be the primary focus when writing a business report', N'C', 4, N'Using informal greetings', N'Including personal opinions', N'Presenting factual information and analysis')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (21, 46, N'Which Excel function is used to find the highest value in a range?', N'A', 5, N'MAX', N'SUM', N'COUNT')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (22, 47, N'What does the CONCATENATE function in Excel do', N'B', 5, N'Divides numbers', N'Combines text from multiple cells', N'Adds numbers together')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (23, 48, N'Which Excel function calculates the average of a range of numbers', N'C', 5, N'MIN', N'SUM', N'AVERAGE')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (24, 49, N'What is the purpose of a pivot table in Excel', N'A', 5, N'To analyze and summarize data', N'To merge cells', N'To create charts')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (25, 50, N'How can you change the summary function in a pivot table to calculate the median instead of the sum', N'B', 5, N'By clicking on a different icon', N'By right-clicking and selecting "Change Summary Calculation"', N'By using a different formula')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (26, 56, N'What is the probability of rolling a 6 on a fair six-sided die', N'C', 6, N'1/3', N'1/2', N'1/6')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (27, 57, N'If two events A and B are independent, what is P(A and B', N'A', 6, N'P(A) × P(B)', N'P(A) + P(B)', N'P(A) - P(B)')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (28, 58, N'In K-means clustering, what does ''K'' represent', N'B', 6, N'The number of features', N'The number of clusters', N'The distance metric')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (29, 59, N'Which step in the K-means algorithm involves randomly initializing cluster centroids', N'C', 6, N'Assignment step', N'Update step', N'Initialization step')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (30, 60, N'What is the goal of the K-means clustering algorithm', N'A', 6, N'To partition data points into K clusters', N'To maximize the within-cluster variance', N'To minimize the number of clusters')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (31, 66, N'Which of the following is a common platform for finding freelance work', N'B', 7, N'Amazon', N'LinkedIn', N'Facebook')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (32, 67, N'What is a typical advantage of freelancing', N'C', 7, N'Job security', N'Fixed working hours', N'Variety of projects')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (33, 68, N'What does "scope creep" refer to in freelancing', N'A', 7, N'Uncontrolled expansion of project requirements', N'Expanding the range of services offered', N'Growing your client base')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (34, 69, N'How do most freelancers typically charge for their services', N'B', 7, N'By the week', N'By the hour or project', N'By the month')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (35, 70, N'How can freelancers build a strong reputation', N'C', 7, N'Working for a single client long-term', N'Avoiding feedback and reviews', N'Networking with other freelancers')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (36, 76, N'What is a key purpose of an effective presentation', N'A', 8, N'To inform, persuade, or entertain', N'To impress the audience with technical jargon', N'To intimidate competitors')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (37, 77, N'Which of the following is an important consideration when designing presentation slides', N'B', 8, N'Using as many animations as possible', N'Maintaining visual consistency', N'Using a small font size')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (38, 78, N'What should the opening of a presentation ideally achieve', N'C', 8, N'Introduce the speaker''s personal background', N'Display complex charts and graphs immediately', N'Outline the structure and purpose of the presentation')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (39, 79, N'What is an effective way to prepare for a presentation?', N'A', 8, N'Practicing aloud and timing the presentation', N'Using complex language to sound knowledgeable', N'Making last-minute changes without rehearsal')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (40, 80, N'Which of the following is a best practice for delivering a presentation?

', N'B', 8, N'Speaking softly to encourage active listening', N'Using gestures and body language', N'Focusing solely on technical details')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (41, 86, N'What is predictability in the context of operating systems?', N'C', 9, N'The ability to schedule tasks dynamically', N'The ability to handle multiple users simultaneously', N'The ability to provide a guaranteed response time')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (42, 87, N'Which scheduling algorithm is most suitable for real-time systems requiring determinism?', N'A', 9, N'Rate Monotonic Scheduling (RMS)', N'Round Robin', N'First-Come, First-Served (FCFS)')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (43, 88, N'What is determinism in an operating system context?', N'B', 9, N'The ability to provide accurate time measurements', N'The ability to precisely predict the order of task execution', N'The ability to scale to accommodate increasing workload')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (44, 89, N'In a real-time operating system, what is a major concern related to task scheduling?', N'C', 9, N'Maximizing throughput
', N'Minimizing memory usage', N'Ensuring response time predictability')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (45, 90, N'Which of the following is NOT a characteristic of a deterministic operating system?', N'A', 9, N'Variable task scheduling', N'Ability to predict task response times', N'Fixed task execution order')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (46, 96, N'Which programming language is commonly used for embedded systems due to its efficiency and direct hardware access?
', N'B', 10, N'Python', N'C', N'JavaScript')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (47, 97, N'Which tool is commonly used for debugging embedded software and microcontroller firmware?
', N'C', 10, N'Visual Studio', N'Eclipse', N'GDB (GNU Debugger)')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (48, 98, N'Which of the following is an example of a real-time operating system (RTOS) commonly used in embedded systems?', N'A', 10, N'FreeRTOS', N'Linux', N'Android')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (49, 99, N'Which of the following is a common integrated development environment (IDE) used for developing embedded software?', N'B', 10, N'MATLAB', N'Keil µVision', N'Adobe Dreamweaver')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (50, 100, N'Which tool is essential for simulating and testing embedded systems without physical hardware?', N'C', 10, N'Oscilloscope', N'Logic analyzer', N'Simulator')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (51, 106, N'What term refers to the set of rules defining the structure and format of data exchanged between systems?
', N'A', 11, N'Data syntax', N'Data integrity

', N'Data encryption')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (52, 107, N'What is a set of rules that ensures data is transmitted without corruption or errors?

', N'B', 11, N'Data encryption', N'Data integrity', N'Data architecture')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (53, 108, N'What ensures that data transmission conforms to specific predefined standards and protocols?

', N'C', 11, N'Data encryption', N'Data integrity', N'Data syntax')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (54, 109, N'Which term refers to the rules and conventions governing the logical structure and format of data exchanges?

', N'A', 11, N'Data syntax', N'Data encryption', N'Data integrity')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (55, 110, N'Which term refers to the rules governing the physical layout and connections used to transmit data?

', N'B', 11, N'Data integrity', N'Data architecture', N'Data syntax')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (56, 116, N'Hyperlink Text Markup Language', N'C', 12, N'Hyperlink Text Markup Language', N'Home Tool Markup Language', N'Hypertext Markup Language')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (57, 117, N'Which tag is used to define a hyperlink in HTML?', N'A', 12, N'<a>', N'<href>', N'<hyper>')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (58, 118, N'Which tag is used to create an unordered list in HTML?', N'B', 12, N'<li>', N'<ul>', N'<list>')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (59, 119, N'What is the correct HTML for creating a checkbox?', N'C', 12, N'<input type="check">', N'<check>', N'<input type="checkbox">')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (60, 120, N'What does the HTML tag <br> represent?', N'A', 12, N'Break', N'Bold', N'Begin')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (61, 126, N'Which CSS property is used to change the text color of an element?', N'B', 13, N'text-color', N'color', N'text-style')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (62, 127, N'Which CSS selector is used to select elements with a specific class?', N'C', 13, N'class:', N'#class', N'.class
')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (63, 128, N'Which CSS property is used to specify the type of cursor to be displayed when pointing over an element?

', N'A', 13, N'cursor', N'cursor-type', N'mouse-cursor')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (64, 129, N'Which CSS unit is relative to the font-size of the element?', N'B', 13, N'px', N'em', N'%')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (65, 130, N'Which CSS property is used to create space outside the borders of an element?', N'C', 13, N'space', N'padding', N'margin')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (66, 136, N'Which keyword is used to declare a variable in JavaScript?', N'A', 14, N'var', N'let', N'const')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (67, 137, N'Which operator is used for strict equality comparison in JavaScript?

', N'B', 14, N'==', N'===', N'!==')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (68, 138, N'Which function is used to print output in the console in JavaScript?', N'C', 14, N'print()', N'log()
', N'console.log()')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (69, 139, N'Which JavaScript method is used to add an event listener to an element?', N'A', 14, N'addEventListener()', N'addEvent()', N'attachEvent()')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (70, 140, N'What type of data structure is [''apple'', ''banana'', ''orange''] in JavaScript?', N'B', 14, N'Object', N'Array', N'Function')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (71, 146, N'What is the primary goal of prototyping in product development?', N'C', 15, N'Finalizing the product design', N'Implementing full-scale production', N'Testing and validating ideas')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (72, 147, N'Which type of prototype is used to demonstrate the functionality of a product?', N'A', 15, N'Functional prototype', N'Visual prototype', N'Conceptual prototype')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (73, 148, N'What is the main advantage of using prototypes in product development?', N'B', 15, N'Reducing costs', N'Shortening the development time', N'Minimizing stakeholder involvement')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (74, 149, N'Which method of prototyping involves creating a physical model of the product?', N'C', 15, N'Virtual prototyping', N'Software simulation', N'3D printing')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (75, 150, N'What does a wireframe prototype primarily focus on?', N'A', 15, N'User interaction', N'Visual aesthetics
', N'Technical feasibility')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (76, 156, N'How did you find the process of navigating through the website/app?', N'B', 16, N'Neutral', N'Very easy', N'Very difficult')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (77, 157, N'What was your primary goal during this testing session?', N'C', 16, N'Gather information', N'Complete a transaction', N'Explore features
')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (78, 158, N'Would you consider using this app/website regularly', N'A', 16, N'Definitely yes', N'Probably yes', N'Not sure')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (79, 159, N'What improvements would you suggest for this app/website?', N'B', 16, N'Faster loading times', N'Simplified navigation', N'Enhanced search functionality')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (80, 160, N'How did you discover this product/service?', N'C', 16, N'Word of mouth', N'Social media', N'Online search')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (81, 166, N'Which types of personalized content do you find most valuable?', N'C', 17, N'Recommendations based on past interactions', N'Customized user interface settings', N'All of the above')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (82, 167, N'Which data is commonly used for personalizing online experiences?', N'A', 17, N'Purchase history and browsing behavior', N'Weather patterns', N'Political affiliations')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (83, 168, N'What role does AI play in personalization?', N'B', 17, N'Analyzing sales trends', N'Automating personalized content delivery', N'None of the above')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (84, 169, N'Which technique allows websites to dynamically alter content based on user behavior?', N'C', 17, N'A/B testing', N'SEO optimization', N'Dynamic content delivery')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (85, 170, N'Which of these is an example of personalization in email marketing?', N'A', 17, N'Addressing the recipient by their name and suggesting products based on past purchases', N'Using generic subject lines', N'Ignoring customer feedback')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (86, 176, N'What is the primary goal of content marketing?', N'B', 18, N'Maximizing social media likes', N'Creating and sharing relevant content', N'Enhancing customer service')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (87, 177, N'Which platform is commonly used for distributing content in content marketing strategies?', N'C', 18, N'Supermarkets', N'Movie theaters', N'Social media')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (88, 178, N'Which metric is used to measure the success of content marketing?', N'A', 18, N'Conversion rate', N'Average daily temperature', N'Number of employees')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (89, 179, N'What is a content calendar used for in content marketing?', N'B', 18, N'Counting daily website visitors', N'Planning when to post content', N'Calculating advertising costs')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (90, 180, N'Which strategy involves creating content specifically tailored to the needs and preferences of a target audience segment?', N'C', 18, N'Mass marketing', N'Universal marketing', N'Niche marketing')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (91, 186, N'What is social listening primarily concerned with?', N'A', 19, N'Monitoring social media conversations', N'Broadcasting promotional messages', N'Analyzing website traffic')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (92, 187, N'Which of the following is a key benefit of social listening?
', N'B', 19, N'Ignoring customer feedback', N'Improving brand reputation management', N'Limiting customer engagement')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (93, 188, N'Which tool is commonly used for social listening?', N'C', 19, N'Email marketing platform', N'Customer relationship management (CRM) system', N'Social media monitoring tool')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (94, 189, N'How can businesses use insights gained from social listening?', N'A', 19, N'By improving customer service', N'By developing irrelevant products', N'By ignoring customer complaints')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (95, 190, N'Which metric is commonly analyzed during social listening to measure brand health?', N'B', 19, N'Social media followers', N'Customer complaints', N'Employee satisfaction')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (96, 196, N'What is a Data Warehouse (DWH) primarily used for?', N'C', 20, N'Real-time transaction processing', N'Storing operational data', N'Analyzing historical data for decision-making')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (97, 197, N'Which of the following is a characteristic feature of a Data Warehouse?', N'A', 20, N'Subject-oriented, integrated, and time-variant data', N'Optimized for online transaction processing (OLTP)', N'Designed for real-time processing')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (98, 198, N'What is ETL in the context of Data Warehousing?', N'B', 20, N'Extraction, Transaction, and Loading', N'Extract, Transform, and Load', N'Efficient Transactional Linkage')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (99, 199, N'Which process involves cleaning and transforming data into a usable format for the Data Warehouse?', N'C', 20, N'Transaction processing', N'Extraction', N'Transforming')
GO
INSERT [dbo].[mcq_questions] ([mcq_question_ID], [question_ID], [question_text], [correct_answer], [Course_ID], [A], [B], [C]) VALUES (100, 200, N'Which component is responsible for managing and organizing data in a Data Warehouse?', N'A', 20, N'DBMS (Database Management System)', N'ETL (Extract, Transform, Load) tool', N'Data Architect')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (1, 1, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (2, 1, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (3, 1, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (4, 1, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (5, 1, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (6, 1, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (7, 1, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (8, 1, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (9, 1, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (10, 1, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (11, 2, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (12, 2, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (13, 2, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (14, 2, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (15, 2, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (16, 2, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (17, 2, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (18, 2, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (19, 2, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (20, 2, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (21, 3, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (22, 3, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (23, 3, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (24, 3, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (25, 3, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (26, 3, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (27, 3, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (28, 3, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (29, 3, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (30, 3, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (31, 4, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (32, 4, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (33, 4, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (34, 4, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (35, 4, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (36, 4, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (37, 4, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (38, 4, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (39, 4, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (40, 4, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (41, 5, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (42, 5, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (43, 5, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (44, 5, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (45, 5, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (46, 5, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (47, 5, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (48, 5, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (49, 5, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (50, 5, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (51, 6, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (52, 6, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (53, 6, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (54, 6, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (55, 6, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (56, 6, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (57, 6, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (58, 6, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (59, 6, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (60, 6, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (61, 7, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (62, 7, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (63, 7, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (64, 7, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (65, 7, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (66, 7, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (67, 7, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (68, 7, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (69, 7, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (70, 7, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (71, 8, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (72, 8, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (73, 8, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (74, 8, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (75, 8, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (76, 8, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (77, 8, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (78, 8, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (79, 8, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (80, 8, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (81, 9, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (82, 9, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (83, 9, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (84, 9, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (85, 9, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (86, 9, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (87, 9, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (88, 9, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (89, 9, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (90, 9, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (91, 10, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (92, 10, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (93, 10, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (94, 10, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (95, 10, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (96, 10, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (97, 10, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (98, 10, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (99, 10, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (100, 10, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (101, 11, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (102, 11, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (103, 11, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (104, 11, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (105, 11, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (106, 11, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (107, 11, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (108, 11, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (109, 11, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (110, 11, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (111, 12, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (112, 12, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (113, 12, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (114, 12, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (115, 12, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (116, 12, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (117, 12, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (118, 12, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (119, 12, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (120, 12, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (121, 13, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (122, 13, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (123, 13, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (124, 13, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (125, 13, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (126, 13, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (127, 13, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (128, 13, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (129, 13, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (130, 13, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (131, 14, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (132, 14, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (133, 14, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (134, 14, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (135, 14, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (136, 14, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (137, 14, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (138, 14, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (139, 14, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (140, 14, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (141, 15, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (142, 15, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (143, 15, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (144, 15, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (145, 15, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (146, 15, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (147, 15, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (148, 15, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (149, 15, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (150, 15, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (151, 16, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (152, 16, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (153, 16, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (154, 16, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (155, 16, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (156, 16, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (157, 16, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (158, 16, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (159, 16, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (160, 16, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (161, 17, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (162, 17, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (163, 17, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (164, 17, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (165, 17, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (166, 17, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (167, 17, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (168, 17, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (169, 17, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (170, 17, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (171, 18, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (172, 18, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (173, 18, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (174, 18, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (175, 18, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (176, 18, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (177, 18, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (178, 18, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (179, 18, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (180, 18, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (181, 19, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (182, 19, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (183, 19, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (184, 19, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (185, 19, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (186, 19, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (187, 19, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (188, 19, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (189, 19, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (190, 19, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (191, 20, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (192, 20, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (193, 20, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (194, 20, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (195, 20, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (196, 20, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (197, 20, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (198, 20, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (199, 20, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (200, 20, N'MCQ')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (201, 1, N'Text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (202, 1, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (203, 1, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (204, 2, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (205, 2, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (206, 2, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (207, 3, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (208, 3, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (209, 3, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (210, 4, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (211, 4, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (212, 4, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (213, 5, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (214, 5, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (215, 5, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (216, 6, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (217, 6, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (218, 6, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (219, 7, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (220, 7, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (221, 7, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (222, 8, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (223, 8, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (224, 8, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (225, 9, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (226, 9, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (227, 9, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (228, 10, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (229, 10, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (230, 10, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (231, 11, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (232, 11, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (233, 11, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (234, 12, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (235, 12, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (236, 12, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (237, 13, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (238, 13, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (239, 13, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (240, 14, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (241, 14, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (242, 14, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (243, 15, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (244, 15, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (245, 15, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (246, 16, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (247, 16, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (248, 16, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (249, 17, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (250, 17, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (251, 17, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (252, 18, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (253, 18, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (254, 18, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (255, 19, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (256, 19, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (257, 19, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (258, 20, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (259, 20, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (260, 20, N'text')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (600, 1, N'TRUE OR FALSE')
GO
INSERT [dbo].[question] ([Question_ID], [Course_ID], [question_type]) VALUES (601, 1, N'TRUE OR FALSE')
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (1, N'ahmed', N'mohamed', N'ahmedmohamed@gmailcom', 1, 1, 1)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (2, N'mohamed', N'ahmed', N'mohamedahmed@gmail.com', 1, 2, 2)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (3, N'yousif', N'mohamed', N'yousifmohamed@gmail.com', 1, 3, 3)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (4, N'yousif', N'ahmed', N'yousifahned@gmail.com', 1, 4, 1)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (5, N'ziad', N'yousif', N'ziadyousif@gmail.com', 1, 5, 2)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (6, N'yousif', N'ziad', N'yousifziad@gmail.com', 2, 1, 3)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (7, N'ziad', N'ahmed', N'ziadahmed@gmail.com', 2, 3, 2)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (8, N'ahmed', N'ziad', N'ahmedziad@gmail.com', 2, 4, 3)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (9, N'ziad', N'mohamed', N'ziadmohamed@gmaill.com', 2, 5, 1)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (10, N'mohamed', N'ziad', N'mohamedziad@gmail.com', 2, 1, 2)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (11, N'omar', N'ahmed', N'omarahmed@gmail.com', 3, 2, 3)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (12, N'omar', N'mohamed', N'omarmohamed@gmail.com', 3, 3, 1)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (13, N'mohamed', N'omar', N'mohamedomar@yahoo.com', 3, 4, 2)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (14, N'ziad', N'omar', N'ziadomar@gmail.com', 3, 5, 3)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (15, N'omar', N'ziad', N'omarziad@gmail.com', 3, 1, 1)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (16, N'belal', N'ahmed', N'belalahmed@yahoo.com', 4, 2, 2)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (17, N'ahmed', N'belal', N'ahmedbelal@yahoo.com', 4, 3, 3)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (18, N'mohamed', N'belal', N'mohamedbelal@gmail.com', 4, 4, 1)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (19, N'belal', N'mohamed', N'belalmohamed@yahoo.com', 4, 5, 2)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (20, N'yssin', N'mohamed', N'yssinmohamed@yahoo.com', 4, 1, 3)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (21, N'ahmed', N'yassin', N'ahmedyasssin@yahoo.com', 5, 2, 1)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (22, N'yassin', N'ziad', N'yassinziad@yahoo.com', 5, 3, 2)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (23, N'ziad', N'yassin', N'ziadyassin@gmaiuil.com', 5, 4, 3)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (24, N'yousif', N'yassin', N'yousifyassin@yahoo.com', 5, 5, 1)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (25, N'yassin', N'yousif', N'yassinyousif@yahoo.com', 5, 1, 2)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (26, N'mazen', N'ahmed', N'mazenahmed@yahoo.com', 6, 2, 3)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (27, N'mazen', N'mohamed', N'mazenmohamed@gmail.com', 6, 3, 1)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (28, N'ziad', N'mazen', N'ziadmaazen@gmail.com', 6, 4, 2)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (29, N'mazin', N'yousif', N'mazinyousif@gmail.com', 6, 5, 3)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (30, N'marwan', N'yousif', N'marwnyousif@yahoo.com', 6, 1, 1)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (31, N'marwan', N'ahmed', N'marwanahmed@yahoo.com', 7, 2, 2)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (32, N'marwan', N'mohamed', N'marwanmohamed@gmail.com', 7, 3, 3)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (33, N'yousif', N'marwan', N'yousifmarwan@yahoo.com', 7, 4, 1)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (34, N'ziad', N'marwan', N'ziadmarwan@gmail.com', 7, 5, 2)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (35, N'marwan', N'ziad', N'marwanziad@gmail.com', 7, 1, 3)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (36, N'mostafa', N'mohamed', N'mostafamohamed@yahoo.com', 8, 2, 1)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (37, N'mostafa', N'ahmed', N'moastafaahmed@yahoo.com', 8, 3, 2)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (38, N'ahmed', N'mostafa', N'ahmedmostafa@gmail.com', 8, 4, 3)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (39, N'mohamed', N'mostafa', N'mohamedmostafa@gmail.com', 8, 5, 1)
GO
INSERT [dbo].[Student] ([Student_ID], [St_Fname], [St_Lname], [Email], [Branch_ID], [Intake_ID], [Track_ID]) VALUES (40, N'mostafa', N'yassin', N'mostafayassin@gmail.com', 8, 1, 2)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (1, 1, 1, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (2, 2, 1, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (3, 3, 1, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (4, 4, 1, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (5, 5, 1, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (6, 6, 2, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (7, 7, 2, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (8, 8, 2, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (9, 9, 3, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (10, 10, 3, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (11, 11, 3, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (12, 12, 4, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (13, 13, 4, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (14, 14, 4, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (15, 15, 5, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (16, 16, 5, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (17, 17, 5, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (18, 18, 5, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (19, 19, 6, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (20, 20, 6, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (21, 21, 6, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (22, 22, 6, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (23, 23, 7, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (24, 24, 7, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (25, 25, 7, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (26, 26, 7, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (27, 27, 8, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (28, 28, 8, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (29, 29, 8, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (30, 30, 9, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (31, 31, 9, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (32, 32, 9, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (33, 33, 10, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (34, 34, 11, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (35, 35, 11, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (36, 36, 11, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (37, 37, 12, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (38, 38, 12, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (39, 39, 12, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (40, 40, 12, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (41, 1, 13, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (42, 2, 13, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (43, 3, 13, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (44, 4, 14, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (45, 5, 14, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (46, 6, 14, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (47, 7, 15, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (48, 8, 15, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (49, 9, 15, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (50, 10, 16, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (51, 11, 16, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (52, 12, 16, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (53, 13, 17, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (54, 14, 17, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (55, 15, 17, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (56, 16, 18, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (57, 17, 18, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (58, 18, 18, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (59, 19, 19, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (60, 20, 19, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (61, 21, 19, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (62, 22, 19, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (63, 23, 20, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (64, 24, 20, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (65, 25, 20, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (66, 26, 2, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (67, 27, 3, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (68, 28, 3, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (69, 29, 3, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (70, 30, 4, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (71, 31, 4, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (72, 32, 4, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (73, 33, 5, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (74, 34, 5, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (75, 35, 5, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (76, 36, 6, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (77, 37, 6, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (78, 38, 6, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (79, 39, 7, 2024)
GO
INSERT [dbo].[Student_course] ([SC_ID], [Student_ID], [Course_ID], [year]) VALUES (80, 40, 7, 2024)
GO
SET IDENTITY_INSERT [dbo].[Student_exam] ON 
GO
INSERT [dbo].[Student_exam] ([SE_ID], [Student_ID], [Exam_ID], [Start_date], [End_date], [result]) VALUES (1, 1, 2, CAST(N'2024-07-23T10:00:00.000' AS DateTime), CAST(N'2024-07-23T12:00:00.000' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Student_exam] OFF
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (1, N'Explain the difference between INNER JOIN, LEFT JOIN, and RIGHT JOIN in SQL.', N'INNER JOIN: Returns records that have matching values in both tables.
LEFT JOIN: Returns all records from the left table (table1), and the matched records from the right table (table2). The result is NULL from the right side, if there is no match.
RIGHT JOIN: Returns all records from the right table (table2), and the matched records from the left table (table1). The result is NULL from the left side, when there is no match.', 201, 1)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (2, N'How do you prevent SQL injection attacks when querying a database?', N'o prevent SQL injection attacks, follow these practices:

Use parameterized queries (prepared statements) with bound parameters.
Use stored procedures instead of dynamically constructed queries.
Validate and sanitize user inputs before using them in SQL queries.
Use least privilege principle for database access, restricting permissions based on need.', 202, 1)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (3, N'What is the difference between GROUP BY and HAVING clauses in SQL?', N'GROUP BY: Groups rows that have the same values into summary rows, typically to perform aggregate functions (like COUNT, SUM, AVG, etc.) on each group.
HAVING: Filters groups based on specified conditions. It is used in conjunction with the GROUP BY clause to filter the groups that are returned.', 203, 1)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (4, N'Explain the difference between list and tuple data types in Python.', N'List: Lists are mutable sequences, meaning their elements can be changed after creation. They are defined using square brackets [ ] and can hold items of different data types.
Tuple: Tuples are immutable sequences, meaning once they are created, their elements cannot be changed. They are defined using parentheses ( ) and can also hold items of different data types.', 204, 2)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (5, N'What are the differences between range and xrange in Python 2.x? Why was xrange introduced?', N'range: In Python 2.x, range returns a list of numbers, which can consume a lot of memory when dealing with large ranges.
xrange: Introduced in Python 2.x, xrange generates numbers on-the-fly, using less memory because it returns an xrange object that produces the numbers as they are needed. It behaves like a generator.
Reason for xrange: xrange was introduced to address the memory inefficiency of range, especially when dealing with large ranges, by providing a memory-efficient alternative.', 205, 2)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (6, N'Explain the difference between __str__() and __repr__() methods in Python.', N'__str__() method: This method is used to compute the "informal" or nicely printable string representation of an object. It is called by the str() function and is intended to provide a user-friendly output.
__repr__() method: This method is used to compute the "official" string representation of an object. It is called by the repr() function and is intended to provide a detailed, unambiguous representation of the object, suitable for debugging and developers.', 206, 2)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (7, N'Why is active listening important in effective communication?', N'Active listening is crucial in effective communication because it:

Demonstrates respect and empathy towards the speaker.
Helps to understand the speaker''s perspective and feelings accurately.
Facilitates clearer and more meaningful responses, fostering better rapport and mutual understanding.
Minimizes misunderstandings and conflicts by ensuring messages are received and interpreted correctly.', 207, 3)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (8, N'Describe the concept of non-verbal communication and provide examples of its impact in interpersonal interactions.', N'Non-verbal communication includes gestures, facial expressions, body language, eye contact, posture, and tone of voice. Examples of its impact in interpersonal interactions include:

A firm handshake indicating confidence and sincerity.
Maintaining eye contact to convey attentiveness and interest.
Crossed arms suggesting defensiveness or disinterest.
Smiling to express warmth and friendliness.
Leaning forward to demonstrate engagement and active listening.', 208, 3)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (9, N'How can constructive feedback contribute to personal and professional growth?', N'Constructive feedback contributes to personal and professional growth by:

Providing specific and actionable insights into strengths and areas for improvement.
Encouraging self-awareness and reflection on one''s performance and behaviors.
Fostering a culture of continuous learning and development.
Strengthening relationships by promoting open communication and trust.
Helping individuals to identify and capitalize on their strengths while addressing weaknesses effectively.', 209, 3)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (10, N'Why is clarity important in business communication, and how can it be achieved?', N'Clarity is crucial in business communication because it:

Ensures that messages are understood accurately, minimizing misunderstandings and errors.
Enhances professionalism and credibility, reflecting positively on the organization.
Facilitates decision-making and problem-solving processes by providing clear information.
Improves efficiency and productivity by reducing the need for clarification and repetition.', 210, 4)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (11, N'What are the key differences between formal and informal business communication?', N'Formal Business Communication:

Uses professional language and formal tone.
Follows established rules of grammar and etiquette.
Typically used for official correspondence, reports, presentations, and meetings.
Maintains a respectful and authoritative tone suitable for professional settings.
Informal Business Communication:

Uses conversational language and a relaxed tone.
May include slang, colloquialisms, and informal expressions.
Commonly used in day-to-day interactions, emails among colleagues, and casual discussions.
Emphasizes familiarity and camaraderie, often used to build relationships and rapport.', 211, 4)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (12, N'How can effective email etiquette contribute to professional success?', N'Effective email etiquette contributes to professional success by:

Enhancing professionalism and credibility.
Ensuring messages are clear, concise, and respectful.
Facilitating efficient communication and task management.
Avoiding misunderstandings and conflicts.
Building positive relationships with colleagues, clients, and stakeholders.', 212, 4)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (13, N'What is the difference between a worksheet and a workbook in Excel?', N'Worksheet: A worksheet is a single spreadsheet that contains cells organized in rows and columns. It is where data is entered, calculated, and analyzed.
Workbook: A workbook is a collection of one or more worksheets. It is like a file containing multiple sheets where each sheet can have different data, formulas, and formatting.', 213, 5)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (14, N'Explain the purpose and usage of conditional formatting in Excel.', N'Conditional formatting in Excel allows users to format cells based on specific conditions. Its purposes include:

Highlighting cells that meet certain criteria (e.g., values above a threshold).
Identifying trends or patterns in data through color coding.
Making data easier to interpret and analyze visually.', 214, 5)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (15, N'How does the VLOOKUP function work in Excel, and what are its key components?', N'The VLOOKUP function searches for a value in the leftmost column of a table and returns a value in the same row from a specified column. Its key components include:

Lookup Value: The value to search for.
Table Array: The range of cells containing the data.
Column Index Number: The column number in the table from which to retrieve the value.
Range Lookup (optional): A logical value indicating whether to find an exact match (FALSE) or an approximate match (TRUE).', 215, 5)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (16, N'What is the difference between population and sample in statistics?', N'Population: In statistics, a population refers to the entire set of individuals, items, or data points that are of interest to the researcher and about which conclusions are drawn.
Sample: A sample is a subset of the population that is selected for study. It is used to make inferences or generalizations about the population from which it is drawn.', 216, 6)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (17, N' Explain the concept of standard deviation and its significance in statistical analysis.', N'Standard deviation measures the amount of variation or dispersion of a set of values. It indicates how much individual data points deviate from the mean (average) of the data set.

Significance of Standard Deviation:
It provides a measure of the spread of data points around the mean.
A low standard deviation indicates that data points are close to the mean, suggesting less variability.
A high standard deviation indicates that data points are spread out from the mean, suggesting more variability.
It is used in various statistical calculations and in determining the confidence level in statistical analysis.', 217, 6)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (18, N'What is hypothesis testing, and how is it used in statistical analysis?', N'Hypothesis testing is a statistical method used to make decisions or draw conclusions about a population based on sample data. It involves:

Formulating a null hypothesis (H0) and an alternative hypothesis (H1).
Selecting a significance level (a) to determine the threshold for accepting or rejecting the null hypothesis.
Collecting data and performing statistical tests (e.g., t-test, chi-square test) to assess the probability of observing the sample results if the null hypothesis is true.
Comparing the calculated p-value with the significance level (a). If the p-value is less than a, the null hypothesis is rejected in favor of the alternative hypothesis.', 218, 6)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (19, N'What are the advantages and disadvantages of freelancing as a career choice?', N'Advantages:

Flexibility in work schedule and location.
Opportunity to choose projects and clients.
Potential for higher income based on skills and demand.
Ability to develop a diverse portfolio of work.
Independence and autonomy in decision-making.
Disadvantages:

Inconsistent income and financial stability.
Lack of employee benefits such as health insurance and retirement plans.
Responsibility for self-employment taxes and administrative tasks.
Isolation from traditional workplace camaraderie.
Need for self-discipline and time management skills.', 219, 7)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (20, N'How can freelancers market their services effectively to attract clients?', N'Effective marketing strategies for freelancers include:

Building a professional portfolio showcasing past work and achievements.
Establishing a strong online presence through a website and social media profiles.
Networking with industry peers and potential clients through online forums, networking events, and professional associations.
Using content marketing such as blogging or guest posting to demonstrate expertise.
Seeking client testimonials and referrals to build credibility and trust.', 220, 7)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (21, N'What are some key financial considerations for freelancers, and how can they manage their finances effectively?', N'Key financial considerations for freelancers include:

Budgeting for irregular income and setting aside savings for taxes and emergencies.
Tracking income and expenses using accounting software or spreadsheets.
Understanding self-employment taxes and making quarterly estimated tax payments.
Negotiating fair rates and payment terms with clients to ensure cash flow.
Investing in professional development and tools to enhance skills and efficiency.', 221, 7)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (22, N'Why is audience analysis important in preparing a presentation, and how can it be conducted effectively?', N'Audience analysis is crucial in preparing a presentation because it:

Helps speakers understand the needs, interests, and expectations of the audience.
Allows customization of content and delivery style to resonate with the audience.
Enhances engagement and receptiveness by addressing audience concerns and preferences.
Enables speakers to anticipate questions and objections, improving the overall effectiveness of the presentation.
Effective audience analysis can be conducted by:

Researching demographic information such as age, background, and knowledge level.
Gathering insights through surveys, interviews, or informal conversations with audience members.
Analyzing past interactions or feedback to understand audience preferences and communication styles.
Adapting content and messaging to align with audience interests and goals.', 222, 8)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (23, N'What are some key elements of a well-structured presentation?', N'Key elements of a well-structured presentation include:

Introduction: Grabbing attention with a compelling opening, stating the purpose, and outlining the agenda.
Body: Organizing main points logically, using clear transitions between ideas, and providing supporting evidence or examples.
Conclusion: Summarizing key points, reinforcing the main message, and providing a memorable closing statement.
Visual Aids: Using relevant and clear visuals (e.g., slides, charts, diagrams) to enhance understanding and retention.
Engagement Techniques: Incorporating audience interaction, such as questions, polls, or discussions, to maintain interest and participation.', 223, 8)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (24, N'How can speakers effectively manage nervousness before and during a presentation?', N'Effective strategies to manage nervousness before and during a presentation include:

Preparation: Thoroughly rehearsing the content and delivery to build confidence.
Visualization: Mentally visualizing a successful presentation and positive audience reactions.
Breathing Techniques: Practicing deep breathing exercises to reduce anxiety and promote relaxation.
Positive Self-Talk: Affirming oneself with positive statements and focusing on strengths and past successes.
Engagement with Audience: Establishing eye contact, smiling, and connecting with audience members to build rapport and ease tension.', 224, 8)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (25, N'What is a Real-Time Operating System (RTOS), and what distinguishes it from a general-purpose operating system?', N'A Real-Time Operating System (RTOS) is designed to manage tasks and resources in real-time applications where timing predictability and responsiveness are critical. Key distinctions from general-purpose operating systems include:

Deterministic Response: RTOS guarantees maximum response times for critical tasks, ensuring timely execution without delays.
Priority-based Scheduling: RTOS uses priority levels to schedule tasks, allowing higher priority tasks to preempt lower priority tasks to meet deadlines.
Minimal Overhead: RTOS has minimal processing and memory overhead to maintain fast and predictable response times.
Specialized Features: RTOS often includes features like interrupt handling, real-time clocks, and task synchronization mechanisms tailored for real-time requirements.', 225, 9)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (26, N'Explain the concept of task scheduling in Real-Time Operating Systems. What scheduling algorithms are commonly used?', N'Task scheduling in RTOS involves deciding the order and timing of task execution to meet real-time constraints. Commonly used scheduling algorithms include:

Rate Monotonic Scheduling (RMS): Assigns priorities based on task periods (shorter periods get higher priority) to ensure tasks with shorter deadlines are completed first.
Earliest Deadline First (EDF): Assigns priorities based on task deadlines, scheduling tasks with earlier deadlines to run first to minimize missed deadlines.
Fixed-Priority Scheduling: Assigns static priorities to tasks, where higher priority tasks preempt lower priority tasks when ready to execute.
Round Robin Scheduling: Allocates time slices to tasks in a cyclic manner, ensuring fair execution but may not guarantee real-time deadlines.', 226, 9)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (27, N'What are some common challenges and considerations in developing and deploying applications on Real-Time Operating Systems?', N'Common challenges and considerations in RTOS applications include:

Timing Analysis: Ensuring tasks meet their timing requirements without violating deadlines.
Resource Management: Efficiently managing CPU, memory, and I/O resources to prioritize critical tasks.
Concurrency and Synchronization: Implementing synchronization mechanisms like semaphores, mutexes, and message queues to manage task interactions.
Interrupt Handling: Efficiently handling hardware interrupts while maintaining real-time constraints.
Portability and Compatibility: Ensuring applications are compatible across different RTOS platforms and hardware architectures.
Testing and Validation: Conducting thorough testing to verify real-time performance, reliability, and resilience to edge cases and unexpected conditions.', 227, 9)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (28, N'What is an embedded system, and how does it differ from general-purpose computing systems?', N'An embedded system is a specialized computer system designed to perform specific tasks within a larger system or product. It differs from general-purpose computing systems in the following ways:

Purpose-Built: Embedded systems are tailored for specific applications, often with fixed functionality and limited resources (CPU, memory, etc.).
Real-Time Constraints: They operate under real-time constraints, requiring predictable response times and deterministic behavior.
Integration: They are typically integrated into larger systems or products (e.g., consumer electronics, automotive systems, industrial machinery).
Power Efficiency: They are optimized for low power consumption, often running on batteries or requiring efficient energy usage.', 228, 10)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (29, N'Explain the concept of interrupts in embedded systems. How are they used to manage system events?', N'Interrupts in embedded systems are signals that temporarily suspend the main program execution to handle a specific event or condition. They are used to manage system events by:

Priority Handling: Interrupts can have different priority levels, ensuring critical events are processed immediately.
Response Time: They allow quick response to time-sensitive events (e.g., sensor inputs, real-time data acquisition).
Asynchronous Handling: Interrupts can occur asynchronously, allowing the system to respond promptly without polling or waiting.', 229, 10)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (30, N'What are the key considerations for selecting a microcontroller for an embedded system project?', N'Key considerations for selecting a microcontroller in embedded system projects include:

Processing Power: Ensure the microcontroller can handle the computational requirements of the application.
Peripheral Integration: Check for required peripherals (e.g., ADC, UART, PWM) and interfaces (e.g., SPI, I2C) needed to interface with sensors, actuators, and other components.
Memory and Storage: Evaluate RAM and flash memory sizes for program storage and data handling.
Power Consumption: Choose a microcontroller with low-power modes to optimize energy efficiency, crucial for battery-powered devices.
Development Tools and Support: Consider availability of development tools (e.g., IDEs, compilers) and community support (e.g., forums, documentation) for ease of development and troubleshooting.
Cost and Availability: Balance performance requirements with budget constraints and ensure availability of the chosen microcontroller for production and future maintenance.', 230, 10)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (31, N'What is HTML, and what is its role in web development?', N'HTML (Hypertext Markup Language) is the standard markup language used to create and structure web pages and web applications. Its role in web development includes:

Structural Markup: Defining the structure of content on a web page using elements such as headings, paragraphs, lists, and tables.
Semantic Markup: Using tags to convey meaning and context to web browsers and assistive technologies, improving accessibility and search engine optimization (SEO).
Linking and Navigation: Creating hyperlinks to connect web pages and navigate between different sections of a website.
Integration with Other Technologies: Embedding multimedia (images, videos, audio), forms for user input, and scripts (JavaScript) for dynamic behavior.', 234, 12)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (32, N'Explain the basic structure of an HTML document.', N'<!DOCTYPE html>: Declares the document type and version of HTML being used (HTML5 in this case).
<html>: Root element that contains the entire HTML content of the document.
<head>: Container for metadata and links to external resources like stylesheets and scripts.
<meta>: Provides meta-information about the document, such as character encoding (charset) and viewport settings (viewport).
<title>: Sets the title of the web page, displayed in the browser''s title bar or tab.
<body>: Container for the main content of the web page, including text, images, links, and other elements.', 235, 12)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (33, N'How do HTML elements and attributes work together to define web content?', N'HTML elements and attributes work together to define and enhance web content:

Elements: Represent the structure and semantics of content using tags (e.g., <p>, <div>, <img>) enclosed in angle brackets. Elements can be nested to create hierarchical structures.
Attributes: Provide additional information or modify the behavior of HTML elements. Attributes are specified within the opening tag of an element and consist of a name-value pair (e.g., href="https://example.com" in <a> for hyperlink).', 236, 12)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (34, N'What is CSS, and what is its role in web development?', N'CSS (Cascading Style Sheets) is a stylesheet language used to describe the presentation of HTML (and XML) documents. Its role in web development includes:

Styling: Defining the appearance (e.g., colors, fonts, layout) of web pages to enhance visual presentation and user experience.
Consistency: Ensuring consistent design across multiple web pages by applying styles globally or selectively.
Responsiveness: Making web pages adaptable to different screen sizes and devices through responsive design techniques.
Accessibility: Improving accessibility by providing readable and navigable layouts, color contrast adjustments, and responsive text sizes.
Maintenance: Separating content (HTML) from presentation (CSS) for easier maintenance and updates.', 237, 13)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (35, N'Explain the concept of CSS selectors and provide examples of different types.', N'Element Selector: Targets all instances of a specific HTML element.
css??? ?????p {color: blue;} Class Selector: Targets elements with a specific class attribute.
css??? ????? highlight {background-color: yellow;}ID Selector: Targets a single element with a specific ID attribute. css ??? ????? #header { font-size: 24px;
}Attribute Selector: Targets elements based on attribute values.css??? ?????input[type="text"] {border: 1px solid #ccc;}Pseudo-class Selector: Targets elements based on their state or position.css??? ?????a:hover {color: red;}', 238, 13)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (36, N'How does the CSS box model work, and what are its components?', N'The CSS box model describes the structure of every HTML element as a rectangular box with the following components:

Content: The actual content of the element, such as text or images, displayed inside the box.
Padding: Space between the content and the border. It can be specified using properties like padding-top, padding-right, padding-bottom, and padding-left.
Border: A border surrounding the padding and content. It can be customized with properties like border-width, border-style, and border-color.
Margin: Space outside the border, creating gaps between elements. It can be specified using properties like margin-top, margin-right, margin-bottom, and margin-left.', 239, 13)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (37, N'What is JavaScript, and what are its key features in web development?', N'JavaScript is a high-level, interpreted programming language primarily used for adding interactivity to web pages. Its key features in web development include:

Client-Side Scripting: Runs in the web browser, allowing dynamic updates to web page content and behavior without reloading the entire page.
Event-Driven Programming: Responds to user actions (e.g., clicks, mouse movements) and triggers actions accordingly.
DOM Manipulation: Manipulates the Document Object Model (DOM) to dynamically change HTML elements and styles.
Asynchronous Programming: Supports asynchronous operations with features like callbacks, promises, and async/await for handling tasks such as data fetching and API calls.
Cross-Platform Compatibility: Works across different web browsers and platforms, enhancing the interactive capabilities of web applications.', 240, 14)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (38, N'Explain the difference between let, const, and var in JavaScript variable declarations.', N'var: Declares a variable scoped to the function in which it is declared or globally if declared outside any function. Variables declared with var can be redeclared and reassigned within their scope.

let: Introduces block-scoped variables, scoped to the nearest enclosing block (e.g., loop, conditional statement, or function). Variables declared with let can be reassigned but not redeclared within the same scope.

const: Declares variables with block scope like let, but their values cannot be reassigned once initialized. However, for objects and arrays declared with const, their properties or elements can be modified.', 241, 14)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (39, N'Describe the concept of function expressions and provide an example of their usage in JavaScript.', N'Function expressions in JavaScript are ways to define functions as expressions rather than declarations. They can be assigned to variables, passed as arguments to other functions, or used as immediate function invocations (IIFE).
Example:javascript ??? ????? // Function expression assigned to a variableconst greet = function(name) { return `Hello, ${name}!`;
};// Using the function expression console.log(greet(''John'')); // Output: Hello, John!// Function expression as an IIFE (Immediately Invoked Function Expression)
(function() {console.log(''This is an IIFE.'');})();
// Output: This is an IIFE.
Function expressions are versatile and useful for defining anonymous functions or functions that are only needed in specific contexts without polluting the global namespace.', 242, 14)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (40, N'What is prototyping in the context of product development, and why is it important?', N'Validation: Prototypes allow stakeholders to visualize and interact with a tangible representation of the product, validating design decisions and gathering feedback early in the development process.
Risk Reduction: Identifying and addressing potential issues or flaws in the design or functionality at an early stage minimizes risks and costly changes during later stages of development.
Communication: Prototypes facilitate effective communication among team members, stakeholders, and users by providing a concrete reference for discussions and decisions.
Iterative Improvement: Iterative prototyping allows for incremental improvements based on user feedback and testing results, ensuring that the final product meets user needs and expectations.
Time and Cost Efficiency: Investing in prototyping upfront can lead to time and cost savings by reducing rework and preventing costly errors in the final product.', 243, 15)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (41, N'What are the different types of prototypes used in product development, and when is each type typically used?', N'Different types of prototypes used in product development include:

Low-Fidelity Prototypes: Simple and quick representations of the product''s basic functionalities and interactions, often created using paper sketches, wireframes, or digital mockups. They are used in the early stages of design to explore concepts and gather initial feedback.
High-Fidelity Prototypes: More detailed and interactive representations that closely resemble the final product in terms of appearance and functionality. They may be created using prototyping tools or software, allowing for realistic user testing and validation of specific features or interactions.
Functional Prototypes: Fully functional versions of the product that simulate actual use and performance. They are used in later stages of development to conduct comprehensive testing, usability studies, and market validation before production.', 244, 15)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (42, N'What are the key steps involved in the prototyping process?', N'The key steps in the prototyping process typically include:

Define Objectives: Establish clear goals and objectives for the prototype, including what aspects of the product will be tested or validated.
Conceptualization: Generate ideas and concepts for the prototype based on user needs, design requirements, and technical feasibility.
Design: Create initial sketches, wireframes, or digital mockups to visualize the structure, layout, and interactions of the prototype.
Prototype Development: Build the prototype using appropriate tools, materials, or software, focusing on achieving the desired level of fidelity and functionality.
Testing and Evaluation: Conduct usability testing and gather feedback from stakeholders, users, or target audience to assess usability, functionality, and overall user experience.
Iteration: Refine the prototype based on feedback and testing results, making iterative improvements to address issues and optimize performance.
Documentation: Document the design decisions, changes made during the prototyping process, and final specifications to guide further development and production.', 245, 15)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (43, N'What is software testing, and why is it important in the software development lifecycle?', N'Software testing is the process of evaluating and verifying a software application or system to ensure it meets specified requirements and performs as expected. It is important in the software development lifecycle because:

Bug Detection: Testing helps identify defects, errors, or bugs in the software early in the development process, reducing the likelihood of issues in production.
Quality Assurance: Ensures that the software meets quality standards and performs reliably under different conditions, enhancing user satisfaction and trust.
Risk Mitigation: Helps mitigate risks associated with software failures, security vulnerabilities, and performance issues that could impact business operations or user experience.
Validation: Validates that the software functions correctly according to functional and non-functional requirements specified during design and development.
Continuous Improvement: Provides feedback to developers for iterative improvements, optimizing code quality, performance, and usability over time.
Compliance: Ensures compliance with industry standards, regulations, and customer expectations, maintaining integrity and reliability of the software.', 246, 16)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (44, N'Explain the difference between manual testing and automated testing. When would you choose each approach?', N'Manual Testing: Involves human testers executing test cases manually without the use of automation tools. It is suitable for:

Exploratory testing to uncover unexpected behavior or usability issues.
Ad hoc testing to verify software functionality in real-world scenarios.
User interface (UI) testing to evaluate user interactions and visual elements.
Initial testing of new features or functionalities where automated scripts are not yet available or practical.
Automated Testing: Involves using automated testing tools and scripts to execute test cases, compare results, and generate reports automatically. It is suitable for:

Regression testing to verify that recent code changes have not affected existing functionalities.
Performance testing to simulate user load and measure system responsiveness.
Unit testing and integration testing to validate code modules and interfaces.
Test cases that need to be executed repeatedly with consistent results and minimal human intervention.', 247, 16)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (45, N'What are the key phases of the software testing lifecycle (STLC)? Briefly explain each phase.', N'The key phases of the Software Testing Lifecycle (STLC) typically include:

Requirement Analysis: Analyzing software requirements to understand the scope of testing, defining test objectives, and identifying testable features and functionalities.

Test Planning: Creating a test plan that outlines test strategy, scope, resources, timelines, and deliverables. It includes defining test cases, test data, and entry/exit criteria for each testing phase.

Test Design: Developing test cases and test scenarios based on functional specifications, business requirements, and user scenarios. Test design also includes creating test scripts for automated testing if applicable.

Test Execution: Running test cases, scripts, and scenarios to execute planned tests and verify software behavior against expected results. Test execution includes logging defects, issues, and deviations from expected outcomes.

Defect Tracking: Recording, reporting, and managing defects identified during testing. Defect tracking involves prioritizing issues based on severity and impact, collaborating with development teams for resolution, and verifying fixes.

Test Closure: Evaluating test results, generating test summary reports, and analyzing overall testing activities. Test closure includes assessing test coverage, documenting lessons learned, and preparing for final release or deployment.', 248, 16)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (46, N' What is personalization in the context of customer experience, and why is it important for businesses?', N'Personalization in the context of customer experience refers to tailoring products, services, content, and interactions to meet the specific needs, preferences, and behaviors of individual customers or user segments. It is important for businesses because:

Enhanced Customer Engagement: Personalization fosters deeper connections with customers by delivering relevant and meaningful experiences that resonate with their interests and preferences.
Improved Customer Satisfaction: By anticipating customer needs and providing personalized recommendations or solutions, businesses can enhance satisfaction and loyalty.
Increased Conversion Rates: Personalized marketing messages and product recommendations can lead to higher conversion rates as they align more closely with customer interests and buying intentions.
Better Marketing ROI: Targeted and personalized marketing campaigns often yield higher returns on investment (ROI) by focusing resources on high-potential customers and improving campaign effectiveness.
Competitive Advantage: Businesses that successfully implement personalization strategies can differentiate themselves from competitors by offering superior customer experiences tailored to individual preferences.', 249, 17)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (47, N'What are some common techniques and technologies used for personalization in digital marketing and e-commerce?', N'Common techniques and technologies used for personalization in digital marketing and e-commerce include:

Behavioral Targeting: Analyzing user behavior and preferences based on browsing history, purchase patterns, and interaction data to personalize content and recommendations.
Recommendation Engines: Using algorithms to suggest products, services, or content based on past behaviors, user preferences, and similarities with other users (collaborative filtering).
Dynamic Content: Tailoring website content, advertisements, or email campaigns in real-time based on user demographics, interests, or browsing context.
Personalized Emails: Sending targeted emails with relevant content, product recommendations, or special offers based on user behavior, preferences, or lifecycle stage.
A/B Testing: Experimenting with different versions of web pages, emails, or ads to identify which variations perform better in terms of engagement and conversion for different user segments.
AI and Machine Learning: Utilizing artificial intelligence (AI) and machine learning algorithms to analyze large datasets, predict user behavior, and automate personalized experiences at scale.', 250, 17)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (48, N'What are the ethical considerations businesses should address when implementing personalization strategies?', N'Transparency: Clearly communicating to customers how their data will be used for personalization purposes and obtaining explicit consent where necessary.
Data Privacy: Ensuring compliance with data protection regulations (e.g., GDPR, CCPA) by safeguarding customer data, implementing secure data practices, and offering opt-out options.
Fairness and Bias: Mitigating biases in algorithms and personalization models that could lead to unfair or discriminatory treatment based on factors such as race, gender, or socioeconomic status.
Customer Trust: Building and maintaining trust by using customer data responsibly, respecting privacy preferences, and being transparent about data usage and security measures.
User Control: Providing users with control over their personalization settings, preferences, and the ability to modify or delete their data as needed.
Accountability: Establishing processes for monitoring and auditing personalization practices to ensure ethical standards are upheld and addressing any issues or complaints promptly.', 251, 17)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (49, N'What is content marketing, and how does it benefit businesses?', N'Content marketing is a strategic marketing approach focused on creating and distributing valuable, relevant, and consistent content to attract and retain a clearly defined audience — and, ultimately, to drive profitable customer action. It benefits businesses in several ways:

Audience Engagement: Content marketing engages target audiences by providing valuable information, solving problems, or addressing their needs and interests.
Brand Awareness: It increases brand visibility and recognition through consistent content distribution across various channels (e.g., blog posts, social media, videos).
Lead Generation: Effective content marketing attracts potential customers by offering relevant content that educates, informs, or entertains, thereby generating leads.
Customer Trust and Loyalty: Providing valuable content builds trust with customers, positioning the business as a credible authority in its industry and fostering long-term customer relationships.
SEO Benefits: Quality content that is optimized for search engines can improve organic search rankings, driving more traffic to the business website.
Cost-Effectiveness: Compared to traditional advertising, content marketing can be more cost-effective in generating leads and nurturing customer relationships over time.', 252, 18)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (50, N'Describe the key components of a successful content marketing strategy.', N'Key components of a successful content marketing strategy include:

Goal Setting: Establishing clear objectives such as increasing brand awareness, generating leads, driving sales, or improving customer retention.
Audience Research: Understanding the target audience''s demographics, preferences, behaviors, and pain points to create relevant and valuable content.
Content Planning and Creation: Developing a content calendar and creating high-quality content (e.g., articles, videos, infographics) that aligns with audience interests and supports business goals.
Content Distribution: Strategically distributing content across appropriate channels (e.g., website, blog, social media, email newsletters) to reach and engage the target audience.
SEO Optimization: Optimizing content with relevant keywords, meta tags, and backlinks to improve search engine visibility and attract organic traffic.
Measurement and Analytics: Monitoring key performance indicators (KPIs) such as website traffic, engagement metrics, lead conversions, and ROI to evaluate the effectiveness of content marketing efforts.
Iterative Improvement: Analyzing data and insights to refine content strategies, experiment with new ideas, and continuously improve performance over time.', 253, 18)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (51, N'How does content marketing support the customer journey? Provide examples of content types for different stages of the customer journey.', N'Content marketing supports the customer journey by providing relevant information and guiding prospects through different stages of the buying process:

Awareness Stage: Attracting the attention of potential customers who are exploring their challenges or needs. Example content types include informative blog posts, educational videos, infographics, and social media posts that address common industry issues or trends.

Consideration Stage: Helping prospects evaluate possible solutions and consider the business as a potential provider. Example content includes in-depth guides, comparison articles, case studies, and webinars that highlight the benefits and features of products or services.

Decision Stage: Influencing prospects to make a purchase decision by providing compelling reasons to choose the business over competitors. Example content includes customer testimonials, product demonstrations, free trials, and special offers or discounts.', 254, 18)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (52, N'What is social listening, and how does it benefit businesses?', N'Social listening is the process of monitoring social media platforms and other online channels to track conversations, mentions, and sentiments about a brand, product, industry, or relevant topics. It benefits businesses in several ways:

Customer Insights: Provides valuable insights into customer preferences, opinions, and sentiments, helping businesses understand customer needs and expectations better.
Brand Reputation Management: Monitors brand mentions and conversations to identify potential issues or crises early, allowing businesses to respond promptly and manage reputation effectively.
Competitive Analysis: Tracks competitors'' activities, trends, and customer feedback to benchmark performance, identify opportunities, and stay competitive in the market.
Campaign Effectiveness: Evaluates the impact of marketing campaigns, product launches, or events by measuring audience engagement, sentiment trends, and brand perception.
Product Development: Gathers feedback and identifies customer pain points or improvement suggestions, informing product development decisions and enhancing offerings.
Market Intelligence: Identifies emerging trends, industry developments, and consumer behaviors that can guide strategic decision-making and business growth.', 255, 19)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (53, N'What are the key steps involved in implementing an effective social listening strategy?', N'Key steps in implementing an effective social listening strategy include:

Set Objectives: Define clear goals and objectives for social listening, such as understanding customer sentiment, monitoring brand reputation, or gathering market intelligence.
Select Tools: Choose appropriate social listening tools and platforms based on the business needs, budget, and desired features (e.g., sentiment analysis, real-time monitoring).
Define Keywords: Identify relevant keywords, hashtags, and phrases related to the brand, industry, competitors, and relevant topics to monitor and analyze.
Monitor Conversations: Monitor social media platforms, forums, blogs, news sites, and review sites to track mentions, discussions, and trends.
Analyze Data: Analyze social listening data to uncover insights, trends, and patterns in customer sentiment, engagement levels, and brand perception.
Take Action: Use insights from social listening to inform marketing strategies, improve customer service, address issues, and capitalize on opportunities.
Measure Impact: Evaluate the impact of social listening efforts by measuring key metrics such as sentiment changes, brand mentions, audience engagement, and ROI.', 256, 19)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (54, N'How can businesses leverage social listening to enhance customer engagement and satisfaction? Provide examples.', N'Businesses can leverage social listening to enhance customer engagement and satisfaction by:

Responding to Customer Feedback: Monitoring customer comments, reviews, and messages to promptly address inquiries, resolve issues, and acknowledge positive feedback.
Personalizing Customer Interactions: Tailoring responses and content based on customer preferences, behaviors, and sentiment to create personalized experiences.
Identifying Trends and Opportunities: Detecting emerging trends, customer preferences, and market demands to adapt offerings, develop new products/services, or launch targeted campaigns.
Improving Customer Service: Analyzing common complaints, concerns, or pain points shared by customers to improve products, services, or customer service processes.
Building Brand Advocacy: Identifying and engaging with brand advocates or influencers who positively impact brand perception and encourage word-of-mouth marketing.', 257, 19)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (55, N'What is a communication protocol, and why is it essential in computer networks?', N'A communication protocol is a set of rules and conventions that govern the exchange of information between devices or systems in a network. It defines the format, timing, sequencing, and error control mechanisms necessary for reliable communication. Communication protocols are essential in computer networks because:

Standardization: They ensure compatibility and interoperability between different hardware and software systems, allowing devices from different manufacturers to communicate effectively.
Reliability: Protocols define error detection and correction mechanisms to ensure data integrity and reliability during transmission.
Efficiency: By specifying efficient data transmission methods and optimizing bandwidth usage, protocols help improve network performance and responsiveness.
Security: Many protocols include encryption, authentication, and access control mechanisms to protect data from unauthorized access and ensure privacy.
Scalability: Protocols support network scalability by defining how devices can join or leave the network dynamically without disrupting ongoing communications.', 231, 11)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (56, N'Explain the difference between TCP (Transmission Control Protocol) and UDP (User Datagram Protocol). In what scenarios would you choose each protocol?', N'TCP (Transmission Control Protocol): TCP is a connection-oriented protocol that guarantees reliable and ordered delivery of data packets over a network. It establishes a connection between sender and receiver, manages data flow control, and retransmits lost packets. TCP is suitable for scenarios where data integrity and reliability are crucial, such as file transfer, email communication, web browsing, and other applications requiring error-free transmission.

UDP (User Datagram Protocol): UDP is a connectionless protocol that provides a minimalistic data exchange mechanism without the reliability guarantees of TCP. It does not establish a connection before sending data and does not manage packet sequencing or error recovery. UDP is preferred in scenarios where low latency and high-speed transmission are prioritized over data reliability, such as real-time multimedia streaming, online gaming, DNS queries, and Voice over IP (VoIP) applications.', 232, 11)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (57, N'Describe the OSI (Open Systems Interconnection) model and its seven layers. How does the OSI model facilitate communication between devices in a network?', N'The OSI model is a conceptual framework that standardizes the functions of communication systems into seven distinct layers, each responsible for specific tasks in data transmission and network operation. The layers of the OSI model are:

Physical Layer: Deals with the physical aspects of transmitting data bits over a physical medium (e.g., cables, wireless signals).

Data Link Layer: Manages data frames between devices on the same network segment, providing error detection and correction.

Network Layer: Handles routing and forwarding of data packets between different networks, addressing, and logical network topology.

Transport Layer: Ensures reliable end-to-end data transfer between host systems, handling segmentation, flow control, and error recovery (e.g., TCP and UDP operate at this layer).

Session Layer: Manages sessions between applications running on different devices, establishing, maintaining, and terminating connections.

Presentation Layer: Handles data translation, encryption, and compression to ensure that data sent by one application layer is readable by another.

Application Layer: Provides interface between user applications and the network, supporting various application-level protocols (e.g., HTTP, FTP, SMTP).', 233, 11)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (58, N'What is a data warehouse, and why is it important for business intelligence?', N'A data warehouse is a centralized repository of integrated and structured data from multiple sources, designed to support decision-making processes and business analysis. It is important for business intelligence because:

Centralized Data Storage: Data warehouses consolidate data from various operational systems into a single, unified repository, providing a comprehensive view of the organization''s data.
Data Integration: They integrate data from different sources (e.g., databases, ERP systems, CRM systems) into a consistent format, enabling analysis across disparate data sets.
Historical Data Analysis: Data warehouses store historical data over extended periods, allowing analysts to analyze trends, patterns, and historical performance for strategic decision-making.
Query and Analysis: They support complex queries and analytical processing, providing fast access to aggregated and summarized data for reporting and ad-hoc analysis.
Business Performance Monitoring: Data warehouses facilitate monitoring and tracking key performance indicators (KPIs), metrics, and business trends to measure performance and identify opportunities or issues.
Support for Decision-Making: By providing reliable, accurate, and timely information, data warehouses empower decision-makers with actionable insights and support data-driven strategies.', 258, 20)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (59, N'What are the key components of a data warehouse architecture? Briefly explain each component.', N'Key components of a data warehouse architecture include:

Extract, Transform, Load (ETL) Process: ETL processes extract data from source systems, transform it into a consistent format suitable for analysis, and load it into the data warehouse. This ensures data quality and consistency.

Data Storage: The data storage layer consists of the actual database where integrated and transformed data is stored. It may include relational databases, columnar databases, or other specialized storage solutions optimized for query performance.

Data Warehouse Server: The server manages and provides access to the data warehouse, handling user queries, data retrieval, and security controls.

Metadata Repository: Metadata, such as data definitions, data lineage, and transformation rules, is stored in a metadata repository. It provides information about the structure, relationships, and context of data stored in the data warehouse.

Query and Analysis Tools: Tools and interfaces allow users to query, analyze, and visualize data stored in the warehouse. These include reporting tools, OLAP (Online Analytical Processing) tools, and data mining tools.

Data Mart: A data mart is a subset of a data warehouse focused on a specific business function, department, or user group. It contains summarized and pre-aggregated data optimized for a particular type of analysis or reporting.', 259, 20)
GO
INSERT [dbo].[text questions] ([TEXT_QUESTION_ID], [question_text], [AcceptedTextAnswer], [question_ID], [CourseID]) VALUES (60, N'What are the differences between OLTP (Online Transaction Processing) and OLAP (Online Analytical Processing) systems? How do they support different business needs?', N'OLTP (Online Transaction Processing): OLTP systems are designed for real-time transactional processing and data entry. They manage day-to-day operational activities, such as order processing, inventory management, and customer transactions. Key characteristics include:

Fast response times for individual transactions.
High throughput and concurrency to handle multiple users simultaneously.
Normalized data schema optimized for transactional efficiency.
Focus on maintaining data integrity and consistency in real-time.
OLAP (Online Analytical Processing): OLAP systems are designed for complex analysis and querying of large volumes of historical and aggregated data stored in data warehouses. They support decision support and business intelligence activities, such as trend analysis, forecasting, and strategic planning. Key characteristics include:

Complex queries for multidimensional analysis (e.g., slicing, dicing, drilling down/up).
Aggregated and summarized data optimized for analytical queries.
Denormalized data schema optimized for query performance and analytical processing.
Support for decision-makers and analysts to explore data, identify trends, and make informed decisions.', 260, 20)
GO
INSERT [dbo].[Track] ([Track_ID], [Track_Name]) VALUES (1, N'Power BI')
GO
INSERT [dbo].[Track] ([Track_ID], [Track_Name]) VALUES (2, N'Web Development ')
GO
INSERT [dbo].[Track] ([Track_ID], [Track_Name]) VALUES (3, N'Embeded System')
GO
INSERT [dbo].[Track] ([Track_ID], [Track_Name]) VALUES (4, N'UI/UX')
GO
INSERT [dbo].[Track] ([Track_ID], [Track_Name]) VALUES (5, N'digital marketing')
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (1, N'Truncate is DML cmmand', N'True', 1, 1)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (2, N'Outer joins are three type', N'False', 2, 1)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (3, N'Select Query is DDL comand', N'False', 3, 1)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (4, N'Aggregate function give one result ', N'True', 4, 1)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (5, N'primary key can be duplicate', N'False', 5, 1)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (6, N'python Must have Main function', N'False', 11, 2)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (7, N'C is response faster than python', N'True', 12, 2)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (8, N'the oop stands for object orianted programming', N'True', 13, 2)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (9, N'python is high level function', N'True', 14, 2)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (10, N'python tuples are immutable datatype', N'True', 15, 2)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (11, N'Active listening involves only hearing the words spoken by the other person', N'False', 21, 3)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (12, N'body language and facial expressions, does not significantly affect how messages are received.', N'False', 22, 3)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (13, N'Feedback should be given regularly and constructively, in both formal and informal settings, to facilitate continuous improvement and communication effectiveness.
', N'True', 23, 3)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (14, N'ultitasking during conversations can signal disinterest and hinder effective communication by reducing focus and attentiveness.
', N'True', 24, 3)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (15, N'Adapting your communication style to cultural differences promotes understanding and respect,', N'True', 25, 3)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (16, N'It''s appropriate to use jargon and technical terms extensively in business communication to demonstrate expertise.', N'False', 31, 4)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (17, N'Proofreading is essential in business writing to ensure clarity, correctness, and professionalism.', N'True', 32, 4)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (18, N'It''s acceptable to use emojis and informal language in business emails', N'False', 33, 4)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (19, N'Email subject lines should be specific and informative to increase the likelihood of the recipient opening the email.', N'True', 34, 4)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (20, N': It''s acceptable to use passive voice in business writing to sound more formal and professional.', N'True', 35, 4)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (21, N'Excel functions always begin with the "=" sign', N'True', 41, 5)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (22, N'Excel can only handle numerical data; it cannot manipulate text', N'False', 42, 5)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (23, N'Conditional formatting in Excel allows you to apply different formatting styles based on specified conditions', N'True', 43, 5)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (24, N'Charts and graphs in Excel are static and cannot be updated if underlying data changes.', N'False', 44, 5)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (25, N'PivotTables in Excel are used primarily for data entry and not for data analysis', N'False', 45, 5)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (26, N'In linear regression, the goal is to minimize the sum of squared residuals (errors) between predicted and actual values.', N'True', 51, 6)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (27, N'The probability of an event always ranges between 0 and 1, inclusive.', N'True', 52, 6)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (28, N'K-values do not directly refer to the number of clusters in K-means clustering when discussing linear regression', N'False', 53, 6)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (29, N'Linear regression cannot directly model probabilities for binary outcomes', N'False', 54, 6)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (30, N'The Central Limit Theorem states that the sampling distribution of the sample mean approaches a normal distribution as the sample size increases, regardless of the population distribution.', N'True', 55, 6)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (31, N'Freelancing often allows for flexibility in work hours and location, enabling individuals to work at times and places that suit them best.', N'True', 61, 7)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (32, N'Freelancers usually work exclusively with one client at a time and on a single type of project.', N'False', 62, 7)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (33, N' Freelancers may experience fluctuating income depending on client demand and project availability.', N'True', 63, 7)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (34, N' Freelancers have limited opportunities for skill development compared to employees in a structured work environment.', N'False', 64, 7)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (35, N' Freelancers have less job security compared to traditional employees', N'False', 65, 7)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (36, N'A presenter can deliver a successful presentation without considering the audience''s background and expectations.', N'False', 71, 8)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (72, N'High-fidelity prototypes are typically created early in the design process', N'False', 142, 15)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (73, N'Prototypes can be both physical and digital', N'True', 143, 15)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (74, N'Prototyping is only useful in the software development industry', N'False ', 144, 15)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (75, N'Low-fidelity prototypes are usually faster and cheaper to create than high-fidelity prototypes', N'True', 145, 15)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (76, N'User testing involves evaluating a product by testing it with real users', N'True', 151, 16)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (77, N'User testing is only conducted at the end of the development process', N'False', 152, 16)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (78, N'User testing can help identify usability issues in a product', N'True', 153, 16)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (79, N'User testing is not useful for improving the user experience (UX) of a product', N'False ', 154, 16)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (80, N'User testing can be conducted in-person or remotely', N'True', 155, 16)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (81, N'Personalization involves tailoring a product or service to meet individual user preferences and needs', N'True ', 161, 17)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (82, N'Personalization is only applicable to online services and digital products', N'False', 162, 17)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (83, N'Using user data and behavior patterns is essential for effective personalization', N'True', 163, 17)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (84, N'Personalization cannot be achieved without collecting any user data', N'False', 164, 17)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (85, N'Personalization can help increase user engagement and loyalty', N'True', 165, 17)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (86, N'Content marketing involves creating and distributing valuable, relevant content to attract and engage a target audience', N'True', 171, 18)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (87, N'Content marketing is focused solely on driving immediate sales', N'False', 172, 18)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (88, N'Blog posts, videos, and infographics are all forms of content marketing', N'True', 173, 18)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (89, N'Content marketing is only suitable for large businesses', N'False', 174, 18)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (90, N'Social media platforms can be used to distribute content marketing materials', N'True', 175, 18)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (91, N'Social listening involves monitoring social media channels for mentions of your brand', N'True', 181, 19)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (92, N'Social listening is only useful for large corporations', N'False ', 182, 19)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (93, N'Social listening tools can track keywords, hashtags, and brand mentions', N'True', 183, 19)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (94, N'Social listening does not provide insights into competitor activities', N'False', 184, 19)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (95, N'Social listening can help detect potential crises before they escalate', N'True', 185, 19)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (96, N'A data warehouse (DWH) is designed to support transaction processing systems', N'False', 191, 20)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (97, N'Data warehouses integrate data from multiple heterogeneous sources', N'True', 192, 20)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (98, N'Data in a data warehouse is typically updated in real-time', N'Fasle', 193, 20)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (99, N'ETL stands for Extract, Transform, and Load, which are key processes in data warehousing', N'True', 194, 20)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (100, N'Data warehouses do not support data mining activities', N'False', 195, 20)
GO
INSERT [dbo].[true or false questions] ([true_OR_False_Q_ID], [question_text], [correct_answer], [question_ID], [CourseID]) VALUES (601, N'sql stands for structured query language ', N'True', 601, 1)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [course_index_crs_description]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [course_index_crs_description] ON [dbo].[Course]
(
	[Crs_description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG_Courses]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [course_index_crs_name]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [course_index_crs_name] ON [dbo].[Course]
(
	[Crs_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG_Courses]
GO
/****** Object:  Index [exam_index_course_ID]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [exam_index_course_ID] ON [dbo].[Exam]
(
	[Course_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG_Exams]
GO
/****** Object:  Index [exam_index_instructor_ID]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [exam_index_instructor_ID] ON [dbo].[Exam]
(
	[Instructor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG_Exams]
GO
/****** Object:  Index [exam_index_track_ID]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [exam_index_track_ID] ON [dbo].[Exam]
(
	[Track_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG_Exams]
GO
/****** Object:  Index [exam_question_degree]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [exam_question_degree] ON [dbo].[Exam_question]
(
	[Degree] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [exam_question_exam_ID]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [exam_question_exam_ID] ON [dbo].[Exam_question]
(
	[Exam_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [exam_question_question_ID]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [exam_question_question_ID] ON [dbo].[Exam_question]
(
	[Question_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [exam_question_question_type]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [exam_question_question_type] ON [dbo].[Exam_question]
(
	[question_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__instruct__A9D10534AEB42D45]    Script Date: 8/5/2024 5:56:00 AM ******/
ALTER TABLE [dbo].[instructor] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [instructor_index_FN]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [instructor_index_FN] ON [dbo].[instructor]
(
	[Ins_Fname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [instructor_index_LN]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [instructor_index_LN] ON [dbo].[instructor]
(
	[ins_Lname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [instructor_course_instructorID_index]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [instructor_course_instructorID_index] ON [dbo].[instructor_course]
(
	[instructor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [instructor_courseID_index]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [instructor_courseID_index] ON [dbo].[instructor_course]
(
	[course_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [mcq_quesiton_course_ID]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [mcq_quesiton_course_ID] ON [dbo].[mcq_questions]
(
	[Course_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG_Courses]
GO
/****** Object:  Index [mcq_quesiton_ID]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [mcq_quesiton_ID] ON [dbo].[mcq_questions]
(
	[question_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG_Courses]
GO
/****** Object:  Index [question_index_course_id]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [question_index_course_id] ON [dbo].[question]
(
	[Course_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [question_index_question_type]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [question_index_question_type] ON [dbo].[question]
(
	[question_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Student__A9D10534F15E061B]    Script Date: 8/5/2024 5:56:00 AM ******/
ALTER TABLE [dbo].[Student] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [student_Index_Branch]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [student_Index_Branch] ON [dbo].[Student]
(
	[Branch_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG_Students]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [student_Index_Fn]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [student_Index_Fn] ON [dbo].[Student]
(
	[St_Fname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG_Students]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [student_Index_LN]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [student_Index_LN] ON [dbo].[Student]
(
	[St_Lname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG_Students]
GO
/****** Object:  Index [student_answer_index_e_ID]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [student_answer_index_e_ID] ON [dbo].[Student_answer]
(
	[Exam_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG_StudentAnswers]
GO
/****** Object:  Index [student_answer_index_q_ID]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [student_answer_index_q_ID] ON [dbo].[Student_answer]
(
	[question_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG_StudentAnswers]
GO
/****** Object:  Index [student_answer_index_st_ID]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [student_answer_index_st_ID] ON [dbo].[Student_answer]
(
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG_StudentAnswers]
GO
/****** Object:  Index [st_crs_crs_ID]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [st_crs_crs_ID] ON [dbo].[Student_course]
(
	[Course_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [st_crs_st_ID]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [st_crs_st_ID] ON [dbo].[Student_course]
(
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [student_Exam_date]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [student_Exam_date] ON [dbo].[Student_exam]
(
	[Start_date] ASC,
	[End_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [student_Exam_e_id]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [student_Exam_e_id] ON [dbo].[Student_exam]
(
	[Exam_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [student_Exam_st_id]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [student_Exam_st_id] ON [dbo].[Student_exam]
(
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [student_result]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [student_result] ON [dbo].[Student_exam]
(
	[result] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [PK_text_questions]    Script Date: 8/5/2024 5:56:00 AM ******/
ALTER TABLE [dbo].[text questions] ADD  CONSTRAINT [PK_text_questions] PRIMARY KEY NONCLUSTERED 
(
	[TEXT_QUESTION_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG_Courses]
GO
/****** Object:  Index [text_index_crs_ID]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [text_index_crs_ID] ON [dbo].[text questions]
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG_Courses]
GO
/****** Object:  Index [text_index_q_ID]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [text_index_q_ID] ON [dbo].[text questions]
(
	[question_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG_Courses]
GO
/****** Object:  Index [PK_true_or_false_questions]    Script Date: 8/5/2024 5:56:00 AM ******/
ALTER TABLE [dbo].[true or false questions] ADD  CONSTRAINT [PK_true_or_false_questions] PRIMARY KEY NONCLUSTERED 
(
	[true_OR_False_Q_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG_Courses]
GO
/****** Object:  Index [TF_index_crs_ID]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [TF_index_crs_ID] ON [dbo].[true or false questions]
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG_Courses]
GO
/****** Object:  Index [TF_index_q_ID]    Script Date: 8/5/2024 5:56:00 AM ******/
CREATE NONCLUSTERED INDEX [TF_index_q_ID] ON [dbo].[true or false questions]
(
	[question_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG_Courses]
GO
ALTER TABLE [dbo].[Course] ADD  CONSTRAINT [df1]  DEFAULT ((100)) FOR [Max_degree]
GO
ALTER TABLE [dbo].[Course] ADD  CONSTRAINT [df2]  DEFAULT ((60)) FOR [Min_degree]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Branch] FOREIGN KEY([Branch_ID])
REFERENCES [dbo].[Branch] ([Branch_ID])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Branch]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Course] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Course]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_instructor] FOREIGN KEY([Instructor_ID])
REFERENCES [dbo].[instructor] ([Instructor_ID])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_instructor]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Intake] FOREIGN KEY([Intake_ID])
REFERENCES [dbo].[Intake] ([Intake_ID])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Intake]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Track] FOREIGN KEY([Track_ID])
REFERENCES [dbo].[Track] ([Track_ID])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Track]
GO
ALTER TABLE [dbo].[Exam_question]  WITH CHECK ADD  CONSTRAINT [FK_Exam_question_Exam] FOREIGN KEY([Exam_ID])
REFERENCES [dbo].[Exam] ([Exam_ID])
GO
ALTER TABLE [dbo].[Exam_question] CHECK CONSTRAINT [FK_Exam_question_Exam]
GO
ALTER TABLE [dbo].[Exam_question]  WITH CHECK ADD  CONSTRAINT [FK_Exam_question_question] FOREIGN KEY([Question_ID])
REFERENCES [dbo].[question] ([Question_ID])
GO
ALTER TABLE [dbo].[Exam_question] CHECK CONSTRAINT [FK_Exam_question_question]
GO
ALTER TABLE [dbo].[instructor]  WITH CHECK ADD  CONSTRAINT [FK_instructor_instructor] FOREIGN KEY([Instructor_ID])
REFERENCES [dbo].[instructor] ([Instructor_ID])
GO
ALTER TABLE [dbo].[instructor] CHECK CONSTRAINT [FK_instructor_instructor]
GO
ALTER TABLE [dbo].[instructor_course]  WITH CHECK ADD  CONSTRAINT [FK_instructor_course_Course] FOREIGN KEY([course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[instructor_course] CHECK CONSTRAINT [FK_instructor_course_Course]
GO
ALTER TABLE [dbo].[instructor_course]  WITH CHECK ADD  CONSTRAINT [FK_instructor_course_instructor] FOREIGN KEY([instructor_ID])
REFERENCES [dbo].[instructor] ([Instructor_ID])
GO
ALTER TABLE [dbo].[instructor_course] CHECK CONSTRAINT [FK_instructor_course_instructor]
GO
ALTER TABLE [dbo].[mcq_questions]  WITH CHECK ADD  CONSTRAINT [FK_mcq_questions_question] FOREIGN KEY([question_ID])
REFERENCES [dbo].[question] ([Question_ID])
GO
ALTER TABLE [dbo].[mcq_questions] CHECK CONSTRAINT [FK_mcq_questions_question]
GO
ALTER TABLE [dbo].[mcq_questions]  WITH CHECK ADD  CONSTRAINT [FK_MCQQuestions_Courses] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[mcq_questions] CHECK CONSTRAINT [FK_MCQQuestions_Courses]
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD  CONSTRAINT [FK_question_Course] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[question] CHECK CONSTRAINT [FK_question_Course]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Branch] FOREIGN KEY([Branch_ID])
REFERENCES [dbo].[Branch] ([Branch_ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Branch]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Intake] FOREIGN KEY([Intake_ID])
REFERENCES [dbo].[Intake] ([Intake_ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Intake]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Track] FOREIGN KEY([Track_ID])
REFERENCES [dbo].[Track] ([Track_ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Track]
GO
ALTER TABLE [dbo].[Student_answer]  WITH CHECK ADD  CONSTRAINT [FK_Student_answer_Exam] FOREIGN KEY([Exam_ID])
REFERENCES [dbo].[Exam] ([Exam_ID])
GO
ALTER TABLE [dbo].[Student_answer] CHECK CONSTRAINT [FK_Student_answer_Exam]
GO
ALTER TABLE [dbo].[Student_answer]  WITH CHECK ADD  CONSTRAINT [FK_Student_answer_question] FOREIGN KEY([question_ID])
REFERENCES [dbo].[question] ([Question_ID])
GO
ALTER TABLE [dbo].[Student_answer] CHECK CONSTRAINT [FK_Student_answer_question]
GO
ALTER TABLE [dbo].[Student_answer]  WITH CHECK ADD  CONSTRAINT [FK_Student_answer_Student] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[Student_answer] CHECK CONSTRAINT [FK_Student_answer_Student]
GO
ALTER TABLE [dbo].[Student_course]  WITH CHECK ADD  CONSTRAINT [FK_Student_course_Course] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[Student_course] CHECK CONSTRAINT [FK_Student_course_Course]
GO
ALTER TABLE [dbo].[Student_course]  WITH CHECK ADD  CONSTRAINT [FK_Student_course_Student] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[Student_course] CHECK CONSTRAINT [FK_Student_course_Student]
GO
ALTER TABLE [dbo].[Student_course]  WITH CHECK ADD  CONSTRAINT [FK_Student_course_Student1] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[Student_course] CHECK CONSTRAINT [FK_Student_course_Student1]
GO
ALTER TABLE [dbo].[Student_exam]  WITH CHECK ADD  CONSTRAINT [FK_Student_exam_Exam] FOREIGN KEY([Exam_ID])
REFERENCES [dbo].[Exam] ([Exam_ID])
GO
ALTER TABLE [dbo].[Student_exam] CHECK CONSTRAINT [FK_Student_exam_Exam]
GO
ALTER TABLE [dbo].[Student_exam]  WITH CHECK ADD  CONSTRAINT [FK_Student_exam_Student] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[Student_exam] CHECK CONSTRAINT [FK_Student_exam_Student]
GO
ALTER TABLE [dbo].[Student_exam]  WITH CHECK ADD  CONSTRAINT [FK_Student_exam_Student1] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[Student_exam] CHECK CONSTRAINT [FK_Student_exam_Student1]
GO
ALTER TABLE [dbo].[text questions]  WITH CHECK ADD  CONSTRAINT [FK_text questions_question] FOREIGN KEY([question_ID])
REFERENCES [dbo].[question] ([Question_ID])
GO
ALTER TABLE [dbo].[text questions] CHECK CONSTRAINT [FK_text questions_question]
GO
ALTER TABLE [dbo].[text questions]  WITH CHECK ADD  CONSTRAINT [FK_TextQuestions_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[text questions] CHECK CONSTRAINT [FK_TextQuestions_Courses]
GO
ALTER TABLE [dbo].[true or false questions]  WITH CHECK ADD  CONSTRAINT [FK_TFQuestions_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[true or false questions] CHECK CONSTRAINT [FK_TFQuestions_Courses]
GO
ALTER TABLE [dbo].[true or false questions]  WITH CHECK ADD  CONSTRAINT [FK_true or false questions_question] FOREIGN KEY([question_ID])
REFERENCES [dbo].[question] ([Question_ID])
GO
ALTER TABLE [dbo].[true or false questions] CHECK CONSTRAINT [FK_true or false questions_question]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [check1] CHECK  (([Max_degree]>[Min_degree]))
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [check1]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [c3] CHECK  (([Exam_Type]='corrective' OR [Exam_Type]='Exam'))
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [c3]
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD  CONSTRAINT [c2] CHECK  (([question_type]='TEXT' OR [question_type]='TRUE OR FALSE' OR [question_type]='MCQ'))
GO
ALTER TABLE [dbo].[question] CHECK CONSTRAINT [c2]
GO
/****** Object:  StoredProcedure [dbo].[assign_student_exam]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[assign_student_exam]
@instructor_ID int,
@exam_ID int,
@course_ID int,
@start_time datetime,
@end_time datetime
as
begin
	if exists (select 1 from instructor_course 
	where instructor_ID = @instructor_ID and course_ID = @course_ID)
	
	begin
		if exists(select 1 from Exam
		where Exam_ID = @exam_ID and Course_ID = @course_ID)
		begin 
			declare @studentList dbo.StudentIDTableType;
			insert into @studentList (StudentID)
			select student_id
			from Student_course
			where Course_ID = @course_ID 

		insert into Student_exam(Student_ID,Exam_ID,Start_date,End_date)
		select StudentID,@exam_ID,@start_time,@end_time
		from @studentList

		print('students assigned successfully')
		
		end
	else
		begin
			RAISERROR('The exam does not exist or is not associated with the specified course.', 16, 1);
		end
	end
    ELSE
		BEGIN
			 RAISERROR('You are not authorized to assign students to this exam.', 16, 1);
		END
END;
GO
/****** Object:  StoredProcedure [dbo].[createExam]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[createExam]
@InstructorID INT,
@CourseID INT,
@ExamType VARCHAR(20), -- 'Exam' or 'Corrective'
    @Intake INT,
    @BranchID INT,
    @TrackID INT,
    @StartTime DATETIME,
    @EndTime DATETIME,
    @TotalTime INT,
    @AllowanceOptions NVARCHAR(MAX),
    @ManualSelection BIT, -- 1 for manual, 0 for random 
    @NumMCQ INT,
	@MCQDegree float,
    @NumTF INT,
	@TFDegree float,
	@TextDegree float,
    @NumText INT,
	@questions dbo.QuestionTableType READONLY
as
begin
	set NOCOUNT ON
	BEGIN TRANSACTION;

	DECLARE @examID int

	DECLARE @total_degree int

	DECLARE @max_degree int

	INSERT INTO Exam (Instructor_ID, Course_ID, Exam_Type, Intake_ID, Branch_ID, Track_ID, Start_time, End_time, total_time, allowance_options)
    VALUES (@InstructorID, @CourseID, @ExamType, @Intake, @BranchID, @TrackID, @StartTime, @EndTime, @TotalTime, @AllowanceOptions)

	set @examID = SCOPE_IDENTITY()
	
	
	if @ManualSelection = 1
	begin

		insert into Exam_question(Exam_ID,Question_ID,degree,question_type)
		select @examID,QuestionID,Degree,
			CASE 
                   WHEN q.QuestionID IN (SELECT question_ID FROM mcq_questions) THEN 'mcq'
                   WHEN q.QuestionID IN (SELECT question_ID FROM [text questions]) THEN 'text'
                   WHEN q.QuestionID IN (SELECT question_ID FROM [true or false questions]) THEN 'tf'
                   ELSE 'Unknown'
               END AS question_type
			   from @questions q
	end
	else
	begin
		insert into Exam_question(Exam_ID,Question_ID,Degree,question_type)
		select @examID,question_ID,@MCQDegree as degree,'mcq'

		from( select top(@NumMCQ) question_ID ,@MCQDegree AS Degree from mcq_questions
			where Course_ID=@CourseID order by NEWID()) as mcq_questions
			union all
			select @examID,question_ID,@TextDegree as degree,'text'
			from(
			select top(@NumText) question_ID ,@TextDegree as Degree from [text questions] 
			where CourseID=@CourseID order by NEWID()) as text_questions 
			union all
			select @examID,question_ID,@TFDegree as degree,'Tf'
			from(
			select top (@NumTF) question_ID , @TFDegree As Degree from [true or false questions] 
			where CourseID=@CourseID order by NEWID()) as tf_questions
			
	end

	
	select @max_Degree = max_degree
	from Course
	where Course_ID = @CourseID;

	select @total_degree = SUM(degree)
	from   Exam_question
	where Exam_ID = @examID;

	if @total_degree > @max_Degree
	
	begin
		print('the total degree of the questions is greater than the max degree
			of the exam.')
			rollback transaction;
	end
	else
	begin
		commit transaction;
	end
end
GO
/****** Object:  StoredProcedure [dbo].[finish_exam]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[finish_exam]
@studentID int,
@examID int,
@answer QuestionanswerType readonly
as
begin
	declare @questionID int,@correctanswer varchar(max),
	@questiontype varchar(55),@iscorrect bit,@student_answer varchar(max)

	declare student_answer cursor for
	select questionID, answer 
	from @answer
	
	open student_answer

	fetch next from student_answer into @questionID,@student_answer
	while @@FETCH_STATUS = 0
	
	begin
		select @questiontype = q.question_type
		from question as q
		where q.Question_ID = @questionID

		IF @questiontype = 'MCQ'
		begin
			select @correctanswer = correct_answer
			from mcq_questions
			where question_ID = @questionID 

			SET @iscorrect = CASE WHEN @student_answer = @correctanswer THEN 1 ELSE 0 END;

		end
		else
		if @questiontype = 'TRUE OR FALSE'
		begin
			select @correctanswer = correct_answer
			from [true or false questions]
			where question_ID = @questionID
			SET @iscorrect = CASE 
			WHEN  @student_answer = @correctanswer  THEN 1 ELSE 0 
			end
		end
		else
		if @questiontype = 'text' 
		
		begin 
		select @correctanswer = AcceptedTextAnswer 
		from [text questions]
		where question_ID = @questionID
			SET @iscorrect = CASE 
    WHEN LTRIM(RTRIM(@student_answer)) = LTRIM(RTRIM(@correctanswer)) OR
         LTRIM(RTRIM(@student_answer)) LIKE '%'+LTRIM(RTRIM(@correctanswer))+'%' OR
         LTRIM(RTRIM(@student_answer)) LIKE LTRIM(RTRIM(@correctanswer))+'%' OR
         LTRIM(RTRIM(@student_answer)) LIKE '%'+LTRIM(RTRIM(@correctanswer)) OR
         CHARINDEX(LTRIM(RTRIM(@correctanswer)), LTRIM(RTRIM(@student_answer))) > 0 OR
         CHARINDEX(LTRIM(RTRIM(@student_answer)), LTRIM(RTRIM(@correctanswer))) > 0 OR
         PATINDEX('%'+LTRIM(RTRIM(@correctanswer))+'%', LTRIM(RTRIM(@student_answer))) > 0 OR
         PATINDEX('%'+LTRIM(RTRIM(@student_answer))+'%', LTRIM(RTRIM(@correctanswer))) > 0 THEN 1 ELSE 0 
		END
		end
		insert into Student_answer(Student_ID,Exam_ID,question_ID,St_answer,Is_correct)
		values(@studentID,@examID,@questionID,@student_answer,@iscorrect)
		
		fetch next from student_answer into @questionID,@student_answer
	end
	close student_answer
	deallocate student_answer

declare @totalquestions int,@correctanswers int,@result decimal(5,2)

select @totalquestions = COUNT(*)
from Exam_question
where Exam_ID = @examID

select @correctanswers = COUNT(*)
from Student_answer
where Exam_ID = @examID
and Student_ID = @studentID
and Is_correct = 1

set @result = case 
	when @totalquestions > 0 then (@correctanswers*1 / @totalquestions)*100
	else 0
	end
update Student_exam
set result = @result
where Student_ID = @studentID 
and Exam_ID = @examID
end
GO
/****** Object:  StoredProcedure [dbo].[getexam_result_for_student]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[getexam_result_for_student]
	@studentID int
as 
begin
	select*
	from student_result ---view storing the students result
	where Student_ID=@studentID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_add_branch]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create    proc [dbo].[sp_add_branch]
@ManagerID INT,
@BranchName NVARCHAR(100),
@Branch_ID int 
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Instructor 
	WHERE Training_manager_ID = @ManagerID )

	BEGIN
		INSERT INTO Branch(Branch_ID,Branch_Name)
		VALUES (@Branch_ID,@BranchName);
	END
	ELSE
	BEGIN
		RAISERROR('You are not authorized to add branches.', 16, 1);
	END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_add_course]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create    proc [dbo].[sp_add_course]
@manager_Id int,
@course_name varchar(100),
@crs_description varchar(255),
@max_degree float,
@min_degree float,
@Course_ID int
as
begin
if exists( select 1 from instructor where Training_manager_ID = @manager_id
	)
	
	begin
		insert into Course(Course_ID,Crs_Name,Crs_description,Max_degree,Min_degree)
		values (@Course_ID,@course_name,@crs_description,@max_degree,@min_degree)
	end
	 ELSE
    BEGIN
        RAISERROR('You are not authorized to add a course.', 16, 1);
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_add_instructor]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[sp_add_instructor]
@manager_id int,
@ins_fname varchar(100),
@ins_Lname varchar(100),
@email varchar(255),
@Instructor_ID int

as
begin
	if exists( select 1 from instructor where Training_manager_ID = @manager_id
	)
	begin
		    IF NOT EXISTS (SELECT 1 FROM instructor WHERE Email = @Email)
	begin
		insert into instructor(Instructor_ID,Ins_Fname,ins_Lname,Email,Training_manager_ID)
		values(@Instructor_ID,@ins_fname,@ins_Lname,@email,@manager_id)
	end
	else
		begin
			RAISERROR('the instructor is already there',16,1)
		end
	end
	else
		begin
			RAISERROR('you are not authorized to add instructor.',16,1);
		end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_add_instructor_course]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[sp_add_instructor_course]
 @manager_id INT,
    @instructor_id INT,
    @course_id INT,
	@year int,
	@IC_ID int

as
begin
if exists( select 1 from instructor where Training_manager_ID = @manager_id
	)
	begin
	IF EXISTS (SELECT 1 FROM instructor WHERE Instructor_ID = @instructor_id)
	and exists (select 1 from Course where Course_ID = @course_id)
	begin
		insert into instructor_course (IC_ID,instructor_ID,course_ID,year)
		values(@IC_ID,@instructor_id,@course_id,@year)
	end
	else
	     BEGIN
            RAISERROR('Either the instructor or the course does not exist.', 16, 1);
        END
    END
    ELSE
    BEGIN
        RAISERROR('You are not authorized to add the instructor to the course.', 16, 1);
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_ADD_Q]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[SP_ADD_Q]
@instructor_ID int,
@course_ID int,
@question_Type varchar(50),
@correct_answer nvarchar(max)=null,
@question_text nvarchar(max),
@question_ID int,
@true_OR_False_Q_ID int,
@mcqQuestionID int,
@TEXT_QUESTION_ID int,
@a varchar(50),
@b varchar(50),
@c varchar(50)



as 
begin 
	if exists(select 1 from  instructor_course where Course_ID = @course_ID 
	and instructor_ID = @instructor_ID)
	begin
		if not exists( SELECT 1
            FROM (
                SELECT question_text, Course_ID
				FROM mcq_questions WHERE question_text = @question_text AND Course_ID = @course_ID
                UNION ALL
                SELECT question_text, CourseID FROM [true or false questions] 
				WHERE question_text = @question_text AND CourseID = @course_ID
                UNION ALL
                SELECT question_text, CourseID FROM [text questions] 
				WHERE question_text = @question_text AND CourseID = @course_ID
            ) AS q
			)
			begin 
			insert into question(question_ID,question_type,Course_ID)
			values(@question_ID,@question_Type,@course_ID)
			

			

		IF @question_Type = 'MCQ'
        BEGIN
            IF NOT EXISTS (SELECT 1 FROM mcq_questions 
			WHERE Course_ID = @course_ID AND question_text = @question_text)
            BEGIN
                INSERT INTO mcq_questions(mcq_question_ID,question_ID, Course_ID, question_text, correct_answer,A,B,C)
                VALUES (@mcqQuestionID,@question_ID, @course_ID, @question_text, @correct_answer,@a,@b,@c);
                

               
				END
                ELSE
                BEGIN
                    RAISERROR('The question already exists in mcq_questions.', 16, 1);
                END
            END
            ELSE IF @question_Type = 'TRUE OR FALSE'
            BEGIN
                IF NOT EXISTS (SELECT 1 FROM [true or false questions] 
				WHERE CourseID = @course_ID AND question_text = @question_text)
                BEGIN
                    INSERT INTO [true or false questions] 
					(true_OR_False_Q_ID,question_ID, CourseID, question_text, correct_answer)
                    VALUES (@true_OR_False_Q_ID,@question_ID, @course_ID, @question_text, @correct_answer);

                END
                ELSE
                BEGIN
                    RAISERROR('The question already exists in [true or false questions].', 16, 1);
                END
            END
            ELSE IF @question_Type = 'Text'
            BEGIN
                IF NOT EXISTS (SELECT 1 FROM [text questions] 
				WHERE CourseID = @course_ID AND question_text = @question_text)
                BEGIN
                    INSERT INTO [text questions] (TEXT_QUESTION_ID,question_ID, CourseID, question_text)
                    VALUES (@TEXT_QUESTION_ID,@question_ID, @course_ID, @question_text);
                END
                ELSE
                BEGIN
                    RAISERROR('The question already exists in [text questions].', 16, 1);
                END
            END
        END
        ELSE
        BEGIN
            RAISERROR('The question already exists in the database.', 16, 1);
        END
    END
    ELSE
    BEGIN
        RAISERROR('You are not authorized to add questions to this course.', 16, 1);
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_AddIntake]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[sp_AddIntake]
@ManagerID INT,
@intake_name varchar(50),
@Intake_ID int
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Instructor 
	WHERE Training_manager_ID = @ManagerID )
	BEGIN
		INSERT INTO Intake (Intake_ID,Intake_Name)
		VALUES (@Intake_ID,@intake_name);
	END
	ELSE
	BEGIN
		RAISERROR('You are not authorized to add intakes.', 16, 1);
	END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_AddStudent]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[sp_AddStudent]
@ManagerID INT,
@St_fname VARCHAR(100),
@st_lname VARCHAR(100),
@Email NVARCHAR(100),
@IntakeID INT,
@BranchID INT,
@TrackID INT,
@Student_ID int 
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Instructor 
	WHERE Training_manager_ID = @ManagerID)
	BEGIN
		INSERT INTO Student (Student_ID,St_Fname,St_Lname, Email, Intake_ID, Branch_ID, Track_ID)
		VALUES (@Student_ID,@St_fname,@st_lname, @Email, @IntakeID, @BranchID, @TrackID);
	END
	ELSE
	BEGIN
		RAISERROR('You are not authorized to add students.', 16, 1);
	END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_AddTrack]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROCEDURE [dbo].[sp_AddTrack]
@ManagerID INT,
@TrackName NVARCHAR(100),
@Track_ID int

AS
BEGIN
	IF EXISTS (SELECT 1 FROM Instructor 
	WHERE Training_manager_ID = @ManagerID )
	BEGIN
		INSERT INTO Track (Track_ID,Track_Name)
		VALUES (@Track_ID,@TrackName)
	END
	ELSE
	BEGIN
		RAISERROR('You are not authorized to add tracks.', 16, 1);
	END
END;
	
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_branch]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create    proc [dbo].[sp_delete_branch]
@ManagerID INT,
@branchID int
as
begin
	IF EXISTS (SELECT 1 FROM Instructor 
	WHERE Training_manager_ID = @ManagerID )
	begin
	if exists (select 1 from Branch where Branch_ID = @branchID)
	BEGIN 
		delete from Branch 
		where Branch_ID = @branchID
	end
	ELSE
        BEGIN
            RAISERROR('The branch does not exist.', 16, 1);
        END
	end
	else 
	begin
		RAISERROR('You are not authorized to delete branches.', 16, 1);
	END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_crs]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create    proc [dbo].[sp_delete_crs]
 @manager_id INT,
   @course_id INT
as 
begin
	if exists( select 1 from instructor where Training_manager_ID = @manager_id)
	begin
	IF EXISTS (SELECT 1 FROM Course WHERE Course_ID = @course_id)
	begin
		delete from Course
		where Course_ID = @course_id
		end
	 ELSE
        BEGIN
            RAISERROR('The course does not exist.', 16, 1);
        END
    END
    ELSE
    BEGIN
        RAISERROR('You are not authorized to delete the course.', 16, 1);
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_instructor]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create    proc [dbo].[sp_delete_instructor]
@manager_id INT,
@instructor_id INT
as
begin
	if exists( select 1 from instructor where Training_manager_ID = @manager_id
	)
	begin
	 IF EXISTS (SELECT 1 FROM instructor WHERE Instructor_ID = @instructor_id)
	begin
	delete from instructor
	where Instructor_ID = @instructor_id
	end
	ELSE
        BEGIN
            RAISERROR('The instructor does not exist.', 16, 1);
        END
    END
    ELSE
    BEGIN
        RAISERROR('You are not authorized to delete the instructor.', 16, 1);
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_instructor_course]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create    proc [dbo].[sp_delete_instructor_course]
 @manager_id INT,
 @instructor_course_id INT
 as
 begin
	
	if exists( select 1 from instructor where Training_manager_ID = @manager_id
	)
	begin
	if exists (select 1 from instructor_course where IC_ID= @instructor_course_id)

	begin
	delete from instructor_course
	where IC_ID = @instructor_course_id
	end
	ELSE
        BEGIN
            RAISERROR('The instructor-course assignment does not exist.', 16, 1);
        END
    END
    ELSE
    BEGIN
        RAISERROR('You are not authorized to delete the instructor-course assignment.', 16, 1);
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_intake]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create    proc [dbo].[sp_delete_intake]
@ManagerID INT,
@intake_id int
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Instructor 
	WHERE Training_manager_ID = @ManagerID )
	begin
	if exists (select 1 from Intake where Intake_ID =@intake_id)
	BEGIN
		delete from Intake
		where Intake_ID = @intake_id
	END
	ELSE
        BEGIN
            RAISERROR('The intake does not exist.', 16, 1);
        END
	end
	ELSE
	BEGIN
		RAISERROR('You are not authorized to delete intakes.', 16, 1);
	END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_question]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[sp_delete_question]
@instructor_ID int,
@course_Id int,
@qusetion_ID int,
@question_Type varchar(50)
as
begin
	
	if exists(select 1 from  instructor_course where Course_ID = @course_ID 
	and instructor_ID = @instructor_ID)

	begin 
	if @question_type = 'mcq'
		begin
			delete  from mcq_questions
			where question_ID =@qusetion_ID and Course_ID = @course_Id
			delete  from  [dbo].[question]
			where question_ID =@qusetion_ID and [Course_ID] = @course_Id
		end
	
	else  if @question_type = 'TRUE OR FALSE'

		begin 
			delete  from [true or false questions] 
			where question_ID =@qusetion_ID and CourseID = @course_Id
			delete  from  [dbo].[question]
			where question_ID =@qusetion_ID and [Course_ID] = @course_Id
		end
	else if @question_type = 'Text'
	begin
		delete  from [text questions]
		where question_ID =@qusetion_ID and CourseID = @course_Id
		delete  from  [dbo].[question]
			where question_ID =@qusetion_ID and [Course_ID] = @course_Id
	end
	end

	else
		begin
			RAISERROR('You are not authorized to delete questions from this course.', 16, 1);
		end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_student]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[sp_delete_student]
@ManagerID INT,
@studentID int

AS
BEGIN
	IF EXISTS (SELECT 1 FROM Instructor 
	WHERE Training_manager_ID = @ManagerID)
	begin
		if exists (select 1 from Student where Student_ID = @studentID)
	BEGIN
		delete from Student
		where Student_ID = @studentID
	END
	ELSE
        BEGIN
            RAISERROR('The student does not exist.', 16, 1);
        END
	end
	ELSE
	BEGIN
		RAISERROR('You are not authorized to delete students.', 16, 1);
	END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_deleteTrack]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create    proc [dbo].[sp_deleteTrack]
@ManagerID INT,
@TrackID INT
as
begin
IF EXISTS (SELECT 1 FROM Instructor 
	WHERE Training_manager_ID= @ManagerID )
	begin
	
	if exists(select 1 from Track where Track_ID = @TrackID)
	BEGIN
		delete from Track
		where Track_ID = @TrackID
	END
	ELSE
        BEGIN
            RAISERROR('The track does not exist.', 16, 1);
        END
	end
	ELSE
	BEGIN
		RAISERROR('You are not authorized to delete tracks.', 16, 1);
	END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_udate_intake]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create    proc [dbo].[sp_udate_intake]
@ManagerID INT,
@intake_name varchar(50),
@intake_id int
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Instructor 
	WHERE Training_manager_ID = @ManagerID )
	begin
	if exists (select 1 from Intake where Intake_ID =@intake_id)
	BEGIN
		update Intake
		set Intake_Name = @intake_name
		where Intake_ID = @intake_id
	END
	ELSE
        BEGIN
            RAISERROR('The intake does not exist.', 16, 1);
        END
	end
	ELSE
	BEGIN
		RAISERROR('You are not authorized to update intakes.', 16, 1);
	END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_update_branch]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   proc [dbo].[sp_update_branch]
@ManagerID INT,
@branchID int,
@BranchName NVARCHAR(100)
AS 
BEGIN 
	IF EXISTS (SELECT 1 FROM Instructor 
	WHERE Training_manager_ID = @ManagerID )
	begin
	if exists (select 1 from Branch where Branch_ID = @branchID)
	BEGIN 
		UPDATE Branch
		set Branch_Name = @BranchName
		where Branch_ID = @branchID
	end
	ELSE
        BEGIN
            RAISERROR('The branch does not exist.', 16, 1);
        END
	end
	else 
	begin
		RAISERROR('You are not authorized to UPDATE branches.', 16, 1);
	END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_update_course]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[sp_update_course]
@manager_Id int,
@course_ID int,
@course_name varchar(100),
@crs_description varchar(255),
@max_degree float,
@min_degree float
as 
begin 
	if exists( select 1 from instructor where Training_manager_ID = @manager_id
	)
	begin
	IF EXISTS (SELECT 1 FROM Course WHERE Course_ID = @course_id)
	begin
		update Course 
		set Crs_Name = @course_name , Crs_description = @crs_description,
		Max_degree = @max_degree , Min_degree = @min_degree
		where Course_ID = @course_ID
	end
	ELSE
        BEGIN
            RAISERROR('The course does not exist.', 16, 1);
        END
    END
    ELSE
    BEGIN
        RAISERROR('You are not authorized to update the course.', 16, 1);
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_update_instructor]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_update_instructor] 
@manager_id int,
@instructor_id int,
@ins_fname varchar(100),
@ins_Lname varchar(100),
@email varchar(255)

as 
begin 
	if exists( select 1 from instructor where Training_manager_ID = @manager_id
	)
	begin
	 IF EXISTS (SELECT 1 FROM instructor WHERE Instructor_ID = @instructor_id)
	begin
		update instructor
		set ins_fname=@ins_fname , ins_Lname = @ins_Lname ,email = @email
		where Instructor_ID = @instructor_id
	end
	else
		begin 
			RAISERROR('The instructor does not exist.', 16, 1);
		end
		end
	else 
		begin
			RAISERROR('You are not authorized to update the instructor.', 16, 1);
		end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_instructor_course]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_update_instructor_course]
	@manager_id INT,
    @instructor_course_id INT,
    @instructor_id INT,
    @course_id INT,
	@year int
as
begin
	if exists( select 1 from instructor where Training_manager_ID = @manager_id
	)
	begin
	if exists (select 1 from instructor_course where IC_ID= @instructor_course_id)

	begin
	update instructor_course
	set instructor_ID = @instructor_id
	, course_ID = @course_id
	where IC_ID = @instructor_course_id
	end
	ELSE
        BEGIN
            RAISERROR('The instructor-course assignment does not exist.', 16, 1);
        END
    END
    ELSE
    BEGIN
        RAISERROR('You are not authorized to update the instructor-course assignment.', 16, 1);
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_update_student]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[sp_update_student]
@ManagerID INT,
@studentID int,
@St_fname VARCHAR(100),
@st_lname VARCHAR(100),
@Email NVARCHAR(100),
@IntakeID INT,
@BranchID INT,
@TrackID INT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Instructor 
	WHERE Training_manager_ID = @ManagerID)
	begin
		if exists (select 1 from Student where Student_ID = @studentID)
	BEGIN
		update Student
		set St_Fname =@St_fname , St_Lname = @st_lname,
		email = @Email, Intake_ID = @IntakeID,Branch_ID = @BranchID,
		Track_ID = @TrackID
		where Student_ID = @studentID
	END
	ELSE
        BEGIN
            RAISERROR('The student does not exist.', 16, 1);
        END
	end
	ELSE
	BEGIN
		RAISERROR('You are not authorized to update students.', 16, 1);
	END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateTrack]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE    proc [dbo].[sp_UpdateTrack]
@ManagerID INT,
@TrackID INT,
@TrackName NVARCHAR(100)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Instructor 
	WHERE Training_manager_ID = @ManagerID )
	begin
	
	if exists(select 1 from Track where Track_ID = @TrackID)
	BEGIN
		UPDATE Track
		SET Track_Name = @TrackName
		WHERE Track_ID= @TrackID;
	END
	ELSE
        BEGIN
            RAISERROR('The track does not exist.', 16, 1);
        END
	end
	ELSE
	BEGIN
		RAISERROR('You are not authorized to update tracks.', 16, 1);
	END
END;
GO
/****** Object:  StoredProcedure [dbo].[take_Exam]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[take_Exam]
@student_id int,
@exam_id int
AS
BEGIN
	SET NOCOUNT ON

	if exists( select 1 from Student_exam as se
	join Exam as e on se.Exam_ID=  e.Exam_ID
	where se.Student_ID = @student_id 
	and se.Exam_ID = @exam_id
	and GETDATE() between Start_date  and End_date
	)
	begin
		select* 
		from Student_exam
		where Exam_ID = @exam_id
		and Student_ID = @student_id
	end
	ELSE
		BEGIN
			print('you cannot take this exam at the current time')
		end
end
GO
/****** Object:  StoredProcedure [dbo].[update_question]    Script Date: 8/5/2024 5:56:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[update_question]
@instructor_ID int,
@course_ID int,
@question_Type varchar(50),
@correct_answer nvarchar(max)=null,
@question_text nvarchar(max),
@accepted_answer nvarchar(max)=null,
@question_ID int
as
begin
	if exists(select 1 from  instructor_course where Course_ID = @course_ID 
	and instructor_ID = @instructor_ID)

	begin 
	if @question_type = 'mcq'
	
	begin
		update mcq_questions
		set question_text = @question_text, correct_answer = @correct_answer
		where question_ID = @question_ID and course_ID =@course_ID
	end
	else  if @question_type = 'TRUE OR FALSE'
	begin
		update [true or false questions]
		set question_text = @question_text ,correct_answer = @correct_answer
		where question_ID = @question_ID and  [CourseID]=@course_ID
	end
	else if @question_type = 'Text'

	begin
		update [text questions]
		set question_text = @question_text , acceptedTextAnswer = @accepted_answer
		where question_ID = @question_ID and [CourseID] =@course_ID
	end
	else 
		begin 
			RAISERROR('Invalid question type specified.', 16, 1)
		end
	end
	else
		begin
			 RAISERROR('You are not authorized to update questions in this course.', 16, 1)
		end
end


GO
USE [master]
GO
ALTER DATABASE [ITI_system] SET  READ_WRITE 
GO
