module models.album;

import global;
import orm;
import models.artist;

class Album
{
    private int     album_id;
    private Artist  artist_id;
    private string  title;
    // private auto    cover;
    // private auto    year;

    public int      GetId()     { return album_id;      }
    public Artist   GetArtist() { return artist_id;     }
    public string   GetTitle()  { return title;         }
    // public string   GetCover()  { return cover;         }
    // public int      GetYear()   { return year;          }

    // The query should work, but honestly have not tested the function.
    private static void CreateTable()
    {
        WGlobal
            .GetDatabase()
            .Exec("CREATE TABLE albums(album_id INT GENERATED ALWAYS AS IDENTITY, artist_id INT, album_title VARCHAR(100) NOT NULL, PRIMARY KEY(album_id), CONSTRAINT fk_artist FOREIGN KEY(artist_id) REFERENCES artists(artist_id));");
    }
}

/*
CREATE TABLE albums(album_id INT GENERATED ALWAYS AS IDENTITY, artist_id INT, title VARCHAR(100) NOT NULL UNIQUE, cover VARCHAR(200), year INT, PRIMARY KEY(album_id), CONSTRAINT fk_artist FOREIGN KEY(artist_id) REFERENCES artists(artist_id));
*/