# Vagrant Project README

## Project Overview

### Description

This project demonstrates the setup of a highly available, fault-tolerant, and load-balanced mini-cluster using Vagrant. It simulates a real-world e-commerce infrastructure, ensuring high availability and performance for critical services such as web hosting and database management.

### Features

- High availability and load balancing using HAProxy, Pacemaker, and Corosync
- Distributed file system with GlusterFS
- Redundant storage with RAID 1 configuration
- Pre-configured tools including MariaDB, Nginx, and monitoring solutions like Cacti
- Automated environment setup with Vagrant and provisioning scripts

## Prerequisites

### Required Software

- Vagrant (version 2.3 or higher)
- VirtualBox (version 6.1 or higher)
- Git (optional, if cloning the repository)

### Recommended Setup

- At least 16 GB of RAM and a quad-core processor for hosting multiple virtual machines
- Stable internet connection for downloading dependencies

## Installation

### Step 1: Clone the Repository

```bash
git clone https://github.com/your-repo/vagrant-cluster.git
cd vagrant-cluster
```

### Step 2: Start the Vagrant Environment

```bash
vagrant up
```

### Step 3: Access the Virtual Machines
Access Via Virtual Box or vagrant SSH

```bash
vagrant ssh <machine_name>
```

## Project Structure

```
/vagrant-cluster
├── Vagrantfile         # Configuration for Vagrant
├── shared/             # Bash scripts for provisioning the VM
└── README.md           # Documentation
```

## Usage

### Accessing Services

- Web application: `http://172.20.91.1`
- Monitoring interface (Cacti): `http://192.168.91.150/cacti`
- Monitoring interface (Ganflia): `http://192.168.91.152/ganglia` {Not Working}
- Proxy load balancer: Configured to distribute traffic between web servers

### Common Commands

- `vagrant up` - Start the environment
- `vagrant halt` - Stop all machines
- `vagrant reload` - Restart the machines
- `vagrant destroy` - Remove all machines
- `vagrant suspend` - Saves the state off all the machines

## Implementation Details

### Key Components

#### Infrastructure
- **Operating Systems**: Ubuntu Bionic64 and Focal64
- **Provisioning Tools**: Vagrant for VM automation, bash scripts for configurations

#### Software Components
- **Nginx**: Web server and reverse proxy
- **MariaDB**: Relational database system with clustering capabilities
- **HAProxy**: Load balancer
- **Corosync and Pacemaker**: Cluster management tools
- **GlusterFS**: Distributed storage solution
- **Cacti**: Network monitoring tool
- **Ganglia**: Network monitoring tool

### Automation

Vagrant and bash scripts automate the creation of VMs, configuration of RAID 1, deployment of services like Nginx, and clustering with HAProxy. Run the following scripts in sequence post-deployment to complete the setup:

- **All**
  - `cd /vagrant/Shared/AfterSetUp/<respective folder>`

- **Web Servers**:
  - `./volumeCreation.sh`
  - `./cacti.sh`

- **SQL Servers**:
  - `./sql.sh`
  - `./install.sh`
  - `./users.sh` {only on one of them}

- **Cacti**:
  - `./cacti.sh`

## Acknowledgments

This project leverages Open Source technologies, including Vagrant, VirtualBox, GlusterFS, and Cacti. The implementation was inspired by practical use cases in high-availability and fault-tolerant systems.

---


