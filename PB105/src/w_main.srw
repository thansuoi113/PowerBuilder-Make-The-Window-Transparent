$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type st_value from statictext within w_main
end type
type st_1 from statictext within w_main
end type
type htb_1 from htrackbar within w_main
end type
end forward

global type w_main from window
integer width = 1769
integer height = 604
boolean titlebar = true
string title = "Make The Window Transparent"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_value st_value
st_1 st_1
htb_1 htb_1
end type
global w_main w_main

type prototypes
Function Long GetWindowLongA(Long hwnd,Long nOffset) Library "user32.dll"
Function Long SetWindowLongA(Long hwnd,Long nIndex,Long dwNewLong) Library "user32.dll"
Function Long SetLayeredWindowAttributes(Long hwnd,Long crKey,Long bAlpha,Long dwFlags) Library "user32.dll"


end prototypes
type variables
CONSTANT long GWL_EXSTYLE = (-20)
CONSTANT long WS_EX_LAYERED = 524288
CONSTANT long LWA_COLORKEY = 1
CONSTANT long LWA_ALPHA = 2
CONSTANT long ULW_COLORKEY = 1
CONSTANT long ULW_ALPHA = 2
CONSTANT long ULW_OPAQUE = 4
Long Value
end variables
on w_main.create
this.st_value=create st_value
this.st_1=create st_1
this.htb_1=create htb_1
this.Control[]={this.st_value,&
this.st_1,&
this.htb_1}
end on

on w_main.destroy
destroy(this.st_value)
destroy(this.st_1)
destroy(this.htb_1)
end on

event open;htb_1.position = 50
st_value.text = string(50)
end event

type st_value from statictext within w_main
integer x = 366
integer y = 96
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "100"
boolean focusrectangle = false
end type

type st_1 from statictext within w_main
integer x = 183
integer y = 96
integer width = 219
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Value:"
boolean focusrectangle = false
end type

type htb_1 from htrackbar within w_main
integer x = 146
integer y = 192
integer width = 1426
integer height = 128
integer maxposition = 100
integer tickfrequency = 10
end type

event moved;long HWND, ll_value,rtn
HWND =handle(parent)
ll_value = scrollpos
rtn = GetWindowLongA(hWnd, GWL_EXSTYLE)
rtn = WS_EX_LAYERED
rtn = SetWindowLonga(HWND, GWL_EXSTYLE, rtn)
SetLayeredWindowAttributes(HWND, 0, (255 * ll_value) / 100, LWA_ALPHA)

st_value.text = string(scrollpos)
end event

