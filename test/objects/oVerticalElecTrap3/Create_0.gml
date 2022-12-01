/// @description

on_timer_initial = 200;
on_timer = 0;
played = 0;
elec_on = 0;

s_emit = audio_emitter_create();
audio_max_distance_to_be_heard = 700;
audio_starts_to_drop_at = 300;

//Set the model to falloff based on dsitance from listner
audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_position(s_emit, x, y, 0);
audio_emitter_falloff(s_emit, audio_starts_to_drop_at, audio_max_distance_to_be_heard, 1);

