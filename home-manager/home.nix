{  pkgs, customPkgs, ... }:
{
  # imports = [inputs.ags.homeManagerModules.default];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "marcom";
  home.homeDirectory = "/home/marcom";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.

  # programs.ags = {
  #   enable = true;

  #   # additional packages to add to gjs's runtime
  #   extraPackages = [
  #     inputs.ags.packages.${pkgs.system}.battery
  #     inputs.ags.packages.${pkgs.system}.apps
  #   ];
  # };


  programs.rofi = {
      enable = true;
      # package = pkgsOld.rofi-wayland;
      plugins = with pkgs; [
        rofi-emoji
        rofi-calc
      ];
  };
  programs.starship.enable = true;

  home.packages = with pkgs; [
    # Apps
    anydesk
    blender
    cobang
    discord
    gimp
    ghostty
    godot_4
    google-chrome
    gparted
    handbrake
    helvum
    inkscape
    krita
    localsend
    mpv
    obs-studio
    obsidian
    onlyoffice-desktopeditors
    pdfslicer
    rnote
    scribus
    sonic-pi
    swappy
    telegram-desktop
    tenacity
    vlc
    wasistlos # Whatsapp Client

    # Kde related
    kdePackages.ark
    kdePackages.bluedevil
    kdePackages.dolphin
    kdePackages.gwenview
    kdePackages.kdenlive
    kdePackages.okular

    # VMs
    # quickemu

    # Development
    alacritty
    neovim
    git
    gh
    tmux
    tokei

    # Helpers
    nix-search-cli
    tldr

    # Utility
    bat # better cat
    brightnessctl # control brightness
    btop
    cliphist # clipboard
    cmake
    cmatrix
    dotool
    easyeffects
    ffmpeg
    fzf # Fuzzy finding
    glow # view markdown files in terminal
    grim
    gtk3
    hyperfine
    jq
    ncdu
    neofetch
    openssl
    protonup
    ripgrep
    s-tui
    showmethekey
    slurp
    speedtest-cli
    tldr
    tree
    udiskie # auto mount drives
    unzip
    wf-recorder
    wl-clipboard
    xdg-utils
    yt-dlp

    # System themes, widget and notification
    swaynotificationcenter
    eww
    waybar
    customPkgs.quickshell

    # Rofi stuff
    pinentry-rofi

    # Network
    networkmanager_dmenu

    # Dev tools and runtimes
    awscli2
    google-cloud-sdk
    sqlite
    turso-cli

    gnumake
    gcc
    zig
    go

    bun
    nodejs_22

    python312Full
    python312Packages.tkinter
    tk

    cargo

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # ".p10k.zsh".source =  "${dotfiles}/.p10k.zsh";
    # ".zshrc".source =  "${dotfiles}/.zshrc";

    # ".config/ags".source = "${dotfiles}/.config/ags";
    # ".config/alacritty".source = "${dotfiles}/.config/alacritty";
    # ".config/easyeffects".source = "${dotfiles}/.config/easyeffects";
    # ".config/eww".source = "${dotfiles}/.config/eww";
    # ".config/fontconfig".source = "${dotfiles}/.config/fontconfig";
    # ".config/hypr".source = "${dotfiles}/.config/hypr";
    # ".config/networkmanager-dmenu".source = "${dotfiles}/.config/networkmanager-dmenu";
    # ".config/nvim".source = "${dotfiles}/.config/nvim";
    # ".config/qt5ct".source = "${dotfiles}/.config/qt5ct";
    # ".config/qt6ct".source = "${dotfiles}/.config/qt6ct";
    # ".config/rofi".source = "${dotfiles}/.config/rofi";
    # ".config/swaync".source = "${dotfiles}/.config/swaync";
    # ".config/tmux".source = "${dotfiles}/.config/tmux";
    # ".config/topgrade.toml".source = "${dotfiles}/.config/topgrade.toml";
    # ".config/wallpapers".source = "${dotfiles}/.config/wallpapers";
    # ".config/waybar".source = "${dotfiles}/.config/waybar";

    # ".local/bin".source = "${dotfiles}/.local/bin";

    # ".local/share/icons".source = "${dotfiles}/.local/share/icons";
    # ".local/share/themes".source = "${dotfiles}/.local/share/themes";

    # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/marco/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\\\${HOME}/.steam/root/compatibilitytools.d";
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
