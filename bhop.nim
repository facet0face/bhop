from os import sleep
import winim/lean

const key = 0x20
let input_scan = WORD MapVirtualKey(key, 0)
const input_size = int32 sizeof INPUT

var input_up: INPUT
input_up.type = INPUT_KEYBOARD
input_up.union1.ki.wVk = key
input_up.union1.ki.wScan = input_scan
var input_down: INPUT
input_down.type = INPUT_KEYBOARD
input_down.union1.ki.wVk = key
input_down.union1.ki.wScan = input_scan
input_down.union1.ki.dwFlags = KEYEVENTF_KEYUP

let input_up_addr = addr input_up
let input_down_addr = addr input_down

when isMainModule:
    while true:
        if GetAsyncKeyState(0xA4) != 0:
            SendInput(1, input_up_addr, input_size)
            sleep 1
            SendInput(1, input_down_addr, input_size)
        sleep 1
