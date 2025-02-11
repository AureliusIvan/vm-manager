for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo apt-get install build-essential

sudo usermod -aG docker $USER

# Enable these setting
sudo ufw allow OpenSSH # open ssh
	# or alternatively
sudo ufw allow 22

# enable http
sudo ufw allow http

# enable https
sudo ufw allow https

# Since nginx proxy manager will be running on port 81, we should allow that for now
sudo ufw allow 81

# AND LAST
sudo ufw enable

# check status
sudo ufw status

# check docker status
sudo systemctl status docker

# check docker-compose status
docker compose --version

# check docker-compose-plugin status
docker compose plugin ls

# up
sudo systemctl start docker

# enable
sudo systemctl enable docker

# check status
sudo systemctl status docker