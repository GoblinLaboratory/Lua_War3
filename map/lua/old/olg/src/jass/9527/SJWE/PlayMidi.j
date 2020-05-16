#ifndef PlayMidiIncluded
#define PlayMidiIncluded
library PlayMidi
function PlayMidi takes string s returns nothing
    local sound midi=CreateMIDISound(s,1,1)
    call StartSound(midi)
    call StopSound(midi,false,true)
endfunction
endlibrary
#endif
