/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      NYCFood_DimModel.DM1
 *
 * Date Created : Monday, February 13, 2023 21:55:18
 * Target DBMS : Microsoft Azure SQL DB
 */

/* 
 * TABLE: Dim_Action 
 */

CREATE TABLE Dim_Action(
    ActionSK    int             NOT NULL,
    Action      varchar(255)    NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (ActionSK)
)

go


IF OBJECT_ID('Dim_Action') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Action >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Action >>>'
go

/* 
 * TABLE: Dim_Business 
 */

CREATE TABLE Dim_Business(
    BusinessSK    int            NOT NULL,
    CAMIS         varchar(10)    NOT NULL,
    DBA           varchar(30)    NOT NULL,
    Phone         varchar(10)    NOT NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (BusinessSK)
)

go


IF OBJECT_ID('Dim_Business') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Business >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Business >>>'
go

/* 
 * TABLE: Dim_Community_Council 
 */

CREATE TABLE Dim_Community_Council(
    Community_CouncilSK    int            NOT NULL,
    CommunityBoard         varchar(50)    NOT NULL,
    Council_District       varchar(10)    NOT NULL,
    Census                 varchar(10)    NOT NULL,
    BIN                    varchar(10)    NOT NULL,
    BBL                    varchar(10)    NOT NULL,
    NTA                    varchar(10)    NOT NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (Community_CouncilSK)
)

go


IF OBJECT_ID('Dim_Community_Council') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Community_Council >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Community_Council >>>'
go

/* 
 * TABLE: Dim_Cuisine 
 */

CREATE TABLE Dim_Cuisine(
    CuisineSK      int             NOT NULL,
    CuisineDesc    varchar(255)    NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (CuisineSK)
)

go


IF OBJECT_ID('Dim_Cuisine') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Cuisine >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Cuisine >>>'
go

/* 
 * TABLE: Dim_Date 
 */

CREATE TABLE Dim_Date(
    DateSK               int            NOT NULL,
    FullDate             datetime       NOT NULL,
    DayNumberofWeek      int            NOT NULL,
    DayNameofWeek        varchar(20)    NOT NULL,
    DayNumberofMonth     int            NOT NULL,
    DayNumberofYear      int            NOT NULL,
    WeekNumberofYear     int            NOT NULL,
    MonthName            varchar(10)    NOT NULL,
    MonthNumberofYear    int            NOT NULL,
    CalendarQuarter      int            NOT NULL,
    CalendarYear         int            NOT NULL,
    CONSTRAINT PK8 PRIMARY KEY NONCLUSTERED (DateSK)
)

go


IF OBJECT_ID('Dim_Date') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Date >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Date >>>'
go

/* 
 * TABLE: Dim_Geography 
 */

CREATE TABLE Dim_Geography(
    GeographySK    int               NOT NULL,
    Latitude       numeric(10, 0)    NOT NULL,
    Longitude      numeric(10, 0)    NOT NULL,
    Boro           varchar(30)       NOT NULL,
    Building       varchar(30)       NOT NULL,
    Street         varchar(30)       NOT NULL,
    Zipcode        varchar(30)       NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (GeographySK)
)

go


IF OBJECT_ID('Dim_Geography') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Geography >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Geography >>>'
go

/* 
 * TABLE: Dim_Violation 
 */

CREATE TABLE Dim_Violation(
    ViolationSK      int             NOT NULL,
    ViolationCode    varchar(10)     NOT NULL,
    ViolationDesc    varchar(255)    NOT NULL,
    CriticalFlag     varchar(20)     NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (ViolationSK)
)

go


IF OBJECT_ID('Dim_Violation') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Violation >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Violation >>>'
go

/* 
 * TABLE: [Restaurant Inspections NYC] 
 */

CREATE TABLE [Restaurant Inspections NYC](
    [Restaurant InspectionSK]  int               NOT NULL,
    BusinessSK                 int               NOT NULL,
    GeographySK                int               NOT NULL,
    CuisineSK                  int               NOT NULL,
    ActionSK                   int               NOT NULL,
    ViolationSK                int               NOT NULL,
    Community_CouncilSK        int               NOT NULL,
    GradeDateSK                int               NOT NULL,
    RecordDateSK               int               NOT NULL,
    Score                      numeric(10, 0)    NOT NULL,
    Grade                      varchar(2)        NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED ([Restaurant InspectionSK], BusinessSK, GeographySK, CuisineSK, ActionSK, ViolationSK, Community_CouncilSK, GradeDateSK, RecordDateSK)
)

go


IF OBJECT_ID('Restaurant Inspections NYC') IS NOT NULL
    PRINT '<<< CREATED TABLE Restaurant Inspections NYC >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Restaurant Inspections NYC >>>'
go

/* 
 * TABLE: [Restaurant Inspections NYC] 
 */

ALTER TABLE [Restaurant Inspections NYC] ADD CONSTRAINT RefDim_Geography2 
    FOREIGN KEY (GeographySK)
    REFERENCES Dim_Geography(GeographySK)
go

ALTER TABLE [Restaurant Inspections NYC] ADD CONSTRAINT RefDim_Cuisine3 
    FOREIGN KEY (CuisineSK)
    REFERENCES Dim_Cuisine(CuisineSK)
go

ALTER TABLE [Restaurant Inspections NYC] ADD CONSTRAINT RefDim_Action4 
    FOREIGN KEY (ActionSK)
    REFERENCES Dim_Action(ActionSK)
go

ALTER TABLE [Restaurant Inspections NYC] ADD CONSTRAINT RefDim_Violation5 
    FOREIGN KEY (ViolationSK)
    REFERENCES Dim_Violation(ViolationSK)
go

ALTER TABLE [Restaurant Inspections NYC] ADD CONSTRAINT RefDim_Business6 
    FOREIGN KEY (BusinessSK)
    REFERENCES Dim_Business(BusinessSK)
go

ALTER TABLE [Restaurant Inspections NYC] ADD CONSTRAINT RefDim_Community_Council7 
    FOREIGN KEY (Community_CouncilSK)
    REFERENCES Dim_Community_Council(Community_CouncilSK)
go

ALTER TABLE [Restaurant Inspections NYC] ADD CONSTRAINT RefDim_Date9 
    FOREIGN KEY (GradeDateSK)
    REFERENCES Dim_Date(DateSK)
go

ALTER TABLE [Restaurant Inspections NYC] ADD CONSTRAINT RefDim_Date10 
    FOREIGN KEY (GradeDateSK)
    REFERENCES Dim_Date(DateSK)
go

ALTER TABLE [Restaurant Inspections NYC] ADD CONSTRAINT RefDim_Date12 
    FOREIGN KEY (RecordDateSK)
    REFERENCES Dim_Date(DateSK)
go


