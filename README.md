## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.
(Diagrams/VM-Two.jpg)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the /etc/ansible file may be used to install only certain pieces of it, such as Filebeat.

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Usecd 
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log data and system metrics.

The configuration details of each machine may be found below.

| Name     | Function   | IP Address | Operating System |
|----------|------------|------------|------------------|
| Jump Box | Gateway    | 10.0.0.1   | Linux            |
| Web-1    | Web Server | 10.0.0.5   | Linux            |
| Web-2    | Web Server | 10.0.0.6   | Linux            |
| ElkVM    | Web Server | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the DVWA machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses: 
24.6.73.227 
10.0.0.1

Machines within the network can only be accessed by the Jump Box VM (10.0.0.1).

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses  |
|----------|---------------------|-----------------------|
| Jump Box | No                  | 24.6.73.227           |
| Web-1    | No                  | 10.0.0.1, 24.6.73.227 |
| Web-2    | No                  | 10.0.0.1, 24.6.73.227 |
| ElkVM    | No                  | 10.0.0.1, 24.6.73.227 |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it allows for easy set-up.

The playbook implements the following tasks:
- Installs docker
- Downloads and configures elk container
- Starts container
- Enables docker service on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.
(Images/DockerPS-Output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines: 
10.0.0.5
10.0.0.6

We have installed the following Beats on these machines: 
Filebeat
Metricbeat

These Beats allow us to collect the following information from each machine: 
Log files and log events, which are forwarded to either Elasticsearch or Logstash for indexing
Metric data from target servers, such as system CPU, memory, and load

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the elk-playbook.yml file to /etc/ansible
- Update the /etc/ansible/hosts file to include the IP address of the Elk VM
- Run the playbook, and navigate to "http://[your.ELK-VM.External.IP]:5601/app/kibana" to check that the installation worked as expected.
