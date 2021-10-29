module global;

import orm;

static class WGlobal 
{
    public static WQueries      wQ;
    public static WDatabase     wDb;

    public static WDatabase * GetDatabase()
    {
        if (this.wDb !is null)
        {
            return &wDb;
        }
        else
        {
            // TODO: These should be fetched from environment variables.
            wDb = new WDatabase("devtest", "testdev123123", "localhost", "5432", "wiltdev");
            return &wDb;
        }
    }

    public static WQueries * GetQueries()
    {
        if (this.wQ !is null)
        {
            return &wQ;
        }
        else
        {
            wQ = new WQueries();
            return &wQ;
        }
    }
}

