module orm.db;

import std.stdio;
import hunt.database;

// This is not an orm. I just want it to be eventually.
class WDatabase 
{
    private Database db;

    this(string user, string pwd, string ip, string port, string db_name)
    {
        string conn = "postgresql://";
        // I realize this is dumb.
        conn ~= user ~ ":" ~ pwd ~ ":@" ~ ip ~ ":" ~ port ~ "/" ~ db_name ~ "?charset=utf-8";

        this.db = new Database(conn);
    }

    public int NExec(string statement)
    {
        return this.db.execute(statement);
    }

    public RowSet RExec(string sql)
    {
        return db.query(sql);
    }

}