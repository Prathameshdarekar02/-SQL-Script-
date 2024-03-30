create database Event_Management_System

use Event_Management_System

-- Event Management System Database Schema

-- Table for storing venues
CREATE TABLE Venues (
    VenueID INT PRIMARY KEY,
    VenueName VARCHAR(100) NOT NULL,
    Address VARCHAR(200)
);

-- Table for storing events
CREATE TABLE Events (
    EventID INT PRIMARY KEY,
    EventName VARCHAR(100) NOT NULL,
    EventDate DATE,
    StartTime TIME,
    EndTime TIME,
    VenueID INT,
    CONSTRAINT FK_VenueID_Events FOREIGN KEY (VenueID) REFERENCES Venues(VenueID)
);

-- Index on EventDate column for faster lookup
CREATE INDEX idx_EventDate ON Events (EventDate);

-- Table for storing attendees
CREATE TABLE Attendees (
    AttendeeID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20)
);

-- Table for mapping events to attendees
CREATE TABLE EventAttendees (
    EventID INT,
    AttendeeID INT,
    CONSTRAINT PK_EventAttendees PRIMARY KEY (EventID, AttendeeID),
    CONSTRAINT FK_EventID_EventAttendees FOREIGN KEY (EventID) REFERENCES Events(EventID),
    CONSTRAINT FK_AttendeeID_EventAttendees FOREIGN KEY (AttendeeID) REFERENCES Attendees(AttendeeID)
);

-- Table for storing event schedules
CREATE TABLE EventSchedules (
    ScheduleID INT PRIMARY KEY,
    EventID INT,
    StartTime TIME,
    EndTime TIME,
    CONSTRAINT FK_EventID_EventSchedules FOREIGN KEY (EventID) REFERENCES Events(EventID)
);

-- Table for storing tickets
CREATE TABLE Tickets (
    TicketID INT PRIMARY KEY,
    EventID INT,
    TicketType VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    CONSTRAINT FK_EventID_Tickets FOREIGN KEY (EventID) REFERENCES Events(EventID)
);

-- Index on VenueName column for faster lookup
CREATE INDEX idx_VenueName ON Venues (VenueName);

-- Index on TicketType column for faster lookup
CREATE INDEX idx_TicketType ON Tickets (TicketType);
