isMB1Pressed = mouse_check_button_pressed(mb_left);
isMB1Released = mouse_check_button_released(mb_left);
isMB1Pressing = mouse_check_button(mb_left);


if (keyboard_check_pressed(vk_enter))
{
	scrArrangeCards(gameDeck);	
}

if (keyboard_check_pressed(vk_backspace))
{
	gameDeck.giveCardsPaciencia();	
}

if (mouse_check_button_pressed(mb_right) && position_meeting(gameMouse.x, gameMouse.y, laneForHoldingCardsPaciencia.returnTopCard()))
{
	if (keyboard_check(vk_shift))	
	{
		repeat(array_length(laneForHoldingCardsPaciencia.cardsOnStack))
		{
			scrPassCardFromStackToStack(laneForHoldingCardsPaciencia, gameDeck, laneForHoldingCardsPaciencia.returnTopCard());
		}
	}
	else
	{
		scrPassCardFromStackToStack(laneForHoldingCardsPaciencia, gameDeck, laneForHoldingCardsPaciencia.returnTopCard());
	}
	
	scrArrangeCards(gameDeck);
}


if (keyboard_check_pressed(vk_escape))
{
	game_restart();	
}