# Yara Rule Testing

This repository describes the process of getting started with Yara.  Yara is a tool positioned to help researchers to conduct malware analysis, determine string pattern matches, binaries or opcodes, and create result sets.

## Getting Started

To get started, I recommend using a debian based operating system.  I have used Debian 10 on Google Cloud Platform for testing.  

To download Yara, I referenced this article for inspiration - https://seanthegeek.net/257/install-yara-write-yara-rules/.

### How is this Repository laid out?

This repository has two primary directories, `rules`, which is a container for yara rules.  Second `files`, which is a sample set of files.

### Install via Package Managers

```bash
sudo apt-get install -y automake libtool make gcc flex bison libssl-dev libjansson-dev libmagic-dev

sudo apt-get install -y checkinstall
sudo apt-get install -y libyara3 yara python-yara # Remove any existing install from distro repos
sudo checkinstall -y --deldoc=yes

```

### Install python package

```bash
sudo apt-get install -y python-pip python3-pip
sudo -H pip install -U pip
sudo -H pip3 install -U pip
sudo -H pip install -U git+https://github.com/VirusTotal/yara-python@3.9.0
sudo -H pip3 install -U git+https://github.com/VirusTotal/yara-python@3.9.0
```

### Download via Source

wget https://github.com/VirusTotal/yara/archive/refs/tags/v4.1.3.ta
r.gz

## Running Yara

1. Find all matches that pass

```bash
yara -rs rules/ test.txt

# run all
yara -rs rules/* files/
``` 

2. Find all matches that fail

```bash
yara -rn rules/pass-all.yara test.txt 
```

### Testing and writing Hex Rules

You can use a hex viewer or xxd.  

Use the following:

```bash
xxd -p files/testing.txt
74657374696e670a0a74657374696e67320a0a74657374696e67330a
```

## References

* https://github.com/Yara-Rules/rules
