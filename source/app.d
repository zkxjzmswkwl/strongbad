import std.stdio;
import std.format;

import hunt.database;

import models;
import orm;
import global;

void main()
{
	WQueries *Query = WGlobal.GetQueries();

	Query.InsertUser("Carter", "testpass", "carter@test.com");
	Query.InsertArtist("blink-182");
	Query.InsertArtist("Burial");
	Query.InsertArtist("Кино");
	Artist blink  = Query.GetArtist("blink-182");
	Artist burial = Query.GetArtist("Burial");
	Artist kino   = Query.GetArtist("Кино");
	Query.InsertAlbum("Neighborhoods", blink);
	Query.InsertAlbum("Untrue", burial);
	Query.InsertAlbum("Звезда по имени Солнце", kino);
	Album neighborhoods = Query.GetAlbum("Neighborhoods");
	Album untrue        = Query.GetAlbum("Untrue");
	Album calledthesun  = Query.GetAlbum("Звезда по имени Солнце");
	Query.InsertSong("Wishing Well",  blink,  neighborhoods);
	Query.InsertSong("Пачка сигарет", kino,   calledthesun);
	Query.InsertSong("Archangel",     burial, untrue);

	Query.InsertGenre("Pop-Punk", "Pop-punk (or punk-pop) is a rock music genre that combines elements of punk rock with pop and power pop. It is defined for its emphasis on classic pop songcraft, as well as adolescent and anti-suburbia themes, and is distinguished from other punk-variant genres by drawing more heavily from 1960s bands such as the Beatles, the Kinks, and the Beach Boys. The genre has evolved throughout its history, absorbing elements from new wave, college rock, ska, rap, emo, and boy bands. It is sometimes considered interchangeable with power pop and skate punk.");
	Genre[] genres = Query.GetAllGenres();

	Artist[] artists = Query.GetAllArtists();
	Album[]  albums  = Query.GetAllAlbums();
	Song[]   songs   = Query.GetAllSongs();
	User[]   users   = Query.GetAllUsers();

	Song archangel = Query.GetSong("Archangel");
	writeln(archangel.GetTitle() ~ ":" ~ archangel.GetArtist().GetName());

	writeln("---------------------Users---------------------");
	foreach (User user; users)
	{
		writeln(format("User %s with email of %s", user.GetName(), user.GetEmail()));
	}
	writeln("--------------------Genres---------------------");
	foreach (Genre genre; genres)
	{
		writeln(genre.GetName());
	}
	writeln("--------------------Artists--------------------");
	foreach (Artist artist; artists)
	{
		writeln(format("Artist %s with id of %d", artist.GetName(), artist.GetId()));
	}
	writeln("--------------------Albums---------------------");
	foreach (Album album; albums)
	{
		writeln(format("Album %s with id of %d", album.GetTitle(), album.GetId()));
	}
	writeln("--------------------Songs----------------------");
	foreach (Song song; songs)
	{
		writeln(format("Song %s with id of %d", song.GetTitle(), song.GetId()));
	}
}