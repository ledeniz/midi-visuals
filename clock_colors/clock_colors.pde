import wellen.*; 

/*
 * this example demonstrates how to use a beat triggered by an external MIDI beat clock ( e.g generated by an
 * external MIDI device or an internal MIDI application ).
 */

String MidiInterface = "Elektron Model:Samples";

//////////////

int mColor;

BeatMIDI mBeatMIDI;

void setup() {
    fullScreen();
    noCursor();
    
    Wellen.dumpMidiInputDevices();
    mBeatMIDI = BeatMIDI.start(this, MidiInterface);
}

void draw() {
    background(mBeatMIDI.running() ? mColor : 0);
}

void beat(int pBeat) {
    /* MIDI clock runs at 24 pulses per quarter note (PPQ), therefore `pBeat % 12` is triggers eighth note. */
    if (pBeat % 12 == 6) {
        mColor = color(random(127, 255),
                       random(127, 255),
                       random(127, 255));
        int mOffset = 4 * ((pBeat / 24) % 8);
        //System.out.println(mBeatMIDI.bpm());
    }
}
