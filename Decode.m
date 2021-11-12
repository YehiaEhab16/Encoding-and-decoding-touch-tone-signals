function Decode(handles)

global GeneratedSignal;
global num_val;

Plot(handles);

freq_vec = [1209, 1336, 1477, 1633, 697, 770, 852, 941];

%keypad characters
keypad = ['1' '2' '3' 'A' 'a' ;
          '4' '5' '6' 'B' 'b' ;
          '7' '8' '9' 'C' 'c' ;
          '*' '0' '#' 'D' 'd' ];

fs=8000;
L=80;
n=0:L-1;

for i=0:(num_val-1)
    %every segment with one second period
    segment=GeneratedSignal((1+i*fs):((i+1)*fs));
    
    for fb=freq_vec
        beta=1/max(abs(fftshift(fft(cos(2*pi*fb*n/fs))))); %Ensuring that the maximum value of the frequency response will be equal to one
        %filter equation in time domain
        h_n = beta * cos(2*pi*fb*n/fs);
        %convolution in time domain = mulitplication in frequecny domain
        out = conv(h_n,segment);
        %add the filter output to the filter bank vector
        if fb==1209
            filter_bank_freq = max(out);
        else
            filter_bank_freq = [filter_bank_freq max(out)];%concatinating with previous signal
        end
    end
    
    freq_decode = zeros(1,2); %variable to hold frequencies after decoding
    [~,index] = max(filter_bank_freq); %getting index of max element
    freq_decode(1)=freq_vec(index);      %saving frequency corresponding to that index
    filter_bank_freq(index)=0;           %setting it to zero in the output vector to get the second elemnt
    [~,index] = max(filter_bank_freq); %getting index of second max element
    freq_decode(2)=freq_vec(index);      %saving frequency corresponding to that index
    
    %Remappping the decoded frequencies to the keypad
    col = find(freq_vec==max(freq_decode));
    row = find(freq_vec==min(freq_decode))-4;
    if i==0
        detected_keys = keypad(row,col);
    else
        detected_keys = [detected_keys keypad(row,col)];
    end
end

str = strcat('Detected Keys are: ', strjoin(num2cell(detected_keys),','),'.');
set(handles.Disp, 'String', str);
set(handles.Num_nd, 'Enable', 'Off');
end
