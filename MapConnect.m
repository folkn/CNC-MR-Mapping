% clear VNA
clear S

VNA_ADDR = 'USB0::0x0957::0x0D09::MY46315059::0::INSTR';
CNC_PORT = 'COM3';
CNC_BAUD = 250000;

SAFE_BOUNDARY = [0 0 1 ; 200 200 220];
ZERO_OFFSET = [0 0 0];


% VNA = VNA_connect(VNA_ADDR);
S = serialport(CNC_PORT, CNC_BAUD);