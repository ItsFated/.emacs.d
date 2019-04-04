# dependents #
1. [pandoc](http://www.pandoc.org) add to exec path
2. [yasnippet-snippet](https://github.com/ItsFated/yasnippet-snippets) clone to "~/."
3. [the silver searcher (ag)](https://github.com/ggreer/the_silver_searcher) add to exec path
4. [all-the-icons](https://github.com/domtronn/all-the-icons.el) install font families
5. [Inziu Iosevka Font Families](https://be5invis.github.io/Iosevka/inziu.html) install font families

# install emacs with ubuntu #
1. [download emacs source code](https://www.gnu.org/software/emacs/download.html#gnu-linux)
2. install dependences "sudo apt build-dep emacs && sudo apt-get install aptitude"
2. into source code directory run "./configure" script
3. if have some packages not installed, than install dependences "sudo apt install libgtk2.0-dev libXpm-dev libjpeg-dev libgif-dev libtiff-dev libgnutls-openssl27 libgcrypt11-dev && sudo apt update && sudo apt upgrade && sudo apt install libgnutls-dev"
4. run ".configure" script check again

# install emacs 26.1 with ubuntu 18.04 #
# Insall Emacs source on Ubuntu 17.10 (xfce4)
uname -a
> Linux Slug 4.13.0-16-generic #19-Ubuntu SMP Wed Oct 11 18:35:14 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux
mkdir ~/src
cd ~/src
sudo apt-get update
sudo apt-get install git
git clone -b master git://git.sv.gnu.org/emacs.git
sudo apt-get install build-essential automake texinfo libjpeg-dev libncurses5-dev
sudo apt-get install libtiff5-dev libgif-dev libpng-dev libxpm-dev libgtk-3-dev libgnutls28-dev
cd emacs/
# read INSTALL.REPO
./autogen.sh
# configure recommended I add --with-mailutils
./configure --with-mailutils --prefix="${HOME}/local"
make
# check it's working
src/emacs --version
> GNU Emacs 27.0.50
# run it
src/emacs &
# install it globally
sudo make install
