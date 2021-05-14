## VPN

### Site-2-Site

IPSec VPN between 2 parties with a dedicated tunnel routing through the public internet

IPSec encrypts data in the packet layer.

Required components:
  * VPG - Virtual Private Gateway (AWS Side)
    * Route Table must point private subnets to the VPN Connection throught the VPG
  * Customer Gateway - Remote side

* [Getting Started Guide](https://docs.aws.amazon.com/vpn/latest/s2svpn/SetUpVPNConnections.html)

### AWS Client VPN

* OpenVPN based VPN Client to manage AWS resources from OnPrem with TLS VPN session

### AWS VPN CloudHub

* Manage many site-to-site VPN connections via private gateway

