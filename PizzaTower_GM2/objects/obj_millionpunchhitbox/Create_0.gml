event_inherited();
dmg = 10;
col_buffer = 0;
col_max = 10;

function player_hurt(_damage, _player)
{
    if (!collisioned && _player.state != states.arena_round)
    {
        col_buffer = col_max;
        SUPER_player_hurt(_damage, _player);
    }
}

