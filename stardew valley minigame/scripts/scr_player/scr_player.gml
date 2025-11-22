// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_playerInputs()
{

}



//currentItem vai ser uma string, se tornara uma struct que sera guardada
//no currentBuffs apos o metodo
function scr_addPlayerBuff(_buff = undefined)
{
	var _buffsList = self.currentBuffs;
		
	
	if (_buff == undefined)
		return;
	
	for(var _i = 0, _sizeOfList = ds_list_size(_buffsList); _i < _sizeOfList; _i++)
	{
		//caso encontre outra versão do _buff, elimina e deixa o novo buff no lugar
		if (_buffsList[| _i].item == _buff.item)
		{
			_buffsList[| _i].destructMethod();
			ds_list_delete(_buffsList, _i); 
			_sizeOfList--;
		}
	}
	
	
	ds_list_add(_buffsList, _buff);
	_buff.creationMethod();
	
	if (self.currentItem != undefined && _buff == self.currentItem)
		self.currentItem = undefined;
}

#region updates
function updatePlayerBuffs()
{
	var _numOfBuffs = ds_list_size(currentBuffs);
	
	for(var _i = 0; _i < _numOfBuffs; _i++)
	{
		var _currentBuff = self.currentBuffs[| _i];

		//elimina buff da lista de buffs ativos
		if (_currentBuff.effectTime == -1)
		{
			_currentBuff.destructMethod();
			ds_list_delete(self.currentBuffs, _i);
			_numOfBuffs--;
		}
		
		_currentBuff.updateMethod();
	}
}

 function scr_updatePlayerSts(_spd)
{
	other._spd = (_spd != undefined) ? _spd : other.spd;
}

#endregion


#region gun methods

//vai considerar possibilidade de ter mais de um buff ativo

#endregion
