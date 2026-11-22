{
  hasRole,
  pkgs,
  lib,
  ...
}:

{
  systemd.tmpfiles.rules = [
    "d /tmp/xdg-jail/ 1774 root users - -"
  ];

  environment.sessionVariables = {
    NIXPKGS_ALLOW_UNFREE = "1";

    NUGET_PACKAGES = "/tmp/xdg-jail/nuget";
    DOTNET_CLI_HOME = "/tmp/xdg-jail/dotnet";
    GRADLE_USER_HOME = "/tmp/xdg-jail/gradle";
  };

  environment.systemPackages =
    with pkgs;
    [
      frp
      tailscale

      powerstat
      stress-ng
      lm_sensors

      micro
      neovim
      vimv
      moor
      highlight
      zsh
      chafa
      starship
      zellij
      lsof
      jq
      tree
      zoxide
      fzf
      fd
      ripgrep
      tldr
      lsd
      man-db
      gdu
      trash-cli
      rustnet

      shfmt

      bun
      biome
      nodejs
      typescript
      serve
      turbo
      pnpm

      cargo
      rustc
      rustfmt
      clippy
      rust-analyzer

      snapcast
      playerctl
      pulseaudio
      alsa-utils
      pulsemixer
      pamixer

      nh
      nixd
      nixfmt
      home-manager

      openssl
      postgresql
      binutils
      python3
      gnumake
      cmake
      gcc
      jdk

      unzip
      psmisc
      bubblewrap
      appimage-run
      socat
      wakeonlan
      usbutils
      plocate
      brightnessctl
      bind
      bluez
      bluetui
      bridge-utils
      dmidecode
      docker
      docker-compose
      evtest
      fastfetch
      fuse-overlayfs
      git
      github-cli
      gvfs
      inotify-tools
      iptables
      ffmpeg-full
      rclone
      rsync
      sdbus-cpp
      traceroute
      wget
      curl
    ]
    ++ lib.optionals (hasRole "desktop") (
      with pkgs;
      [
        uwsm

        hyprland
        hyprlang
        hyprlock
        hypridle
        hyprpaper
        hyprsunset
        hyprpicker
        hyprpolkitagent

        vivaldi
        vivaldi-ffmpeg-codecs
        ungoogled-chromium

        copyq
        wl-clipboard
        tesseract

        mpv
        haruna

        kitty
        qbittorrent
        obs-studio
        telegram-desktop

        vorta
        nemo-with-extensions
        nemo-fileroller
        file-roller
        kdiskmark
        pavucontrol
        fuzzel
        blueman
        dconf-editor
        networkmanagerapplet
        qpwgraph
        remmina
        udiskie
        gnome-disk-utility
        mission-center

        virt-manager
        qemu_full

        wev
        droidcam
        libnotify
        ffmpegthumbnailer
        gnome-themes-extra
        gtk-engine-murrine

        eog
        kooha
        satty
        grimblast
      ]
    );

  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.jetbrains-mono

    liberation_ttf

    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];
}
