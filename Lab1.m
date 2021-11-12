% Lab1: Encoding and Decoding Touch-Tone Signals
clear;close all;clc;
%% Part1 -> Encoding
disp('----------------Encoding-------------------');
%Frequency table
freq_vec = [1209, 1336, 1477, 1633, 697, 770, 852, 941];

%keypad characters
keypad = ['1' '2' '3' 'A' 'a' ;
          '4' '5' '6' 'B' 'b' ;
          '7' '8' '9' 'C' 'c' ;
          '*' '0' '#' 'D' 'd' ];

while(1)
    Num_keys = input('Enter number of keys to be pressed: ','s'); %Asking for number of keys
    %Ensuring user enters a number
    if ~(isnan(str2double(Num_keys(1))))
        Num_keys = str2double(Num_keys);
        break;
    else
        disp('Wrong Input: You should enter a number');
    end
end

%Varibales to hold the specific frequencies of the pressed key
freq1=0;
freq2=0;

%Sampling frequency
fs=8000;

i=1;
while(i<=Num_keys)
    char = input('Enter desired key: ','s'); %Asking specific key
    
    %Checking for element in keypad
    [row, col]=find(keypad==char(1));
    %Handling if user enters upper or lower case
    if(col==5)
        col=4;
    end
    %Getting the frequency value
    if(size(row,1)==0 || size(col,1)==0)
        i=i-1;
        disp('Wrong Input: You should enter a character from kepad'); %Ensuring user enters a character from keypad
    else
        freq1 = freq_vec(row+4);
        freq2 = freq_vec(col);
    end
    t1=linspace(i-1,i,fs); %defining time period as 1 second for each signal
    %Defining the generated signal
    if i==1
       GeneratedSignal = sin(2*pi*freq1*t1)+sin(2*pi*freq2*t1);
    else
       GeneratedSignal = [GeneratedSignal sin(2*pi*freq1*t1)+sin(2*pi*freq2*t1)];%concatinating with previous signal
    end
    i=i+1;
end

%plotting signal in time domain
t2=linspace(0,Num_keys,fs*Num_keys);
subplot(2,1,1);
plot(t2,GeneratedSignal,'b');
title('Signal in time domain');

%plotting signal in frequency domain
N=length(GeneratedSignal);                                     %Number of samples
GeneratedSignal_frequency=abs(fftshift(fft(GeneratedSignal))); %transfer to frequency domain
fvec=linspace(-fs/2,fs/2,N);                                   %frequency range
subplot(2,1,2);
plot(fvec,GeneratedSignal_frequency,'r');
title('Signal in frequency domain');

%Playing generated sound from signal
sound(GeneratedSignal);


%% Part2 -> Decoding
disp('----------------Decoding-------------------');


%Divide the time signal into short time segments representing individual key presses
for i=0:(Num_keys-1)
    %every segment with one second period
    segment=GeneratedSignal((1+i*fs):((i+1)*fs));
    
    %loop over all the frequencies to bluild a filter for every frequency
    for fb=freq_vec
        if i==0
            figure;
            L=40;
            n=0:L-1;
            beta=1/max(abs(fftshift(fft(cos(2*pi*fb*n/fs))))); %Ensuring that the maximum value of the frequency response will be equal to one
            %filter equation in time domain
            h_n = beta * cos(2*pi*fb*n/fs);
            %filter equation in frequency domain
            h_f = abs(fftshift(fft(h_n)));
            
            fvec=linspace(-fs/2,fs/2,length(h_n));  %frequency range
            subplot(2,1,1);
            plot(fvec,h_f,'b');
            str = strcat('Frequency Response "L=40" , Freq = ',num2str(fb));
            title(str);
        end
        L=80;
        n=0:L-1;
        beta=1/max(abs(fftshift(fft(cos(2*pi*fb*n/fs))))); %Ensuring that the maximum value of the frequency response will be equal to one
        %filter equation in time domain
        h_n = beta * cos(2*pi*fb*n/fs);
        %filter equation in frequency domain
        h_f = abs(fftshift(fft(h_n)));
        
        fvec=linspace(-fs/2,fs/2,length(h_n));  %frequency range
        if i==0
            subplot(2,1,2);
            plot(fvec,h_f,'r');
            str = strcat('Frequency Response "L=80" , Freq = ',num2str(fb));
            title(str);
        end
        
        
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
    
    [~,index] = max(filter_bank_freq);   %getting index of max element
    freq_decode(1)=freq_vec(index);      %saving frequency corresponding to that index
    filter_bank_freq(index)=0;           %setting it to zero in the output vector to get the second elemnt
    [~,index] = max(filter_bank_freq);   %getting index of second max element
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

disp('Detected Keys After Decoding: ');
for i=1:length(detected_keys)
    disp(detected_keys(i))
end
