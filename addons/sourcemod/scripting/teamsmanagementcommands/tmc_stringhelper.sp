getTeamNameConditionalLowerCase(any:teamId, String:szBuffer[ ], any:size)
{
	//Team name
	GetTeamName( teamId, szBuffer, size );
	
	//Lower cases
	if ( strlen( szBuffer ) > 3 ) //4+ chars = lower
		for ( new i = 1; i < size; ++i )
			szBuffer[ i ] = CharToLower( szBuffer[ i ] );
}
//crappy way to see if the string is already in the array
//since there is usually not that many clans in a server I guess its fine
bool:stringExistInArray(String:strArray[][], sizeArray, String:szString[])
{
	for ( new i; i < sizeArray; ++i )
	{
		if ( StrEqual( strArray[ i ], szString ) )
			return true;
	}
	return false;
}