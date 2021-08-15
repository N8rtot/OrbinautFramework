function SpecialMainStartup()
{
	// Turn screen white
	fade_perform(FadeTo, FadeWhite, 0);
	
	// If coming back from special stage, set offsets and play music
	if Game.SpecialState
	{
		Offset[0]  = -330;
		Offset[1]  =  330;
		Offset[2]  =  24;
		Offset[3]  =  0;
		Offset[4]  =  300;
		Offset[5]  =  330;
		RenderFlag = -1;
		
		fade_perform(FadeFrom, FadeWhite, 1);
		audio_bgm_play(PriorityLow, ActClearMusic, noone);
	}
	
	// Else redirect to special stage
	else switch Game.Emeralds
	{
		/* Add redirection here */
		default:
			room_goto(SpecialStage1);
		break;
	}
}