import time
import sys
import win32pipe, win32file, pywintypes


def pipe_server():
    print(r'\\.\pipe\Foo');
    print("pipe server")
    count = 0
    pipe = win32pipe.CreateNamedPipe(
        r'\\.\pipe\Foo',
        win32pipe.PIPE_ACCESS_DUPLEX,  # Message
        win32pipe.PIPE_TYPE_BYTE | win32pipe.PIPE_READMODE_BYTE | win32pipe.PIPE_WAIT,
        1, 65536, 65536,
        0,
        None)
    try:
        print("waiting for client")
        win32pipe.ConnectNamedPipe(pipe, None)
        print("got client")

        while True:
            print(f"writing message {count}")
            # convert to bytes
            some_data = str.encode(f"{count}\n")
            win32file.WriteFile(pipe, some_data)
#            time.sleep(1)
            count += 1

        print("finished now")
    finally:
        win32file.CloseHandle(pipe)

pipe_server()