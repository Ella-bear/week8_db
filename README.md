Spotify Music Database Management System
This project is a complete implementation of a Spotify Music Database Management System using MySQL. The goal of this project is to simulate a real-world database system for managing music data, including users, artists, albums, songs, playlists, and genre information. The database is structured with proper relationships, constraints, and normalization.

The project allows users to:
Register and manage accounts.
Add and organize songs into albums.
Create playlists and add songs to them.
Track music by genre, artist, and album.
Perform basic CRUD operations on users, songs, and playlists.


Setup Instructions:

1. Install Required Software:
   - Download and install MySQL Workbench from: https://dev.mysql.com/downloads/workbench/

2. Database Setup:
   - Open MySQL Workbench
   - Connect to your local MySQL server using the default connection (usually localhost:3306)
   - Create a new database by running:
     ```sql
     CREATE DATABASE SpotifyDB;
     USE SpotifyDB;
     ```

3. Import Database Schema:
   - In MySQL Workbench, go to File > Open SQL Script
   - Navigate to the project's `database` folder and select `schema.sql`
   - Click the lightning bolt icon or press Ctrl+Shift+Enter to execute the script
   - This will create all necessary tables and relationships

4. Import Sample Data (Optional):
   - Open the `sample_data.sql` file from the project's `database` folder
   - Execute the script to populate the database with sample data

5. Verify Setup:
   - In MySQL Workbench, expand the "Schemas" tab
   - Verify that `SpotifyDB` appears with all tables
   - Run a test query to ensure data is accessible:
     ```sql
     SELECT * FROM users LIMIT 3;
     ```

6. Connecting to the Database:
   - The application uses the following default connection settings:
     - Host: localhost
     - Port: 3306
     - Database: SpotifyDB
     - Username: root (or your configured username)
     - Password: (your MySQL password)


