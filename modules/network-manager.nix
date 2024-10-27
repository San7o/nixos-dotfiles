{ ... }:

{

  environment.etc."/NetworkManager/system-connections/eduroam.nmconnection" = {
    mode = "0600";
    text = ''

[connection]
id=eduroam
uuid=b65807cf-a33f-4e92-b802-acbe0872f55a
type=wifi
interface-name=wlp4s0

[wifi]
mode=infrastructure
ssid=eduroam

[wifi-security]
key-mgmt=wpa-eap

[802-1x]
anonymous-identity=giovanni.santini@unitn.it
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
 

    '';
  };
  environment.etc."/NetworkManager/system-connections/unitn-x.nmconnection" = {

    mode = "0600";
    text = ''
      [connection]
      id=unitn-x
      uuid=b65807cf-a33f-4e92-b802-acbe0872f55a
      type=wifi
      interface-name=wlp4s0

      [wifi]
      mode=infrastructure
      ssid=unitn-x

      [wifi-security]
      key-mgmt=wpa-eap

      [802-1x]
      anonymous-identity=giovanni.santini@unitn.it
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
    '';
  };
}
