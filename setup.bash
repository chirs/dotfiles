# Update and upgrade stuff.
sudo apt-get update
sudo apt-get upgrade

# Configure hosts
echo earnie | sudo tee /etc/hostname
sudo hostname -F /etc/hostname
sudo emacs /etc/hosts

sudo dpkg-reconfigure tzdata

# Configure ssh
ssh-keygen -t rsa
emacs ~/.ssh/authorized_keys

# Configure git
git config --global user.name "Chris Edgemon"
git config --global user.email chrisedgemon@gmail.com

# Grab personal repo.
mkdir -p repos/git
git clone git@github.com:chirs/personal.git

# Set up server
sudo apt-get install emacs git-core python-pip python-dev build-essential nginx

# Install some global python packages
sudo pip install virtualenvwrapper supervisor
cp ~/repos/personal/.bashrc .bashrc
source /usr/local/bin/virtualenvwrapper.sh


# Configure supervisor
sudo cp superisord to /etc/init.d/supervisord
sudo cp supervisord.conf /etc/supervisord.conf
sudo chmod +x /etc/init.d/supervisord
sudo update-rc.d supervisord defaults
sudo /etc/init.d/supervisord start

# mkvirtualenv site
# pip install -r /home/chris/repos/site/requirements.txt

# Configure nginx
# Need to add sites-available
sudo /etc/init.d/nginx start



