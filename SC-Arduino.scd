// Multiple inputs from an Arduino

/*
Recieves 6 streams of values from Arduino at usb address. The streams are encoded with 
an ASCII char in the Arduino script, which is then filtered in the Supercollider script. 

Values are stored in global variables that can carry over and be used in your project. 
Variables are:
	~val0 ... ~val5
*/
s.boot;

SerialPort.devices;

~port = SerialPort.new("/dev/cu.usbmodem141301", 115200);

(
~intArray = [ ]; //
Tdef(\readValues, {
	loop{
		~ascii = ~port.read;

		case
		{~ascii == nil} {nil}

		{~ascii.asAscii.isDecDigit}
		{~intArray = ~intArray.add(~ascii.asAscii.digit)}

		{~ascii.asAscii == $a}
		{
			~val0 = ~intArray.convertDigits;
			~intArray = [ ]; // Array is emptied after being decoded and saved in new variable. 
		}

		{~ascii.asAscii == $b}
		{
			~val1 = ~intArray.convertDigits;
			~intArray = [ ];
		}

		{~ascii.asAscii == $c}
		{
			~val2 = ~intArray.convertDigits;
			~intArray = [ ];
		}

		{~ascii.asAscii == $d}
		{
			~val3 = ~intArray.convertDigits;
			~intArray = [ ];
		}

		{~ascii.asAscii == $e}
		{
			~val4 = ~intArray.convertDigits;
			~intArray = [ ];
		}

		{~ascii.asAscii == $f}
		{
			~val5 = ~intArray.convertDigits;
			~intArray = [ ];
		}

		{true} {nil}
	}
}).play
);

(
~postval=Tdef(\postValue, { // Function for posting values in post window. 
	{
	~val0.postln;
	~val1.postln;
	~val2.postln;
	~val3.postln;
	~val4.postln;
	~val5.postln;
	" ".postln;
	0.1.wait;
}.loop
}
);
);

~postval.play;
~postval.stop;
