USE master;
GO
DROP DATABASE IF EXISTS Midterm_Project;
CREATE DATABASE Midterm_Project;

USE Midterm_Project;
GO
CREATE TABLE Department ( 
  DepartmentID		INT NOT NULL IDENTITY(1,1),
  DepartmentName	VARCHAR(40) NOT NULL,
  CONSTRAINT PK_Department_DepartmentID PRIMARY KEY (DepartmentID)
);

INSERT INTO Department (DepartmentID, DepartmentName)
VALUES (1, 'Development'),
       (2, 'Financial Management'),
       (3, 'Human Resources'),
       (4, 'Public Relations'), 
       (5, 'Administartion'), 
       (6, 'Collection Management'),
	   (7, 'Acquisition'),
       (8, 'Faculty Services'),
       (9, 'University Press'),
       (10, 'Grad and Undergrad Services'), 
       (11, 'Digital Library Services'), 
       (12, 'Digital Operations'),
	   (13, 'Software Development'),
       (14, 'Student Computing Services'),
       (15, 'User Experience and Web Development'),
       (16, 'Operations,Logistics and Facilities'), 
       (17, 'Research and User Services'), 
       (18, 'Special Collections');



CREATE TABLE Employee (
  EmployeeID	  INT NOT NULL IDENTITY(1,1),
  DepartmentID	  INT NOT NULL,
  FirstName       VARCHAR(40) NOT NULL,
  MiddleName      VARCHAR(40),
  LastName        VARCHAR(40) NOT NULL,
  CONSTRAINT PK_Employee_EmployeeID PRIMARY KEY (EmployeeID),
  CONSTRAINT FK_Employee_DepartmentID FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID)
);

INSERT INTO Employee (EmployeeID, DepartmentID, FirstName, LastName )
	VALUES  ( 1,1, 'Pedro', 'Figueroa' ),
			(2, 2, 'Brian', 'James' ),
			(3, 3, 'Paul', 'Lewis'),
			(4, 4, 'Maddox', 'Sutton'),
			(5, 5, 'Lillie', 'Mccoy' ),
			(6, 6, 'Noe', 'Pham'),
			(7, 2, 'Brandon', 'Ball'),
			(8, 3, 'Kaitlynn', 'Rasmussen'),
			(9, 1, 'Leo', 'DiCaprio'),
			(10, 4, 'Martin', 'Garrix'),
			(11, 5, 'Robert', 'De Niro'),
			(12, 6, 'Louis', 'Vuitton'),
			(13, 4, 'Robert', 'Lewis'),
			(14, 3, 'Nick', 'Galloway'),
			(14, 1, 'Ted', 'Roberts');

CREATE TABLE Asset ( 
  AssetID    INT NOT NULL IDENTITY(1,1),
  AssetTime  DATE NOT NULL,
  CONSTRAINT PK_Assets_AssetID PRIMARY KEY (AssetID)
);

INSERT INTO Asset (AssetID, AssetTime)
VALUES (1,'2020-05-18'),
	   (2,'2020-05-19'),
	   (3,'2020-05-11'),
	   (4,'2020-05-10'),
	   (5,'2020-05-12'),
	   (6,'2020-05-13'),
	   (7,'2020-05-14'),
	   (8,'2020-05-15'),
	   (9,'2020-05-16'),
	   (10,'2020-05-17'),
	   (11,'2020-05-1'),
	   (12,'2020-05-2'),
	   (13,'2020-05-3'),
	   (14,'2020-05-4'),
	   (15,'2020-05-5');

CREATE TABLE Room (
  RoomAssetID     INT NOT NULL,
  RoomNumber      VARCHAR(10) NOT NULL,
  RoomName        VARCHAR(40) NOT NULL,
  Location        VARCHAR(40) NOT NULL,
  CONSTRAINT PK_Room_RoomAssetID PRIMARY KEY (RoomAssetID),
  CONSTRAINT FK_Room_Assets FOREIGN KEY (RoomAssetID) REFERENCES Asset (AssetID)
);

INSERT INTO ROOM (RoomID, RoomNumber, RoomName)
VALUES (1,'MLIB 1738D', 'Study Room'),
	   (1,'1750A', 'Study Room'),
	   (1,'1750B', 'Study Room'),
	   (1,'1750C', 'Study Room'),
	   (6,'2101', 'Study Room'),
	   (2,'2103', 'Study Room'),
	   (1,'2105', 'Study Room'),
	   (4,'2130A-H', 'Class Room'),
	   (4,'2130J-M', 'Class Room'),
	   (2,'2130P-S', 'Class Room'),
	   (1,'2130U', 'Study Room'),
	   (2,'2400D', 'Study Room'),
	   (2,'3300A', 'Study Room'),
	   (3,'3300D', 'Study Room'),
	   (5,'4000A', 'Event Room'),
	   (3,'4000B', 'Event Room'),
	   (6,'4000C', 'Event Room'),
	   (6,'4000D', 'Event Room'),
	   (6,'Tanner Alcove', 'Event Room');

CREATE TABLE Equipment (
  EqupimentAssetD INT NOT NULL,
  EquipmentType	  VARCHAR(40) NOT NULL,
  EqupimentName   VARCHAR(10) NOT NULL,
  CONSTRAINT PK_Equipment_EqupimentAssetD PRIMARY KEY (EqupimentAssetD),
  CONSTRAINT FK_Equipment_Assets FOREIGN KEY (EqupimentAssetD) REFERENCES Asset (AssetID)
);

INSERT INTO Equipment ( EquipmentAssetID, EquipmentType, EquipmentName )
VALUES	(1, 'Laptop', 'Thinkpad_T490s-1' ),
		(2, 'Laptop', 'Thinkpad_T490s-2' ),
		(3, 'Printer', 'HP_DeskJet_3755-1' ),
		(4, 'Printer', 'Canon_PIXMA_TS6420' ),
		(5, 'Headphones', 'Califone 3068-AV-1' ),
		(6, 'Headphones', 'Califone 3068-AV-2' ),
		(7, 'Headphones', 'Califone 3068-AV-3' ),
		(8, 'Headphones', 'Califone 3068-AV-4' ),
		(9, 'Laptop', 'MacBook_Air(2020)-1' ),
		(10, 'Laptop', 'MacBook_Air(2019)-1' ),
		(11, 'Laptop', 'MacBook_Air(2020)-2' ),
		(12, 'Laptop', 'MacBook_Pro(2021)-1' ),
		(13, 'Laptop', 'MacPook_Pro(2021)-2' ),
		(14, 'Laptop', 'Thinkpad_T14sGen1-1' ),
		(15, 'Laptop', 'Thinkpad_T14sGen1-2' ),
		(16, 'Headphones', 'Sennheiser_Pro_HD280-1' ),
		(17, 'Headphones', 'Sennheiser_Pro_HD280-2' ),
		(18, 'Headphones', 'Sennheiser_Pro_HD280-3' );


CREATE TABLE BookType ( 
  BookTypeID      INT NOT NULL IDENTITY(1,1),
  TypeName        VARCHAR(40) NOT NULL, -- edit
  CONSTRAINT PK_BookType_BookTypeID PRIMARY KEY (BookTypeID)
);

INSERT INTO BookType ( BookTypeID, TypeName )
	VALUES  ( 2, 'General Books' ),
			( 5, 'Fine Arts & Architecture' ),
			( 2, 'Government Documents'),
			( 6, 'Moving Images & Sound'),
			( 6, 'Photograph Archives'),
			( 6, 'Rare Books'),
			( 2, 'Utah Ski Archives'),
			( 5, 'Red Butte Press'),
			( 3, 'University of Utah Web Archive'),
			( 2, 'Print and Journal'),
			( 6, 'Preservation'),
			( 6, 'Manuscripts'),
			( 6, 'Materials'),
			( 2, 'Middle East Library'),
			( 3, 'Digital Library');

CREATE TABLE Book (
  BookAssetID     INT NOT NULL,
  ISBN            VARCHAR(20) NOT NULL,
  Title			  VARCHAR(40) NOT NULL,
  Author          VARCHAR(40) NOT NULL,

  Price           MONEY NOT NULL,
  BookTypeID      INT NOT NULL,
  CONSTRAINT PK_Book_BookAssetID PRIMARY KEY (BookAssetID),
  CONSTRAINT UK_Book_ISBN UNIQUE (ISBN),
  CONSTRAINT FK_Book_Assets FOREIGN KEY (BookAssetID) REFERENCES Asset (AssetID),
  CONSTRAINT FK_Book_BookType FOREIGN KEY (BookTypeID) REFERENCES BookType (BookTypeID),
  CONSTRAINT CK_Book_Price CHECK (Price > 0)
);

INSERT INTO Book (BookAssetID, ISBN, Author, Price)
	VALUES	(1, 9466136648393,'Harry Potter', 'J. K. Rowling', 402),
			(2, 9754056301510, 'Bleep bloop', 'Robert Kiss', 104),
			(3, 9121490545718, 'lady gaga', 'Harris Newman', 12),
			(4, 5391633060413, 'how to', 'Robert Downey Sr', 123),
			(5, 8128460985217, 'say hi', 'Barry New', 399),
			(6, 9888440330536, 'goodbye', 'Terra Books', 304),
			(7, 8849462002378, 'jon snow', 'Born Tide', 3243),
			(8, 6373337156427, 'bible', 'Jesus', 10000),
			(9, 3540332706194, 'chimmy chunga', 'Homerun Billy', 120),
			(10, 2752655642564,'to kiss a frog', 'Robert Kiss', 423),
			(11, 7388255758995, 'lady noodles', 'Mary Newton', 178),
			(12, 9552386718392, 'singing in the shower', 'Steve Joles', 543),
			(13, 9369015464424,'basketball', 'Mary Newton', 122),
			(14, 9686223420425, 'flipp', 'Harris Newman', 280),
			(15, 7619373794656, 'ding la ring', 'Harris Newman', 212);


CREATE TABLE WritingCenter (
  WritingCenterID  INT NOT NULL,
  OpenTime          TIME NOT NULL,
  CloseTime         TIME NOT NULL,
  CONSTRAINT PK_WritingCenter_WritingCenterID PRIMARY KEY (WritingCenterID),
  CONSTRAINT FK_WritingCenter_Room FOREIGN KEY (WritingCenterID) REFERENCES Room (RoomAssetID)
);

INSERT INTO WritingCenter (WritingCenterID, OpenTime, CloseTime)
VALUES (1,'10:00:00', '17:00:00'),
    (2,'08:00:00', '04:00:00'),
    (3,'09:00:00', '22:00:00'),
    (4,'10:00:00', '06:00:00'),
    (5,'09:00:00', '08:00:00'),
    (6,'12:00:00', '22:00:00'),
    (7,'11:00:00', '22:00:00'),
    (8,'01:00:00', '06:00:00'),
    (9,'08:00:00', '22:00:00'),
    (11,'07:00:00', '22:00:00'),
    (12,'11:00:00', '22:00:00'),
    (13,'13:00:00', '08:00:00'),
    (14,'15:00:00', '06:00:00'),
    (15,'22:00:00', '02:00:00');


CREATE TABLE ExamCenter (
  ExamCenterID      INT NOT NULL,
  Capacity          INT NOT NULL,
  CONSTRAINT PK_ExamCenter_ExamCenterID PRIMARY KEY (ExamCenterID),
  CONSTRAINT FK_ExamCenter_Room FOREIGN KEY (ExamCenterID) REFERENCES Room (RoomAssetID),
  CONSTRAINT CK_ExamCenter_Capacity CHECK (Capacity > 0)
);

INSERT INTO ExamCenter (ExamCenterID, Capacity)
VALUES (1, 20),
    (2, 30),
    (3, 30),
    (4, 20),
    (5, 40), 
    (6, 50),
    (7, 30),
    (8, 40),
    (9, 20),
    (10, 10),
    (11, 30),
    (13, 40),
    (14, 50),
    (12, 20),
    (15, 30);


CREATE TABLE Computer (
  ComputerID        INT NOT NULL,
  Weight            DECIMAL(4,2),
  Configuration     VARCHAR(200),
  CONSTRAINT PK_Computer_ComputerID PRIMARY KEY (ComputerID),
  CONSTRAINT FK_Computer_Equipment FOREIGN KEY (ComputerID) REFERENCES Equipment (EqupimentAssetD)
);

INSERT INTO Computer(ComputerID, Weight,Configuration)
VALUES (12457,2,'MAC'),
(12234,2,'MAC'),
(14152,3,'MAC'),
(14215,4,'WIN'),
(15243,2,'MAC'),
(15134,4,'WIN'),
(15123,3,'MAC'),
(15125,4,'WIN'),
(15242,4,'WIN'),
(15231,4,'WIN'),
(15234,2,'MAC'),
(14132,2,'MAC'),
(17895,2,'MAC'),
(15487,2,'MAC'),
(16548,2,'MAC');


/*CREATE TABLE Printer (
  PrinterID         INT NOT NULL,
  Colorful          CHAR(1) NOT NULL DEFAULT 'N',
  CONSTRAINT PK_Printer_PrinterID PRIMARY KEY (PrinterID),
  CONSTRAINT FK_Printer_Equipment FOREIGN KEY (PrinterID) REFERENCES Equipment (EqupimentAssetD)
);
*/

CREATE TABLE UMember ( 
  UMemberID       INT NOT NULL IDENTITY(1,1),
  MemberType      VARCHAR(10) NOT NULL,
  FirstName       VARCHAR(40) NOT NULL,
  MiddleName      VARCHAR(40),
  LastName        VARCHAR(40) NOT NULL,
  DOB             SMALLDATETIME NOT NULL,
  CONSTRAINT PK_UMember_UMemberID PRIMARY KEY (UMemberID)
);



CREATE TABLE Student (
  StudentID     INT NOT NULL,
  CONSTRAINT PK_Student_StudentID PRIMARY KEY (StudentID),
  CONSTRAINT FK_Student_UMember FOREIGN KEY (StudentID) REFERENCES UMember (UMemberID)
);

INSERT INTO STUDENT (StudentID)
VALUES (1235487),
(1263525),
(1245785),
(1245785),
(1257845),
(1289457),
(1245578),
(1245896),
(1457865),
(1456789),
(1578945),
(1587894),
(1154878),
(1896587),
(1456878);



CREATE TABLE Professor (
  ProfessorID     INT NOT NULL,
  ContactPhone  VARCHAR(12) NOT NULL,
  CONSTRAINT PK_Professor_StudentID PRIMARY KEY (ProfessorID),
  CONSTRAINT FK_Professor_UMember FOREIGN KEY (ProfessorID) REFERENCES UMember (UMemberID)
);

INSERT INTO Professor(ProfessorID, ContactPhone)
VALUES (1, '901-117-1707'),
	   (2, '380-305-3592'),
       (3, '998-739-6242'),
       (4, '749-960-5775'),
       (5, '965-625-0732'),
	   (6, '178-923-4837'),
	   (7, '936-626-4188'),
	   (8,'354-692-3382'),
	   (9, '754-966-1602'),
	   (10, '110-304-6517'),
	   (11, '719-415-1790'),
	   (12, '422-423-3071'),
	   (13, '767-474-2901'),
	   (14, '856-154-5028'),
	   (15, '239-464-2269');

/*CREATE TABLE Researcher (
  ResearcherID  INT NOT NULL,
  EmailAddress  VARCHAR(50) NOT NULL,
  PhoneNumber   VARCHAR(11) NOT NULL,
  CONSTRAINT PK_Researcher_StudentID PRIMARY KEY (ResearcherID),
  CONSTRAINT FK_Researcher_UMember FOREIGN KEY (ResearcherID) REFERENCES UMember (UMemberID)
);
*/

CREATE TABLE Reservation (
  ReservationID		   INT NOT NULL IDENTITY(1,1),
  ReservationStatus	   VARCHAR(20) NOT NULL DEFAULT 'waiting handle',
  StartDate	           DATE NOT NULL,
  EndDate              DATE,
  UMemberID            INT NOT NULL,
  EmployeeID           INT DEFAULT NULL,
  CONSTRAINT PK_Reservation_ReservationID PRIMARY KEY (ReservationID),
  CONSTRAINT FK_Reservation_UMember FOREIGN KEY (UMemberID) REFERENCES UMember (UMemberID),
  CONSTRAINT FK_Reservation_Employee FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID)
);
 

INSERT INTO Reservation ( ReservationID, ReservationStatus, StartDate, EndDate, UMemberID, EmployeeID )
VALUES	( 1, 'Checked Out', '2022-02-04', '2020-06-22', 1234567, 1),
		( 2, 'Not Available', '2020-06-22', '2020-12-07', 7654321, 2),
		( 3, 'Late', '2020-12-07', '2021-12-20', 8097986, 3),
		( 4, 'Due', '2021-12-20', '2021-12-21', 6541237, 3),
		( 5, 'Due', '2021-12-21', '2021-03-30', 72134653, 3),
		( 6,'Due',  '2021-03-30', '2020-11-18', 8654321, 3),
		( 7,'Due', '2020-11-18',  '2022-01-05', 1324567, 4),
		( 8,'Late', '2022-01-05', '2021-06-14', 2134567,5 ),
		( 9,'Late',  '2021-06-14',  '2021-06-29', 214563, 7 ),
		( 10, 'Late', '2021-06-29', '2021-11-30', 1345672, 2),
		(11, 'Late', '2021-11-30', '2022-01-31', 86758912, 1 ),
		( 12, 'Not Available', '2020-01-31', '2020-05-17', 7324561, 4 ),
		( 13, 'Not Available', '2022-01-17', '2022-05-17', 14362716, 8 ),
		( 14,'Not Available', '2020-02-17', '2020-05-17',33251734 ,13 ),
		( 15,'Not Available', '2020-03-05', '2020-12-08', 74261416, 3),
		( 16, 'Late', '2021-06-29', '2021-07-06', 2426242, 4 ),
		( 17, 'Late','2020-11-10', '2020-11-17', 72524252, 1 ),
		( 18, 'Late', '2021-09-07', '2021-09-18', 7423654, 1),
		( 19, 'Late', '2021-06-25', '2021-06-30', 7562352, 2),
		( 20, 'Late', '2021-05-24', '2021-06-25', 2404251,3),
		( 21, 'On Time', '2021-08-20', '2021-09-07', 180452, 3 ),
		( 22, 'On Time', '2021-03-07', '2021-06-22', 180425,3 ),
		( 23, 'On Time', '2020-11-20', '2021-11-25', 745233, 4),
		( 24, 'On Time', '2021-06-19', '2021-07-03', 244620, 1),
		( 25, 'On Time',  '2020-08-17', '2020-09-14', 180523, 3 ),
		( 26, 'On Time',  '2021-05-06', '2021-05-07', 1802327, 6 ),
		( 27, 'On Time',  '2021-01-27', '2021-09-21', 1803325, 8 ),
		( 28, 'On Time',  '2021-09-24', '2021-09-27', 180433, 9 ),
		( 29, 'Checked Out', '2020-09-15', '2021-10-25', 180425, 10 ),
		( 30, 'Checked Out', '2020-02-04', '2020-05-05', 1803425, 11 ),
		( 31, 'Checked Out', '2021-11-08', '2021-12-03', 1803425, 11 ),
		( 32, 'Checked Out', '2022-03-14', '2022-03-23', 734325, 8 ),
		( 33, 'Checked Out', '2022-03-16', '2022-04-22', 18023532, 4 ),
		( 34, 'Checked Out', '2021-07-08', '2021-07-28', 18032532, 5 ),
		( 35, 'Due', '2022-05-01', '2022-05-03',  18032435, 5 ),
		( 36, 'Due', '2022-04-22', '2022-05-01', 18052362, 7 ),
		( 37, 'Due', '2022-05-03', '2022-06-03', 1803536, 6 ),
		( 38, 'Due', '2022-05-03', '2022-06-03', 1803536, 6 ),
		( 39, 'Not Available','2022-04-14', '2022-05-03', 235326, 6),
		( 40, 'Not Available', '2022-04-07', '2022-04-10', 75326326, 5 ),
		( 41,  'Not Available', '2022-04-12', '2022-04-14', 75236323, 5 ),
		( 42, 'Not Available', '2022-04-15', '2022-04-15', 73253723, 15 );



CREATE TABLE ReservationDetail (
  ReservationID        INT NOT NULL,
  BookAssetID          INT NOT NULL,
  Discount             DECIMAL(3,2) NOT NULL,
  CONSTRAINT PK_ReservationDetail_ReservationID_BookAssetID PRIMARY KEY (ReservationID, BookAssetID),
  CONSTRAINT FK_ReservationDetail_Reservation FOREIGN KEY (ReservationID) REFERENCES Reservation (ReservationID),
  CONSTRAINT FK_ReservationDetail_BookAssetID FOREIGN KEY (BookAssetID) REFERENCES Book (BookAssetID),
  CONSTRAINT CK_ReservationDetail_Discount CHECK (Discount >= 0 AND Discount <= 1)
);

INSERT INTO ReservationDetail(ReservationID, BookAssetID, Discount)
VALUES(1, 2, 80),
	  (1, 3, 70),
	  (2, 12, 90),
	  (11, 12, 80),
	  (15, 2, 70),
	  (3, 2, 90),
	  (4, 5, 80),
	  (5, 6, 80),
	  (7, 8, 90),
	  (9, 10, 70),
	  (12,12, 80),
	  (13, 2, 90),
	  (14, 15, 90),
	  (6, 9, 70),
	  (10, 11, 70);


/*CREATE TABLE Receipt (
  ReceiptID            INT NOT NULL IDENTITY(1,1),
  PayMenthod           VARCHAR(20) NOT NULL,
  PayTime              SMALLDATETIME NOT NULL,
  TotalPay             MONEY NOT NULL,
  ReservationID        INT NOT NULL,
  CONSTRAINT PK_Receipt_ReceiptID PRIMARY KEY (ReceiptID),
  CONSTRAINT FK_Receipt_Reservation FOREIGN KEY (ReservationID) REFERENCES Reservation (ReservationID),
  CONSTRAINT CK_Receipt_TotalPay CHECK (TotalPay >= 0)
);
*/

CREATE TABLE StudentExam (
  ExamID               INT NOT NULL IDENTITY(1,1),
  CourseNo             VARCHAR(20) NOT NULL DEFAULT 'waitting handle',
  ExamCenterID         INT NOT NULL,
  StudentID            INT NOT NULL,
  Grade                INT DEFAULT NULL,
  CONSTRAINT PK_StudentExam_ExamID PRIMARY KEY (ExamID),
  CONSTRAINT FK_StudentExam_ExamCenter FOREIGN KEY (ExamCenterID) REFERENCES ExamCenter (ExamCenterID),
  CONSTRAINT FK_StudentExam_Student FOREIGN KEY (StudentID) REFERENCES Student (StudentID),
  CONSTRAINT CK_StudentExam_Grade CHECK (Grade >= 0)
);

INSERT INTO StudentExam(ExamID, ExamCenterID, StudentID, CourseNumber, Grade)
VALUES (1, 2, 1263525, 'IS4420', 89),
(12, 4, 1564875, 'CS3420', 65),
(14, 5, 1456878, 'BS2420', 54),
(15, 7, 1568876, 'FS1420', 32),
(11, 2, 124155, 'EN2220', 56),
(7, 1, 1252324, 'CN4410', 48),
(8, 5, 1241525, 'FF4480', 78),
(9, 6, 1513531, 'AR3900', 89),
(10, 8, 1231241, 'CL4400', 76),
(4, 10, 1897458, 'BC4460', 59),
(5, 6, 1456789, 'FIN4480', 76),
(6, 8, 1545785, 'FF4460', 95),
(7, 12, 1456789, 'BUS4480', 78),
(4, 14, 1456457, 'BUS4440', 59),
(3, 15, 1456455, 'BUS4420', 89);


CREATE TABLE WritingAppointment (
  AppointmentID     INT NOT NULL IDENTITY(1,1),
  StudentID         INT NOT NULL,
  ProfessorID         INT NOT NULL,
  WritingCenterID  INT NOT NULL,
  Paper             CHAR(1) DEFAULT 'Y',
  CONSTRAINT PK_WrittingAppointment_AppointmentID PRIMARY KEY (AppointmentID),
  CONSTRAINT FK_WrittingAppointment_Student FOREIGN KEY (StudentID) REFERENCES Student (StudentID),
  CONSTRAINT FK_WrittingAppointment_Teacher FOREIGN KEY (ProfessorID) REFERENCES Teacher (TeacherID),
  CONSTRAINT FK_WrittingAppointment_WrittingCenter FOREIGN KEY (WritingCenterID) REFERENCES WrittingCenter (WrittingCenterID)
);

INSERT INTO WritingAppointment (AppointmentID, StudentID, ProfessorID, WritingCenterID)
VALUES (1645, 1263525, 1564877, 1),
    (1548, 1263525, 1565895, 11),
    (1567, 1223525, 1554567, 12),
    (1526, 1233525, 1513554, 14),
    (1785, 1256525, 1565457, 7),
    (1156, 1243225, 1578541, 9),
    (1156, 1287425, 1545678, 10),
    (1567, 1234525, 1545678, 4),
    (1598, 1148725, 1654875, 6),
    (1654, 1658785, 1658974, 12),
    (1458, 1156357, 1564789, 5),
    (1654, 1156875, 1541257, 6),
    (1658, 1874556, 1564878, 6),
    (1659, 1588484, 1123547, 4),
    (1125, 1254874, 1456789, 2);




