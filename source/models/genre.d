module models.genre;

class Genre
{
    private int     genre_id;
    private string  name; 
    private string  description;

    public int GetId()              { return genre_id;    }
    public string GetName()         { return name;        }
    public string GetDescription()  { return description; }
}

/*
CREATE TABLE genres(genre_id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR(50) NOT NULL UNIQUE, description VARCHAR(1000), PRIMARY KEY(genre_id));
*/