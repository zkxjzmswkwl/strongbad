module models.artist;

import global;

class Artist
{
    // NOTE: Tracking scrobble count on artist is not necessary when 
    // `scrobbleCount` is a member of `Song`.

    private int     artist_id;
    private string  name;
    private string  biography;
    private string  picture;

    public int      GetId()               { return artist_id;     } 
    public string   GetName()             { return name;          }
    public string   GetBiography()        { return biography;     }
    public string   GetPicture()          { return picture;       }
}

/*
CREATE TABLE artists(artist_id INT GENERATED ALWAYS AS IDENTITY, genre_id INT, name VARCHAR(50) NOT NULL UNIQUE, biography VARCHAR(1000), picture VARCHAR(200), PRIMARY KEY(artist_id), CONSTRAINT fk_genre FOREIGN KEY(genre_id) REFERENCES genres(genre_id));
*/