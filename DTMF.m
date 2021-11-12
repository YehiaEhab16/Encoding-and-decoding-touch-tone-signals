function varargout = DTMF(varargin)
% DTMF MATLAB code for DTMF.fig
%      DTMF, by itself, creates a new DTMF or raises the existing
%      singleton*.
%
%      H = DTMF returns the handle to a new DTMF or the handle to
%      the existing singleton*.
%
%      DTMF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DTMF.M with the given input arguments.
%
%      DTMF('Property','Value',...) creates a new DTMF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DTMF_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DTMF_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DTMF

% Last Modified by GUIDE v2.5 08-Nov-2021 02:38:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DTMF_OpeningFcn, ...
                   'gui_OutputFcn',  @DTMF_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before DTMF is made visible.
function DTMF_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DTMF (see VARARGIN)

% Choose default command line output for DTMF
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DTMF wait for user response (see UIRESUME)
% uiwait(handles.figure1);
clc;
global key_flag;
global num_flag;
global GeneratedSignal;
global num_val;
global plot_flag;
global plot2_flag;
global p1;
global p2;
key_flag=0;
num_flag=-1;
num_val=0;
GeneratedSignal=0;
plot_flag=0;   
plot2_flag=0; 
p1=0;
p2=0;

% --- Outputs from this function are returned to the command line.
function varargout = DTMF_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Num_1.
function Num_1_Callback(hObject, eventdata, handles)
% hObject    handle to Num_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Button(1, 1,handles);


% --- Executes on button press in Num_2.
function Num_2_Callback(hObject, eventdata, handles)
% hObject    handle to Num_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Button(2, 1,handles);


% --- Executes on button press in Num_3.
function Num_3_Callback(hObject, eventdata, handles)
% hObject    handle to Num_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Button(3, 1,handles);

% --- Executes on button press in Num_4.
function Num_4_Callback(hObject, eventdata, handles)
% hObject    handle to Num_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Button(4, 1,handles);

% --- Executes on button press in Num_5.
function Num_5_Callback(hObject, eventdata, handles)
% hObject    handle to Num_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Button(5, 1,handles);

% --- Executes on button press in Num_6.
function Num_6_Callback(hObject, eventdata, handles)
% hObject    handle to Num_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Button(6, 1,handles);


% --- Executes on button press in Num_7.
function Num_7_Callback(hObject, eventdata, handles)
% hObject    handle to Num_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Button(7, 1,handles);

% --- Executes on button press in Num_8.
function Num_8_Callback(hObject, eventdata, handles)
% hObject    handle to Num_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Button(8, 1,handles);

% --- Executes on button press in Num_9.
function Num_9_Callback(hObject, eventdata, handles)
% hObject    handle to Num_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Button(9, 1,handles);

% --- Executes on button press in Num_x.
function Num_x_Callback(hObject, eventdata, handles)
% hObject    handle to Num_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Button('*', 0,handles);

% --- Executes on button press in Num_0.
function Num_0_Callback(hObject, eventdata, handles)
% hObject    handle to Num_0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Button('0', 0,handles);


% --- Executes on button press in Num_h.
function Num_h_Callback(hObject, eventdata, handles)
% hObject    handle to Num_h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Button('#', 0,handles);


% --- Executes on button press in Num_A.
function Num_A_Callback(hObject, eventdata, handles)
% hObject    handle to Num_A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Button('A', 0,handles);

% --- Executes on button press in Num_B.
function Num_B_Callback(hObject, eventdata, handles)
% hObject    handle to Num_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Button('B', 0,handles);

% --- Executes on button press in Num_C.
function Num_C_Callback(hObject, eventdata, handles)
% hObject    handle to Num_C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Button('C', 0,handles);


% --- Executes on button press in Num_D.
function Num_D_Callback(hObject, eventdata, handles)
% hObject    handle to Num_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Button('D', 0,handles);

% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global num_val;
global num_flag;
global key_flag;
global plot2_flag;
num_val=0;
num_flag=-1;
key_flag=0;
plot2_flag=0;
set(handles.Num_nd, 'Enable', 'Off');
set(handles.Disp, 'String', 'Choose number of keys');

% --- Executes on button press in Num_nd.
function Num_nd_Callback(hObject, eventdata, handles)
% hObject    handle to Num_nd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Plot2(handles);

% --- Executes on button press in num_ex.
function num_ex_Callback(hObject, eventdata, handles)
% hObject    handle to num_ex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
