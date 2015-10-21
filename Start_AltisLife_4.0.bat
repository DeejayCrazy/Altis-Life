cd "E:\A3Server"
start "Arma3" /min /wait arma3server.exe -port=2302 "-config=E:\A3Server\AltisLife\config.cfg" "-cfg=E:\A3Server\AltisLife\basic.cfg" "-profiles=E:\A3Server\AltisLife" -name=AltisLife "-mod=@life_server;@extDB2" -filePatching
exit