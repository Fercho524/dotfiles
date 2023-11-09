import os


def create_audio(text,path):
    voice = "Jorge"
    program = "/home/theplayeroff/.bin/balcon/balcon.exe"
    command = f'wine {program} -t "{text}" -n "{voice}" -enc utf8  -w "{path}"'
    print(command)
    os.system(command)


create_audio("Audio número 1","1.wav")
create_audio("Audio numero 3","2.wav")
create_audio("Audio numero 69","jfasd.wav")