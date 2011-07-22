# You know, there are pre-compile DEBs of this...

all: sixad-bin tools

sixad-bin:
	gcc -Wall -O2 sdp.c textfile.c sixad.c -o bins/sixad-bin -lbluetooth
	gcc -Wall -O2 sdp.c textfile.c sixad-uinput-sixaxis.c -o bins/sixad-uinput-sixaxis -lbluetooth

tools:
	gcc -Wall -O2 sixpair.c -o bins/sixpair -lusb
	gcc -Wall -O2 sixpair_kbd.c -o bins/sixpair-kbd -lusb
	gcc -Wall -O2 sixad-raw.c -o bins/sixad-raw
	gcc -Wall -O2 hidraw-dump.c -o bins/hidraw-dump

clean:
	rm -f bins/sixad-bin bins/sixad-raw bins/sixad-uinput-sixaxis bins/hidraw-dump bins/sixpair bins/sixpair-kbd

install:
	chmod +x bins/six*
	chmod +x bins/hid*
	chmod +x compat/hcid_*
	mkdir -p /usr/lib/sixad
	cp sixad /usr/bin/
	cp sixad.default /etc/default/sixad
	cp sixad.init /etc/init.d/sixad
	cp 98-sixad.rules /lib/udev/rules.d/
	cp bins/hidraw-dump /usr/sbin/
	cp bins/sixpair /usr/sbin/
	cp bins/sixpair-kbd /usr/sbin/
	cp bins/sixad-raw /usr/sbin/
	cp bins/sixad-bin /usr/sbin/
	cp bins/sixad-uinput-sixaxis /usr/sbin/
	DEBIAN.split/postinst.all

powerpc:
	cp bins/libbluetooth.so.3_powerpc /usr/lib/sixad/libbluetooth.so.3

uninstall:
	rm -rf /usr/lib/sixad/
	rm -f /usr/bin/sixad
	rm -f /etc/default/sixad
	rm -f /etc/init.d/sixad
	rm -f /lib/udev/rules.d/98-sixad.rules
	rm -f /usr/sbin/hidraw-dump
	rm -f /usr/sbin/sixpair
	rm -f /usr/sbin/sixpair-kbd
	rm -f /usr/sbin/sixad-raw
	rm -f /usr/sbin/sixad-bin
	rm -f /usr/sbin/sixad-uinput-sixaxis
	DEBIAN.split/postrm.all
