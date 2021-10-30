module orm.queries;

import std.format;

import hunt.database;

import orm.db;
import models;
import global;

class WQueries
{
    WDatabase *Database;

    this()
    {
        Database = WGlobal.GetDatabase();
    }

    //---------------------------------------------------------------
    // Users - Last modified 2021-10-29
    //---------------------------------------------------------------
    public int InsertUser(string name, string password, string email)
    {
        // TODO: There's a better way of doing this where we don't have to use `format`.
        // See: arsd database interface: https://arsd-official.dpldocs.info/source/arsd.database.d.html#L89 
        string built = format(
            "INSERT INTO users(name, password, email)
             VALUES ('%s', '%s', '%s');",
            name, password, email
        );
        // return value being the amount of rows impacted by this commit.
        return Database.NExec(built);
    }

    public User GetUser(string name)
    {
        return Database.RExec(
            "SELECT * FROM users WHERE name='" ~ name ~ "';"
        ).firstRow().bind!User();
    }

    public User[] GetAllUsers()
    {
        return Database.RExec("SELECT * FROM users;").bind!User();
    }

    //---------------------------------------------------------------
    // Artists - Last modified 2021-10-29
    //---------------------------------------------------------------
    public int InsertArtist(
        string name,
        string biography = "None",
        string picture   = "None"
    )
    {
        return Database.NExec(
            format("INSERT INTO artists(name) VALUES('%s');", name)
        );
    }

    public Artist GetArtist(string name)
    {
        return Database.RExec(
            "SELECT * FROM artists WHERE name='" ~ name ~ "';"
        ).firstRow().bind!Artist();
    }

    public Artist[] GetAllArtists()
    {
        return Database.RExec("SELECT * FROM artists;").bind!Artist();
    }

    //---------------------------------------------------------------
    // Albums - Last modified 2021-10-29
    //------------------------------------------------
   public int InsertAlbum(string title, Artist artist)
    {
        return Database.NExec(
            format(
                "INSERT INTO albums(artist_id, title)
                 VALUES(%d, '%s');", artist.GetId(), title
            )
        );
    }

    public Album GetAlbum(string title)
    {
        return Database.RExec(
            "SELECT * FROM albums WHERE title='" ~ title ~ "';"
        ).firstRow().bind!Album();
    }

    public Album[] GetAllAlbums()
    {
        return Database.RExec("SELECT * FROM albums;").bind!Album();
    }

    //---------------------------------------------------------------
    // Songs - Last modified 2021-10-29
    //---------------------------------------------------------------
    public int InsertSong(string title, Artist artist, Album album)
    {
        return Database.NExec(
            format(
                "INSERT INTO songs(album_id, artist_id, title)
                 VALUES(%d, %d, '%s');", album.GetId(), artist.GetId(), title
            )
        );
    }

    public Song GetSong(string title)
    {
        return Database.RExec(
            "SELECT * FROM songs WHERE title='" ~ title ~ "';"
        ).firstRow().bind!Song();
    }

    public Song[] GetAllSongs()
    {
        return Database.RExec("SELECT * FROM songs;").bind!Song();
    }

    //---------------------------------------------------------------
    // Genres - Last modified 2021-10-29
    //---------------------------------------------------------------
    public int InsertGenre(string name, string description = "None")
    {
        return Database.NExec(
            format(
                "INSERT INTO genres(name, description)
                 VALUES('%s', '%s');", name, description
            )
        );
    }

    public Genre GetGenre(string name)
    {
        return Database.RExec(
            "SELECT * FROM genres WHERE name='" ~ name ~ "';"
        ).firstRow().bind!Genre();
    }

    public Genre[] GetAllGenres()
    {
        return Database.RExec("SELECT * FROM genres;").bind!Genre();
    }

}