
py_ver="3.7.4"
echo "Install python $py_ver"
cd ~
mkdir Downloads
cd Downloads
rm -rf Python-$py_ver*
wget https://www.python.org/ftp/python/$py_ver/Python-$py_ver.tgz
tar xzvf Python-$py_ver.tgz
cd Python-$py_ver
./configure --enable-optimizations
make
make altinstall
/usr/local/bin/pip3.7 install --upgrade pip
/usr/local/bin/pip3.7 install --upgrade requests pipenv numpy matplotlib 
