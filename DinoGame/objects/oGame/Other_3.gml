//cheks if already saved
var _alredySavedGame = false;
var _structWithSavedGame = undefined;

if (file_exists("savedGame.save"))
{
	var _buffer = buffer_load("savedGame.save");
	var _jsonText = buffer_read(_buffer, buffer_string);
	_alredySavedGame = true;
	_structWithSavedGame = json_parse(_jsonText);
	buffer_delete(_buffer);
}

var _newHighscore;
if (_alredySavedGame)
{
	_newHighscore = (_structWithSavedGame.highscore > highscore) 
	? _structWithSavedGame.highscore
	: highscore;
}
else
{
	_newHighscore = highscore;	
}


var _structWithImportantThings = 
{
	isThemeColorWhite : isWhite,
	highscore : _newHighscore	
};

var _jsonText = json_stringify(_structWithImportantThings);
var _buffer = buffer_create(string_length(_jsonText) + 1, buffer_fixed, 1);
buffer_write(_buffer, buffer_string, _jsonText);
buffer_save(_buffer, "savedGame.save");
buffer_delete(_buffer);

