function Plot(handles)

global key_flag;
global GeneratedSignal;
global num_val;
global plot_flag;
global p1;
global p2;

fs=8000;

set(handles.Num_nd ,'enable' ,'on');
t=linspace(0,num_val,fs*num_val);
axes(handles.axes1);
if(plot_flag)
    delete(p1);
end
p1=plot(t,GeneratedSignal);
set(handles.axes1_tx, 'String', 'Signal in Time Domain');   

%plotting signal in frequency domain
N=length(GeneratedSignal);                                     %Number of samples
GeneratedSignal_frequency=abs(fftshift(fft(GeneratedSignal))); %transfer to frequency domain
fvec=linspace(-fs/2,fs/2,N);                                   %frequency range
axes(handles.axes2);
if(plot_flag)
    delete(p2);
end
p2=plot(fvec,GeneratedSignal_frequency);
set(handles.axes2_tx, 'String', 'Signal in Frequency Domain');

plot_flag=1;

end
