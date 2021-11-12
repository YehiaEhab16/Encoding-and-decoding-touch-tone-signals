function Plot2(handles)

global plot2_flag;
global p1;
global p2;

switch plot2_flag
    case 0
        fb=1209;
        set(handles.Disp, 'String', 'Filter #1');
    case 1
        fb=1336;
        set(handles.Disp, 'String', 'Filter #2');
    case 2
        fb=1477;
        set(handles.Disp, 'String', 'Filter #3');
    case 3
        fb=1633;
        set(handles.Disp, 'String', 'Filter #4');
    case 4
        fb=697;
        set(handles.Disp, 'String', 'Filter #5');
    case 5
        fb=770;
        set(handles.Disp, 'String', 'Filter #6');
    case 6
        fb=852;
        set(handles.Disp, 'String', 'Filter #7');
    case 7
        fb=941;
        set(handles.Disp, 'String', 'Filter #8, press next to decode');
    otherwise
        Decode(handles);
        plot2_flag=0;
        return;
        
end

fs=8000;
% Constructing band pass filter
L=40;
n=0:L-1;
beta=1/max(abs(fftshift(fft(cos(2*pi*fb*n/fs))))); %Ensuring that the maximum value of the frequency response will be equal to one

h_n = beta * cos(2*pi*fb*n/fs);
h_f = abs(fftshift(fft(h_n)));

fvec=linspace(-fs/2,fs/2,length(h_n));  

axes(handles.axes1);
   
delete(p1);
p1=plot(fvec,h_f);
str = strcat('Frequency Response "L=40", Freq = ',num2str(fb));
set(handles.axes1_tx, 'String', str);

L=80;
n=0:L-1;
beta=1/max(abs(fftshift(fft(cos(2*pi*fb*n/fs))))); %Ensuring that the maximum value of the frequency response will be equal to one

h_n = beta * cos(2*pi*fb*n/fs);
h_f = abs(fftshift(fft(h_n)));

fvec=linspace(-fs/2,fs/2,length(h_n));

axes(handles.axes2);
    
delete(p2);
p2=plot(fvec,h_f);
str = strcat('Frequency Response "L=80", Freq = ',num2str(fb));
set(handles.axes2_tx, 'String', str);

plot2_flag=plot2_flag+1;

end
