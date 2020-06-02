## Route53

DNS Service for scale.

> DNS Converts human names to device IP addresses


## IP

Internet Protocol

* V4 has around 4B addresses (32 bits)
* V6 has around 340 undecillion addresses (128 bits)

ISPs must migrate to V6.

## TLD - Top Level Domain Names

> amazon.com
> amazon.de
> amazon.com.br -> second level

### Domain Registrars

Companies that register domain names and service them to InterNIC, a service of ICANN that enforces uniqueness across the internet.

e.g.:
> amazon
> godaddy

## Records

### SOA - Start Of Authority Record

When you buy a domain name, the domain starts with SOA including:

* Name of the server for that zone
* Admin of the zone
* Current version of data file
* TTL - Time to live (in seconds)

### NS - Name Server

Basically, the general address for resolving internal IP addresses, given by a TLD server.

e.g.:

`marceloboeira.com` -> browser hits the `.com` TLD that says:

```
jill.ns.cloudflare.com 173.245.58.122
lars.ns.cloudflare.com 173.245.59.195
```

Those are the name servers, the ones that will resolve the specific name to an ip-address.

### A - Address

The specific record to a given name:

```
Name:   www.marceloboeira.com
Address: 172.67.131.75
Name:   www.marceloboeira.com
Address: 104.28.7.53
Name:   www.marceloboeira.com
Address: 104.28.6.53
```

### CNAME - Canonical Name

Used to resolve 1 domain name to another:

`
www.marceloboeira.com -> marceloboeira.com
marcelo.github.io -> marceloboeira.com
`

## Routing Policies

* Simple Routing - Rotates values randomly (multiple IP addresses)
* Weighted Routing - Split the traffic by resolving DNS (e.g.: 10% IP: 1, 90% IP: 2) (you can associate health-checa)
* Latency-based Routing - Routes to the lowest latency to the client (user)
* Failover Routing -
* Geolocation Routing -
* Geoproximity Routing -
* MultiValue Routing

## Route53 Lab

### Base

1. Register a domain (or register NS records of a subdomain you already own)
1. Create Machines (into different regions if possible)
1. Create an A record with simple distribution for the 2 machines
1. Test the distribution with `nslookup ...`


### Weighted

1. Create another recordset, for weighted with a different distribution (e.g.: 70% to IP1, 30% to IP2)
1. Double check that you can use health-checks

### Latency

1. Create another recordset for latency with a different distribution
1. Test the recordset (it's not easy to test latency against another region without a VPN) (PureVPN is free for such tests)
