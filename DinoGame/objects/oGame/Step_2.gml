if (instance_exists(oBird))
{
	if (oBird.state == scrBirdPlaying)
	{
		with(oObstacles)
		{
			if (oBird.x > x)
			{
				other.pontuation += pointsToPlayer;	
				pointsToPlayer = 0;
			}
		}
	}
}
{
	if (pontuation > highscore)
	{
		highscore = pontuation;	
	}
}