## Setup

1. Clone Repository

```
git clone --recurse-submodules git@github.com:JanKleine/home-manager.git ~/.config/home-manager
```

2. Initialize `home-manager`

```zsh
nix run home-manager/master -- init --switch
```

3. Later

```zsh
home-manager switch
# OR
hm switch
```
