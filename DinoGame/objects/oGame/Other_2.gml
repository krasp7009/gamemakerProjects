if (file_exists("savedGame.save"))
{
	var _buffer = buffer_load("savedGame.save");
	var _jsonText = buffer_read(_buffer, buffer_string);
	var _structWithSavedGame = json_parse(_jsonText);
	buffer_delete(_buffer);
	
	isWhite = _structWithSavedGame.isThemeColorWhite;
	highscore = _structWithSavedGame.highscore;
	
	if (isWhite)
		addRGB = 0;
	else
		addRGB = 1;
	
}
