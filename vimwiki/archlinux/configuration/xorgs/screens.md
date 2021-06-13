# Screens

For the screen connect with a DVI connector, the EDID is not properly recognized.
So in order for the monitor to be rendered correctly we must configure it properly.

## EDID for Acer S243HL

I already have extracted the EDID file for my monitors and put it in my doftiles.
Copy it to the system for later ues with:
```sh
sudo mkdir -p /lib/firmware/edid
sudo cp ~/.dotfiles/edid/1920x1080-acer-s243hl.bin /lib/firmware/edid/1920x1080-acer-s243hl.bin
```

## Kernel


## Xorg

### Nvidia driver

Create the file `/etc/X11/xorg.conf.d/10-monitors.conf` with:
```
Section "Monitor"
	Identifier	"LeftMonitor"
	VendorName	"Acer"
	ModelName	"S243HL"
	Option		"Primary"
EndSection

# HDMI-0
Section "Monitor"
	Identifier	"RightMonitor"
	VendorName	"Acer"
	ModelName	"S243HL"
	Option		"RightOf"   "LeftMonitor"
EndSection
```

Create the file `/etc/X11/xorg.conf.d/20-devices.conf` with:
```
Section "Device"
	Identifier	"Nvidia GT 430"
    Driver      "nvidia"
	Option		"Monitor-DVI-I-0"	"LeftMonitor"
	Option		"Monitor-HDMI-0"	"RightMonitor"
    Option      "UseEDID"           "True"
    Option      "CustomEDID"        "DVI-I-0:/lib/firmware/edid/1920x1080-acer-s243hl.bin"
EndSection
```

### Nouveau driver

Try the same configuration as Nvidia by changing `Driver "nvidia"` to `Driver "nouveau"` in the `Device` section.
Update the ID of the monitors for instance with the setup at the time I wrote this with nvidia the IDs are (to confirm):

| nvidia  | nouveau |
|---------|---------|
| DVI-I-0 | DVI-I-1 |
| HDMI-0  | HDMI-1  |
