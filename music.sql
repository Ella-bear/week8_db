-- Create Database
CREATE DATABASE SpotifyDB;

USE SpotifyDB;

-- Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY, --clustered index
    username VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    date_joined DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Artists Table
CREATE TABLE Artists (
    artist_id INT AUTO_INCREMENT PRIMARY KEY, --clustered index
    artist_name VARCHAR(255) NOT NULL,
    bio TEXT
);

-- Albums Table
CREATE TABLE Albums (
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    album_name VARCHAR(255) NOT NULL,
    release_date DATE,
    artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)
);

-- Songs Table with 3NF
CREATE TABLE Songs (
    song_id INT AUTO_INCREMENT PRIMARY KEY,
    song_name VARCHAR(255) NOT NULL,
    duration INT,  -- Duration in seconds
    album_id INT,
    genre_id INT,
    release_date DATE,
    FOREIGN KEY (album_id) REFERENCES Albums(album_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

-- Genres Table
CREATE TABLE Genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL
);

-- Playlists Table
CREATE TABLE Playlists (
    playlist_id INT AUTO_INCREMENT PRIMARY KEY,
    playlist_name VARCHAR(255) NOT NULL,
    user_id INT,
    creation_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Playlist_Songs Table (M-M relationship between Playlists and Songs)
CREATE TABLE Playlist_Songs (
    playlist_id INT,
    song_id INT,
    PRIMARY KEY (playlist_id, song_id),
    FOREIGN KEY (playlist_id) REFERENCES Playlists(playlist_id),
    FOREIGN KEY (song_id) REFERENCES Songs(song_id)
);


-- populated data from all tables
INSERT INTO Users (username, email, password_hash) VALUES 
('john_doe', 'john.doe@gmail.com', 'hashed_password_1'),
('jane_smith', 'jane.smith@yahoo.com', 'hashed_password_2'),
('mike_jones', 'mike.jones@yahoo.com', 'hashed_password_3'),
('emma_brown', 'emma.brown@gmail.com', 'hashed_password_4'),
('lucas_white', 'lucas.white@yahoo.com', 'hashed_password_5'),
('sophia_davis', 'sophia.davis@protonmail.com', 'hashed_password_6'),
('chris_clark', 'chris.clark@microsoft.com', 'hashed_password_7'),
('lily_wilson', 'lily.wilson@microsoft.com', 'hashed_password_8'),
('jack_miller', 'jack.miller@yahoo.com', 'hashed_password_9'),
('olivia_walker', 'olivia.walker@protonmail.com', 'hashed_password_10');

-- Insert Artists
INSERT INTO Artists (artist_name, bio) VALUES
('The Beatles', 'A legendary British rock band'),
('Taylor Swift', 'An American singer-songwriter'),
('Ed Sheeran', 'An English singer-songwriter and record producer'),
('Adele', 'An English singer and songwriter'),
('Coldplay', 'A British rock band'),
('Drake', 'A Canadian rapper, singer, and songwriter'),
('Billie Eilish', 'An American singer and songwriter'),
('Eminem', 'An American rapper and songwriter'),
('Kendrick Lamar', 'An American rapper, songwriter, and record producer'),
('Shakira', 'A Colombian singer, songwriter, and dancer');

-- Insert Genres
INSERT INTO Genres (genre_name) VALUES
('Pop'),
('Rock'),
('Jazz'),
('Classical'),
('Hip Hop'),
('Electronic'),
('R&B'),
('Country'),
('Reggae'),
('Indie');

-- Insert Albums
INSERT INTO Albums (album_name, release_date, artist_id) VALUES
('Abbey Road', '1969-09-26', 1),
('1989', '2014-10-27', 2),
('Divide', '2017-03-03', 3),
('25', '2015-11-20', 4),
('Parachutes', '2000-07-10', 5),
('Views', '2016-04-29', 6),
('When We All Fall Asleep, Where Do We Go?', '2019-03-29', 7),
('The Eminem Show', '2002-05-26', 8),
('DAMN.', '2017-04-14', 9),
('Laundry Service', '2001-11-13', 10);

-- Insert Songs
INSERT INTO Songs (song_name, duration, album_id, artist_id, genre_id, release_date) VALUES
('Come Together', 259, 1, 1, 2, '1969-09-26'),
('Hey Jude', 431, 1, 1, 2, '1968-08-26'),
('Shake It Off', 219, 2, 2, 1, '2014-10-27'),
('Blank Space', 231, 2, 2, 1, '2014-10-27'),
('Shape of You', 233, 3, 3, 1, '2017-03-03'),
('Castle on the Hill', 261, 3, 3, 1, '2017-03-03'),
('Hello', 295, 4, 4, 1, '2015-10-23'),
('Someone Like You', 285, 4, 4, 1, '2011-01-24'),
('Yellow', 269, 5, 5, 2, '2000-07-10'),
('Fix You', 281, 5, 5, 2, '2005-09-05'),
('Hotline Bling', 268, 6, 6, 5, '2015-07-31'),
('God\'s Plan', 198, 6, 6, 5, '2018-02-16'),
('Bad Guy', 194, 7, 7, 1, '2019-03-29'),
('Bury a Friend', 230, 7, 7, 1, '2019-03-29'),
('Lose Yourself', 326, 8, 8, 5, '2002-10-28'),
('Stan', 396, 8, 8, 5, '2000-05-23'),
('HUMBLE.', 197, 9, 9, 5, '2017-03-30'),
('DNA.', 285, 9, 9, 5, '2017-04-14'),
('Hips Don\'t Lie', 233, 10, 10, 1, '2006-02-28'),
('Whenever, Wherever', 211, 10, 10, 1, '2001-11-13');

-- Insert Playlists
INSERT INTO Playlists (playlist_name, user_id) VALUES
('Chill Vibes', 1),
('Workout Beats', 2),
('Top Hits 2024', 3),
('Indie Rock', 4),
('Pop Classics', 5),
('R&B Hits', 6),
('Rap Essentials', 7),
('Classic Rock', 8),
('Summer Playlist', 9),
('Party Mix', 10);

-- Insert Playlist_Songs (M-M relationship between Playlists and Songs)
INSERT INTO Playlist_Songs (playlist_id, song_id) VALUES
(1, 1), (1, 3), (1, 5), (1, 7), (1, 9), (1, 11),
(2, 2), (2, 4), (2, 6), (2, 8), (2, 10), (2, 12),
(3, 1), (3, 3), (3, 5), (3, 7), (3, 9), (3, 11),
(4, 13), (4, 14), (4, 15), (4, 16), (4, 17), (4, 18),
(5, 1), (5, 2), (5, 3), (5, 4), (5, 5), (5, 6),
(6, 3), (6, 4), (6, 5), (6, 6), (6, 7), (6, 8),
(7, 7), (7, 8), (7, 9), (7, 10), (7, 11), (7, 12),
(8, 13), (8, 14), (8, 15), (8, 16), (8, 17), (8, 18),
(9, 1), (9, 2), (9, 3), (9, 4), (9, 5), (9, 6),
(10, 6), (10, 7), (10, 8), (10, 9), (10, 10), (10, 11);

-- operations performed on the database
-- Delete user with user_id = 4 (Emma Brown)
DELETE FROM Users WHERE user_id = 4;

-- Delete song with song_id = 15 (Stan by Eminem)
DELETE FROM Songs WHERE song_id = 15;

-- Update the email of user with user_id = 3 (Mike Jones)
UPDATE Users
SET email = 'mike.jones.updated@gmail.com'
WHERE user_id = 3;

-- perform group queries
-- find the most popular artist in each playlist
WITH ArtistCounts AS (
    SELECT 
        p.playlist_id,
        p.playlist_name,
        a.artist_id,
        a.artist_name,
        COUNT(s.song_id) AS songs_in_playlist,
        RANK() OVER (PARTITION BY p.playlist_id ORDER BY COUNT(s.song_id) DESC) AS rank_in_playlist
    FROM Playlists p
    JOIN Playlist_Songs ps ON p.playlist_id = ps.playlist_id
    JOIN Songs s ON ps.song_id = s.song_id
    JOIN Artists a ON s.artist_id = a.artist_id
    GROUP BY p.playlist_id, a.artist_id
)
SELECT playlist_id, playlist_name, artist_id, artist_name, songs_in_playlist
FROM ArtistCounts
WHERE rank_in_playlist = 1
ORDER BY playlist_id;
