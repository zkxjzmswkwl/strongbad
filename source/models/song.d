module models.song;

import global;

import models.artist;
import models.album;

class Song
{
    private int     song_id;
    private Artist  artist_id;
    private Album   album_id;
    private string  title;
    // private int     scrobble_count;
    // private string  description;

    public int      GetId()             { return song_id;       }
    public string   GetTitle()          { return title;         }
    public Artist   GetArtist()         { return artist_id;     }
    public Album    GetAlbum()          { return album_id;      }
    // public int      GetScrobbleCount()  { return scrobble_count;}
    // public string   GetDescription()    { return description;   }

    // The query should work, but honestly have not tested the function.
    private static void CreateTable()
    {
        WGlobal
            .GetDatabase()
            .Exec("CREATE TABLE songs(
                song_id INT GENERATED ALWAYS AS IDENTITY, 
                album_id INT, artist_id INT, 
                title VARCHAR(100) NOT NULL, 
                PRIMARY KEY(song_id), 
                CONSTRAINT fk_album
                     FOREIGN KEY(album_id) REFERENCES albums(album_id),
                CONSTRAINT fk_artist
                    FOREIGN KEY(artist_id) 
                        REFERENCES artists(artist_id));"
            );
    }
}

/*
CREATE TABLE songs(song_id INT GENERATED ALWAYS AS IDENTITY, artist_id INT, album_id INT, title VARCHAR(200), scrobble_count INT, description VARCHAR(400), PRIMARY KEY(song_id), CONSTRAINT fk_artist FOREIGN KEY(artist_id) REFERENCES artists(artist_id), CONSTRAINT fk_album FOREIGN KEY(album_id) REFERENCES albums(album_id));
*/