# 🧪 Ansible Docker Lab


Set up a lightweight Ansible lab using Docker — perfect for learning and testing Ansible from your **local machine**.

This project spins up **three Ubuntu containers** with SSH and Python pre-installed, so you can immediately start running Ansible playbooks from your host system (which acts as the Ansible controller).

<p align="center">
  <img src="https://img.shields.io/badge/Dockerized-Ansible-blue?style=flat-square" alt="Dockerized Ansible" />
  <img src="https://img.shields.io/badge/Ubuntu-22.04-blueviolet?style=flat-square" alt="Ubuntu" />
  <img src="https://img.shields.io/badge/Built%20With-Docker%20Compose-2496ED?style=flat-square" alt="Docker Compose" />
  <img src="https://img.shields.io/badge/License-MIT-green?style=flat-square" alt="License: MIT" />
</p>


## 📦 What's Included

- ⚙️ `docker-compose` config for 3 Ubuntu containers
- 🔐 SSH enabled (default user: `root`, password: `root`)
- 🐍 Python pre-installed (required by Ansible)
- 🔗 Isolated Docker network named `ansible`
- 🎯 Host port forwarding to each container's SSH

---

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/ansible-docker-lab.git
cd ansible-docker-lab
```

### 2. Build and Start Containers

```bash
docker-compose up --build -d
```

### 3. Test SSH Access (Optional)

```bash
ssh root@localhost -p 2221
# password: root
```

### 4. Create an Inventory File (`inventory.ini`)

```ini
[nodes]
node1 ansible_host=127.0.0.1 ansible_port=2221 ansible_user=root ansible_password=root
node2 ansible_host=127.0.0.1 ansible_port=2222 ansible_user=root ansible_password=root
node3 ansible_host=127.0.0.1 ansible_port=2223 ansible_user=root ansible_password=root
```

### 5. Ping All Nodes with Ansible

```bash
ansible -i inventory.ini all -m ping
```

---

## 📁 Directory Structure

```
ansible-docker-lab/
├── docker-compose.yml
├── node/
│   └── Dockerfile
└── README.md
```

---

## 🛠️ Customization

- ➕ Add more nodes by duplicating services in `docker-compose.yml`.
- 🔑 Set up SSH key-based auth instead of passwords for better security.
- 🧩 Add more packages or custom scripts to the `node/Dockerfile`.

---

## 🧹 Cleanup

```bash
docker-compose down
```

---

## 💡 Why Use This?

This lab is great if you want to:

- Learn Ansible without installing VMs or using the cloud
- Practice playbooks in a safe, disposable environment
- Test roles, modules, and ad-hoc commands quickly