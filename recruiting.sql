drop database if exists recruiting_db;
create database recruiting_db;
use recruiting_db;

CREATE TABLE Players (
    PlayerID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Player_FName CHAR(25) NOT NULL,
    Player_LName CHAR(25) NOT NULL,
    Player_DOB DATE NOT NULL,
    Player_Street CHAR(25) NULL,
    Player_City CHAR(25) NULL,
    Player_State CHAR(25) NULL,
    Player_County CHAR(25) NULL,
    Player_Email VARCHAR(100) NULL,
    Player_Phone CHAR(12) NULL,
    Parent1_FName CHAR(25) NULL,
    Parent1_LName CHAR(25) NULL,
    Parent1_Phone CHAR(12) NULL,
    Parent1_Email VARCHAR(100) NULL,
    Parent2_FName CHAR(25) NULL,
    Parent2_LName CHAR(25) NULL,
    Parent2_Phone CHAR(12) NULL,
    Parent2_Email VARCHAR(100) NULL,
    Player_Sibling_Names CHAR(100) NULL,
    Player_living_situation CHAR(100) NULL,
    Player_School_Name CHAR(25) NULL,
    Player_School_Street CHAR(25) NULL,
    Player_School_City CHAR(25) NULL,
    Player_School_State CHAR(25) NULL,
    Player_HSCoach_FName CHAR(25) NULL,
    Player_HSCoach_LName CHAR(25) NULL,
    Player_HSCoach_Phone CHAR(15) NULL,
    Player_HSCoach_Email VARCHAR(100) NULL,
    Player_HSCoach_WAS BOOL NULL,
    Player_AAU_Team CHAR(25) NULL,
    Player_AAU_State CHAR(25) NULL,
    Player_AAUCoach_FName CHAR(25) NULL,
    Player_AAUCoach_LName CHAR(25) NULL,
    Player_AAUCoach_Phone CHAR(15) NULL,
    Player_AAUCoach_Email VARCHAR(100) NULL,
    Player_Date_Located DATE NOT NULL,
    Player_Event_Located CHAR(100) NOT NULL
);

CREATE TABLE Coaches(
	CoachID INT NOT NULL PRIMARY KEY auto_increment,
    Coach_FName Char(25) NOT NULL,
    Coach_LName Char(25) NOT NULL,
    CPosition Char(25) NOT NULL,
    Coach_DOB date NOT NULL, 
    Coach_Phone CHAR(12) NOT NULL,
    Coach_Work_Email VARCHAR(100) NOT NULL UNIQUE,
    Coach_P_Email varchar(100) NOT NULL UNIQUE,
    PlayerID int not null,
    constraint PlayerID_Coaches_FK
		foreign key (PlayerID)
        References Players(PlayerID)
);

create table Academics(
	AcadID int not null primary key auto_increment,
    PlayerGPA numeric(3,2) null,
    Academic_interest char(25) null,
    PlayerTranscript bool NOT NULL,
    PlayerID int not null,
    constraint PlayerID_Acad_FK
		foreign key (PlayerID)
        References Players(PlayerID)
);

create table CurrentTeam(
	TeamID int not null primary key auto_increment,
    TeamYear year not null,
    Team_wins int null,
    Team_losses int null,
    PlayerID int not null,
    constraint PlayerID_Team_FK
		foreign key (PlayerID)
        References Players(PlayerID)
);

create table PlayerStats(
	PlayerStatsID int not null primary key auto_increment,
    Player_Position char(2) not null,
    Player_PriorPPG numeric(4,2) null,
    Player_PriorRPG numeric(4,2) null,
    Player_PriorAPG numeric(4,2) null,
    Player_PriorSPG numeric(4,2) null,
    Player_PriorBPG numeric(4,2) null,
    PlayerID int not null,
    constraint PlayerID_PlayerStats_FK
		foreign key (PlayerID)
        References Players(PlayerID)
);

create table RecruitingClass(
	ClassID int not null primary key auto_increment,
    RecruitYear year not null,
    PlayerID int not null,
    constraint PlayerID_RecruitingClass_FK
		foreign key (PlayerID)
        References Players(PlayerID)

);
create table Notes(
	NotesID int not null primary key auto_increment,
    CoachComments mediumtext null,
    CoachCommentsDate datetime default now(),
    VisitType char(25) null,
    VisitComments mediumtext null,
    VisitCommentsDate datetime default now(),
    ContactType char(25) null,
    ContactNotes mediumtext null,
    ContactNotesDate datetime default now(),
    EventNotes mediumtext null,
    EventNotesDate datetime default now()
);
create table PlayerNotes(
	PlayerID int not null,
    NotesID int not null,
	constraint PlayerID_PlayerNotes_FK
		foreign key (PlayerID)
        References Players(PlayerID),
	constraint PlayerID_NotesTable_FK
		foreign key (NotesID)
        References Notes(NotesID)
);

