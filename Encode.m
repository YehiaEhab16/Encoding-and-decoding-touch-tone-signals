function Encode(Num)

global GeneratedSignal;
global num_val;
global num_flag;

%Frequency table
freq_vec = [1209, 1336, 1477, 1633, 697, 770, 852, 941];

%keypad characters
keypad = ['1' '2' '3' 'A' ; '4' '5' '6' 'B' ; '7' '8' '9' 'C' ; '*' '0' '#' 'D' ];

%Varibales to hold the specific frequencies of the pressed key
freq1=0;
freq2=0;

%Sampling frequency
fs=8000;

if(Num>0 || Num <10)
    Num = num2str(Num);
end

%Checking for element in keypad
[row, col]=find(keypad==Num);

%Getting the frequency value
freq1 = freq_vec(row+4);
freq2 = freq_vec(col);
i=num_val-num_flag;
t=linspace(i-1,i,fs); %defining time period as 1 second for each signal
%Defining the generated signal
if i==1
    GeneratedSignal = sin(2*pi*freq1*t)+sin(2*pi*freq2*t);
else
    GeneratedSignal = [GeneratedSignal sin(2*pi*freq1*t)+sin(2*pi*freq2*t)];%concatinating with previous signal
end

end
