module models.user;

import std.datetime.date;

class User
{
    private int     user_id;
    private string  name;
    private string  email;
    private string  password;
    private Date    date_joined;

    public int    GetId()           { return user_id;       }
    public string GetName()         { return name;          }
    public string GetEmail()        { return email;         }
    public string GetPassword()     { return password;      }    // This is dodgy. We don't even need this yes?
    public Date   GetDateJoined()   { return date_joined;   }
}

/*
CREATE TABLE users(user_id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR(100) NOT NULL UNIQUE, password VARCHAR(100) NOT NULL, email VARCHAR(100) NOT NULL UNIQUE, PRIMARY KEY(user_id));
*/