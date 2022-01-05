% MapConnect



% VNA = visadev(VNA_ADDR);

% S = serialport(CNC_PORT, CNC_BAUD);

% Home X Y
writeline(S, "G28 XY")

% generate grid
x = 0:2.5:70;
y = 0:2.5:70;
z = 1.5;
[X,Y,Z] = meshgrid(x,y,z);
points = [X(:), Y(:), Z(:)];

freq = VNA_GetFreq(VNA);
SParam = zeros(size(points,1), size(freq, 1));

for i = 1:size(points,1)
    writeline(S, append("G0 X", num2str(points(i,1)), " Y", num2str(points(i,2)))  );
    disp(append( datestr(now,'HH:MM:SS.FFF'), " / TX: G0 X", num2str(points(i,1)), " Y", num2str(points(i,2)), " / RX:", readline(S) ));
    SParam(i, :) = VNA_GetData(VNA)';
    pause(1)
end

disp("Done")


