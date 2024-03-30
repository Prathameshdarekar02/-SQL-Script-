create database Task_Tracking_System

use Task_Tracking_System

-- Task Tracking System Database Schema

-- Table for storing projects
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100) NOT NULL,
    Description TEXT,
    StartDate DATE,
    EndDate DATE
);

-- Index on ProjectName column for faster lookup
CREATE INDEX idx_ProjectName ON Projects (ProjectName);

-- Table for storing team members
CREATE TABLE TeamMembers (
    MemberID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Role VARCHAR(50)
);

-- Index on FullName column for faster lookup
CREATE INDEX idx_TeamMembers_FullName ON TeamMembers (FullName);

-- Table for storing tasks
CREATE TABLE Tasks (
    TaskID INT PRIMARY KEY,
    TaskName VARCHAR(100) NOT NULL,
    Description TEXT,
    ProjectID INT,
    Deadline DATE,
    AssignedTo INT,
    Status VARCHAR(20),
    CONSTRAINT FK_Tasks_Projects FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    CONSTRAINT FK_Tasks_TeamMembers FOREIGN KEY (AssignedTo) REFERENCES TeamMembers(MemberID)
);

-- Index on TaskName column for faster lookup
CREATE INDEX idx_Tasks_TaskName ON Tasks (TaskName);

-- Index on Deadline column for faster lookup
CREATE INDEX idx_Tasks_Deadline ON Tasks (Deadline);

-- Index on AssignedTo column for faster lookup
CREATE INDEX idx_Tasks_AssignedTo ON Tasks (AssignedTo);

-- Table for storing task dependencies
CREATE TABLE TaskDependencies (
    DependencyID INT PRIMARY KEY,
    ParentTaskID INT,
    ChildTaskID INT,
    CONSTRAINT FK_TaskDependencies_ParentTasks FOREIGN KEY (ParentTaskID) REFERENCES Tasks(TaskID),
    CONSTRAINT FK_TaskDependencies_ChildTasks FOREIGN KEY (ChildTaskID) REFERENCES Tasks(TaskID)
);

-- Index on ParentTaskID column for faster lookup
CREATE INDEX idx_TaskDependencies_ParentTaskID ON TaskDependencies (ParentTaskID);

-- Index on ChildTaskID column for faster lookup
CREATE INDEX idx_TaskDependencies_ChildTaskID ON TaskDependencies (ChildTaskID);

-- Table for storing task comments or notes
CREATE TABLE TaskComments (
    CommentID INT PRIMARY KEY,
    TaskID INT,
    Comment TEXT,
    CommentedBy INT,
    CommentDate TIMESTAMP,
    CONSTRAINT FK_TaskComments_Tasks FOREIGN KEY (TaskID) REFERENCES Tasks(TaskID),
    CONSTRAINT FK_TaskComments_TeamMembers FOREIGN KEY (CommentedBy) REFERENCES TeamMembers(MemberID)
);

-- Index on CommentedBy column for faster lookup
CREATE INDEX idx_TaskComments_CommentedBy ON TaskComments (CommentedBy);

-- Index on CommentDate column for faster lookup
CREATE INDEX idx_TaskComments_CommentDate ON TaskComments (CommentDate);
