create database Fitness_Tracker

use fitness_tracker

-- Fitness Tracker Database Schema

-- Table for storing user profiles
CREATE TABLE UserProfiles (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(100) NOT NULL,
    Age INT,
    Gender VARCHAR(10),
    Weight DECIMAL(10, 2),
    Height DECIMAL(10, 2),
    FitnessLevel VARCHAR(50)
);

-- Index on UserName column for faster lookup
CREATE INDEX idx_UserName ON UserProfiles (UserName);

-- Table for storing fitness activities
CREATE TABLE FitnessActivities (
    ActivityID INT PRIMARY KEY,
    ActivityName VARCHAR(100) NOT NULL,
    Description TEXT,
    CaloriesBurned DECIMAL(10, 2),
    DurationMinutes INT,
    ActivityDate DATE,
    UserID INT,
    CONSTRAINT FK_UserID_FitnessActivities FOREIGN KEY (UserID) REFERENCES UserProfiles(UserID)
);

-- Index on ActivityName column for faster lookup
CREATE INDEX idx_ActivityName ON FitnessActivities (ActivityName);

-- Table for storing workouts
CREATE TABLE Workouts (
    WorkoutID INT PRIMARY KEY,
    WorkoutName VARCHAR(100) NOT NULL,
    Description TEXT,
    StartTime TIME,
    EndTime TIME,
    WorkoutDate DATE,
    UserID INT,
    CONSTRAINT FK_UserID_Workouts FOREIGN KEY (UserID) REFERENCES UserProfiles(UserID)
);

-- Index on WorkoutName column for faster lookup
CREATE INDEX idx_WorkoutName ON Workouts (WorkoutName);

-- Table for storing fitness goals
CREATE TABLE FitnessGoals (
    GoalID INT PRIMARY KEY,
    GoalName VARCHAR(100) NOT NULL,
    Description TEXT,
    TargetDate DATE,
    TargetCalories DECIMAL(10, 2),
    TargetDurationMinutes INT,
    UserID INT,
    CONSTRAINT FK_UserID_FitnessGoals FOREIGN KEY (UserID) REFERENCES UserProfiles(UserID)
);

-- Index on GoalName column for faster lookup
CREATE INDEX idx_GoalName ON FitnessGoals (GoalName);

-- Table for tracking progress towards fitness goals
CREATE TABLE Progress (
    ProgressID INT PRIMARY KEY,
    GoalID INT,
    ProgressDate DATE,
    CaloriesBurned DECIMAL(10, 2),
    DurationMinutes INT,
    UserID INT,
    CONSTRAINT FK_GoalID_Progress FOREIGN KEY (GoalID) REFERENCES FitnessGoals(GoalID),
    CONSTRAINT FK_UserID_Progress FOREIGN KEY (UserID) REFERENCES UserProfiles(UserID)
);

-- Index on ProgressDate column for faster lookup
CREATE INDEX idx_ProgressDate ON Progress (ProgressDate);
