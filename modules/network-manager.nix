{ ... }:

{
  
    environment.etc.NetworkManager = {
        system-connections = [
	    "eduroam.nmconnection".text = ''
[connection]
id=eduroam
uuid=345c015a-792e-4b98-b30d-6ea2540e2977
type=wifi
interface-name=wlo1

[wifi]
mode=infrastructure
ssid=eduroam

[wifi-security]
auth-alg=open
key-mgmt=wpa-eap

[802-1x]
eap=peap;
identity=giovanni.santini@unitn.it
password=
phase2-auth=mschapv2

[ipv4]
method=auto

[ipv6]
addr-gen-mode=default
method=auto

[proxy]
	    '',

	    "unitn-x.nmconnection".text = ''
[connection]
id=unitn-x
uuid=4fcb164b-b754-40e7-99ae-0ca1fbce7e18
type=wifi
interface-name=wlo1

[wifi]
mode=infrastructure
ssid=unitn-x

[wifi-security]
key-mgmt=wpa-eap

[802-1x]
domain-suffix-match=unitn.it
eap=peap;
identity=giovanni.santini@unitn.it
password=
phase2-auth=mschapv2

[ipv4]
method=auto

[ipv6]
addr-gen-mode=default
method=auto

[proxy]
	    ''
	    ];
	};
    };
}
