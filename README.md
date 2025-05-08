# 🍽️ Restaurant Reservation System - The Beatles

This project is a database-backed restaurant reservation system developed as part of a university-level DBMS course. It includes a comprehensive system design, entity relationships, and SQL operations to simulate a real-world restaurant experience — including an optional **pick-up service**.

## 📌 Table of Contents
- [Project Overview](#project-overview)
- [System Features](#system-features)
- [Folder Structure](#folder-structure)
- [Database Details](#database-details)
- [Deployment](#deployment)


## 🚀 Project Overview

The system enables:
- Customers to make reservations
- Staff to manage availability and orders
- Admins to handle user roles, queries, and data control
- Optional pick-up service with scheduled pickup times

The project is modeled around a fictional restaurant called **The Beatles**, known for its harmony in both music and management 🍴🎶.

## ✅ System Features
- Table reservation
- Order management
- Role-based user operations (Admin / Staff / Customer)
- SQL queries supporting DDL, DML, DQL, DCL
- Pick-up service logic and scheduling

## 📁 Folder Structure
```bash restaurant-reservation-system/ ├── docs/ # Project documents and system design files │ ├── Requirement_Document.pdf # Functional and non-functional requirements │ ├── System_Design_Document.pdf # System architecture, flowcharts, and modules │ ├── Database_Design_Document.pdf # DB schema, table design, normalization │ ├── Deployment_Plan.pdf # Setup instructions and deployment steps ├── scripts/ # SQL scripts for database operations │ ├── DDL.sql # Create tables, schemas, constraints │ ├── DML.sql # Insert and update sample data │ ├── DQL.sql # Queries for data retrieval │ └── DCL.sql # User permissions and security ├── presentation/ # Presentation and visuals used in project │ ├── The_Beatles_Presentation.pdf # Main project presentation │ └── ER_Diagram.png # Visual representation of ER model ├── images/ # Optional screenshots or UI mockups │ └── system_overview.png # General system workflow diagram ├── README.md # Project overview and instructions ├── LICENSE # License information for open-source use ```


## 🧠 Database Details
- Relational database schema designed using ER diagram
- Normalized up to 3NF
- SQL scripts for:
  - Table creation (`DDL.sql`)
  - Data insertion (`DML.sql`)
  - Queries (`DQL.sql`)
  - User rights (`DCL.sql`)

## ⚙️ Deployment
See `docs/Deployment_Plan.pdf` for instructions on setting up the system in your local DBMS (MySQL or PostgreSQL recommended).

## 🖼️ Screenshots
You can find relevant visuals and schema diagrams in the `images/` and `presentation/` folders.

## 👥 Authors
- [Mehmet Temel]
- [Nigina Abdukhalimova]
- [Merve Yaman]
- [Eda Melike Demirelli]

  > 📌 *This project was created as part of a DBMS course at ALKU, showcasing full-cycle database development from requirement gathering to deployment.*
