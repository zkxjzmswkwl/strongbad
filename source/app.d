import std.stdio;

import hunt.database;
import orm;
import global;

void main()
{
	WQueries *Query = WGlobal.GetQueries();
	Query.InsertUser("Test_Na4e", "test1", "8@b.com");

	foreach (Row row; Query.GetAllUsers())
	{
		writeln(row);
	}
}