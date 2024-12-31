## Setup

1. Clone Repository

```sh
git clone --recurse-submodules git@github.com:JanKleine/home-manager.git ~/.config/home-manager
```

2. Initialize `home-manager`

```sh
nix run home-manager/master -- init --switch
```

3. Later

```sh
home-manager switch
# OR
hm switch
```

## Structure

```text
home-manager/
├── README.md
├── configs/             # additional configs that only need to be symlinked
├── home-ipt.nix         # users go here
├── home-jankleine.nix
└── programs/            # programs configured through home-manager
    ├── default.nix
    ├── git.nix
    ┊
    ├── zsh/             # additional configs for these programs go here
    └── zsh.nix
```

