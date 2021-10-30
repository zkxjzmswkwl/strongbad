module orm.db;

import std.stdio;
import std.format;
import hunt.database;

// This is not an orm. I just want it to be eventually.
class WDatabase 
{
    private Database db;

    this(string user, string pwd, string ip, string port, string dbName)
    {
        this.db = new Database(format(
            "postgresql://%s:%s:@%s:%s/%s?charset=utf-8",
            user, pwd, ip, port, dbName));
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