# neovim config

## config

need to put this repo into
  1. windows
     `~/AppData/Local/`
  2. linux
     `~/.config/`

### requirement

- lazygit
  1. **(recommanded)** [lazyvim github<go>](https://github.com/jesseduffield/lazygit#ubuntu:~:text=%3DJesseDuffield.lazygit-,Manual,-You%27ll%20need%20to)
  ```shell
  #======= ubuntu =======
  $ sudo snap install go
  $ git clone https://github.com/jesseduffield/lazygit.git
  $ cd lazygit
  $ go install
  ```
  2. [lazyvim github<ubuntu>](https://github.com/jesseduffield/lazygit#ubuntu)
  ```
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit /usr/local/bin
  ```
- ripgrep
  `$ sudo apt-get install ripgrep`

- telescope
  `$ sudo apt-get install gcc clang make`

