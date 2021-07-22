function PlayerAnimate()
{	
	// Get the current character
	switch CharacterID
	{	
		// Sonic animations
		case CharSonic:
		{
			if !SuperState
			{
				switch Animation
				{
					case AnimIdle:
						animation_play(spr_sonic_idle, 24, 15);
					break;
					case AnimWalk:
						animation_play(spr_sonic_walk, round(max(1, 8 - (PeeloutRev == -1 ? abs(Inertia) : PeeloutRev div 3))), 1);
					break;
					case AnimRun: 
						animation_play(spr_sonic_run,  round(max(1, 8 - (PeeloutRev == -1 ? abs(Inertia) : PeeloutRev div 3))), 1);
					break;
					case AnimPeelout: 
						animation_play(spr_sonic_peelout, 1, 1);
					break;
					case AnimRoll:
						animation_play(spr_sonic_roll, round(max(1, 4 - abs(Inertia))), 1);
					break;
					case AnimSpindash:
						animation_play(spr_sonic_spindash, 1, 1); 
					break;
					case AnimCrouch:
						animation_play(spr_sonic_crouch, 4, 2);
					break;
					case AnimLookup:
						animation_play(spr_sonic_lookup, 4, 2);
					break;
					case AnimSkid:
						animation_play(spr_sonic_skid, 6, 3);
					break;
					case AnimPush:
						animation_play(spr_sonic_push, 32, 1);
					break;
					case AnimHurt:
						animation_play(spr_sonic_hurt, 1, 1);
					break;
					case AnimDeath:
						animation_play(spr_sonic_death, 1, 1);
					break;	
					case AnimBalanceFront:
						animation_play(spr_sonic_balance_front, 16, 1);
					break;
					case AnimBalanceBack:
						animation_play(spr_sonic_balance_back, 16, 1);
					break;
					case AnimSpring:
						animation_play(spr_sonic_spring, 1, 1);
					break;
					case AnimActEnd:
						animation_play(spr_sonic_actend, 3, 21);
					break;
					case AnimDrown:
						animation_play(spr_sonic_drown, 1, 1);
					break;
				}
			}
			else
			{
				switch Animation
				{
					case AnimTransform:
						animation_play(spr_supersonic_transform, 3, 8);
					break;
					case AnimIdle:
						animation_play(spr_supersonic_idle, 6, 1);
					break;
					case AnimWalk:
						animation_play(spr_supersonic_walk, round(max(1, 8 - (PeeloutRev == -1 ? abs(Inertia) : PeeloutRev div 3))), 1);
					break;
					case AnimRun: 
						animation_play(spr_supersonic_fly,  round(max(1, 8 - (PeeloutRev == -1 ? abs(Inertia) : PeeloutRev div 3))), 1);
					break;
					case AnimPeelout: 
						animation_play(spr_supersonic_fly, 1, 1);
					break;
					case AnimRoll:
						animation_play(spr_sonic_roll, round(max(1, 4 - abs(Inertia))), 1);
					break;
					case AnimCrouch:
						animation_play(spr_supersonic_crouch, 4, 2);
					break;
					case AnimLookup:
						animation_play(spr_supersonic_lookup, 4, 2);
					break;
					case AnimSkid:
						animation_play(spr_sonic_skid, 6, 3);
					break;
					case AnimPush:
						animation_play(spr_sonic_push, 32, 1);
					break;
					case AnimBalanceFront:
						animation_play(spr_sonic_balance_front, 16, 1);
					break;
					case AnimBalanceBack:
						animation_play(spr_sonic_balance_back, 16, 1);
					break;
					case AnimSpring:
						animation_play(spr_sonic_spring, 1, 1);
					break;
				}
			}
		}
		break;
		
		// Tails animations
		case CharTails:
		{
			switch Animation
			{
				case AnimIdle: 
					animation_play(spr_tails_idle, 1, 1); 
				break;
				case AnimWalk:
					animation_play(spr_tails_walk, round(max(1, 8 - abs(Inertia))), 1);
				break;
				case AnimRun: 
					animation_play(spr_tails_run,  round(max(1, 8 - abs(Inertia))), 1);
				break;
				case AnimPeelout: 
					animation_play(spr_tails_dash, 1, 1);
				break;
				case AnimRoll:
					animation_play(spr_tails_roll, 2, 1);
				break;
				case AnimSpindash:
					animation_play(spr_tails_spindash, 1, 1); 
				break;
				case AnimCrouch:
					animation_play(spr_tails_crouch, 4, 1);
				break;
				case AnimLookup:
					animation_play(spr_tails_lookup, 4, 1);
				break;
				case AnimSkid:
					animation_play(spr_tails_skid, 6, 1);
				break;
				case AnimFly:
					animation_play(spr_tails_fly, 1, 1);
				break;
				case AnimFlyTired:
					animation_play(spr_tails_fly_tired, 8, 1);
				break;
				case AnimSwim:
					animation_play(spr_tails_swim, Ysp < 0 ? 4 : 8, 1);
				break;
				case AnimSwimTired:
					animation_play(spr_tails_swim_tired, 8, 1)
				break;
				case AnimHurt:
					animation_play(spr_tails_hurt, 1, 1);
				break;
				case AnimDeath:
				case AnimDrown:
					animation_play(spr_tails_death, 1, 1);
				break;
				case AnimSpring:
					animation_play(spr_tails_spring, 2, 1);
				break;
				case AnimPush:
					animation_play(spr_tails_push, 32, 1);
				break;
				case AnimActEnd:
					animation_play(spr_tails_actend, 8, 2);
				break;
				case AnimBalanceBack:
					animation_play(spr_tails_balance_back, 20, 1);
				break;
				case AnimBalanceFront:
					animation_play(spr_tails_balance_front, 20, 1);
				break;
			}	
		}
		break;

		// Knuckles animations
		case CharKnuckles:
		{
			switch Animation
			{
				case AnimIdle: 
					animation_play(spr_knuckles_idle, 1, 1); 
				break;
				case AnimWalk: 
					animation_play(spr_knuckles_walk, round(max(1, 8 - abs(Inertia))), 1);
				break;
				case AnimRun: 
					animation_play(spr_knuckles_run,  round(max(1, 8 - abs(Inertia))), 1);
				break;
				case AnimRoll:
					animation_play(spr_knuckles_roll, round(max(1, 4 - abs(Inertia))), 1);
				break;
				case AnimSpindash:
					animation_play(spr_knuckles_spindash, 1, 1); 
				break;
				case AnimCrouch:
					animation_play(spr_knuckles_crouch, 4, 2);
				break;
				case AnimLookup:
					animation_play(spr_knuckles_lookup, 4, 2);
				break;
				case AnimSkid:
					animation_play(spr_knuckles_skid, 4, 3);
				break;
				case AnimHurt:
					animation_play(spr_knuckles_hurt, 1, 1);
				break;
				case AnimDeath:
					animation_play(spr_knuckles_death, 1, 1);
				break;
				case AnimGlide:
					/* Handled by PlayerCheckGlide() */
				break;
				case AnimGlideDrop:
					animation_play(spr_knuckles_glidedrop, 6, 2);
				break;
				case AnimDropStand:
					animation_play(spr_knuckles_dropstand, 20, 2);
				break;
				case AnimGlideSlide:
					animation_play(spr_knuckles_glideslide, 1, 1);
				break;
				case AnimGlideStand:
					animation_play(spr_knuckles_glidestand, 15, 2);
				break;
				case AnimClimb:
					animation_play(spr_knuckles_climb, -sign(Ysp) * 4, 1);
				break;
				case AnimClimbering:
					animation_play(spr_knuckles_climbering, 6, 4);
				break;
				case AnimPush:
					animation_play(spr_knuckles_push, 6, 1);
				break;
				case AnimSpring:
					animation_play(spr_knuckles_spring, 1, 1);
				break;
				case AnimBalanceFront:
					animation_play(spr_knuckles_balance_front, 4, 34);
				break;
				case AnimBalanceBack:
					animation_play(spr_knuckles_balance_back, 4, 34);
				break;
			}
		}
		break;
	}
}