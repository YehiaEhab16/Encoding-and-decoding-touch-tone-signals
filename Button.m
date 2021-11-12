function Button(Num, Valid,handles)

global key_flag;
global num_flag;
global num_val;
global GeneratedSignal;

if(key_flag==0)
    if(Valid)
        key_flag=1;
        num_flag=Num;
        num_val=Num;
        i=num2str(num_val+1-num_flag);
        i=strcat('Choose key #',i);
        set(handles.Disp, 'String', i);
    end
else
    if(num_flag~=0)
        num_flag=num_flag-1;
        Encode(Num);
        if(num_flag==0)
            set(handles.Disp, 'String', 'Press next to view Freq. Res. of filters');
            Plot(handles);
            sound(GeneratedSignal);
        else
            i=num2str(num_val+1-num_flag);
            i=strcat('Choose key #',i);
            set(handles.Disp, 'String', i);
        end
    end
end

end
