module orm.queries;

import std.format;
import hunt.database;
import global;

class WQueries
{
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
        return WGlobal.GetDatabase().NExec(built);
    }

    public RowSet GetAllUsers()
    {
        return WGlobal.GetDatabase().RExec("SELECT * FROM users;");
    }
}