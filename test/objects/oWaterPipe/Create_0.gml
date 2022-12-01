/// @description Insert description here
// You can write your code in this editor

dir = -1;

/// @description
played = 0;

s_emit = audio_emitter_create();
audio_max_distance_to_be_heard = 900;
audio_starts_to_drop_at = 400;

//Set the model to falloff based on dsitance from listner
audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(s_emit, x, y, 0);
audio_emitter_falloff(s_emit, audio_starts_to_drop_at, audio_max_distance_to_be_heard, 1);

roomname = "";