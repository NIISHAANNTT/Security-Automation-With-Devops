import nmap

# Initialize the Nmap object
nm = nmap.PortScanner()

# Define the target to scan
target = 'cmet.gov.in'  # Replace this with the target IP or domain you want to scan

# Run the Nmap scan with options
print(f"Starting Nmap scan on {target}...")
nm.scan(hosts=target, arguments='-sS ')

# Print the scan results
for host in nm.all_hosts():
    print(f"Host: {host}")
    print(f"State: {nm[host].state()}")

    # Iterate through protocols and ports
    for protocol in nm[host].all_protocols():
        print(f"Protocol: {protocol}")
        lport = nm[host][protocol].keys()
        for port in lport:
            print(f"Port: {port}, State: {nm[host][protocol][port]['state']}")
