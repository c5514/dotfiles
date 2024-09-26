{ pkgs,... }:

{
	services.printing.enable=true;
	services.printing.drivers = [ pkgs.epson-escpr ];
	hardware.printers = {
    	ensurePrinters = [
    	{
    		name = "EPSON-L3150";
			location = "Home";
			deviceUri = "usb://EPSON/L3150%20Series?serial=583747513238373737&interface=1";
			model = "epson-inkjet-printer-escpr/Epson-L3150_Series-epson-escpr-en.ppd";
			ppdOptions = { PageSize = "A4"; };
		}
	];
	};
}
