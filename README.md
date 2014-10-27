arduino-audioToMidiClock
========================

Audio Pulses to Midi Clock using Arduino

Send short audio pulses (need to be a single spike, preferrably a few milliseconds long). The clock input should get 24 clock pulses every quarter note. The sync input should get one pulse at the downbeat of every bar. This should create a steady midi clock on the midi port. Use the button to start/stop any connected midi gear in sync.
