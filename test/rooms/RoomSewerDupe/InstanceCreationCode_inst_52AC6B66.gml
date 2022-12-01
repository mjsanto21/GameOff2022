s_emit1 = audio_emitter_create();
audio_max_distance_to_be_heard = 700;
audio_starts_to_drop_at = 300;

//Set the model to falloff based on dsitance from listner
audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(s_emit1, x, y, 0);
audio_emitter_falloff(s_emit1, audio_starts_to_drop_at, audio_max_distance_to_be_heard, 1);
audio_play_sound_on(s_emit1, seGearWhir, true, 1, 0.3);
