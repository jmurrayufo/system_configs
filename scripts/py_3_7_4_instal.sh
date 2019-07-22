echo "Install python 3.7.4"
cd ~
mkdir Downloads
cd Downloads
rm -rf Python-3.7.4*
wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz
tar xzvf Python-3.7.4.tgz
cd Python-3.7.4
./configure --enable-optimizations
make
make altinstall
/usr/local/bin/pip3.7 install --upgrade pip
/usr/local/bin/pip3.7 install --upgrade requests pipenv numpy matplotlib psutil 
