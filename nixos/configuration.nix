# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot = {
    loader = {
      # TODO: Configuration needs to be done for EFI.
      # Using systemd-boot might be interesting too.
      grub = {
        enable = true;
        version = 2;
        device = "/dev/sda"; # or "nodev" for efi
        #efiSupport = true;
        #efiInstallAsRemovable = true;
        #efiSysMountPoint = "/boot/efi";
      };
    };
    # Disable hibernation and set zfs arc (cache) to 2GB
    kernelParams = [ "nohibernate" "zfs.zfs_arc_max=2147483648" ];
    supportedFilesystems = [ "zfs" ];
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  security = {
    sudo.enable = false;
    doas = {
      enable = true;
      extraRules = [
        { groups = ["wheel"]; keepEnv = true; persist = true; }
      ];
    };
  };

  networking = {
    hostName = "vm-nixos-server-testing";
    hostId = "40710698";
    # Set DNS to Cloudflare by default
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];
    # Deprecated, therefore set to false
    #useDHCP = false;
    #interfaces = {
    #  enp0s3.useDHCP = true;
    #  enp0s8.useDHCP = true;
    #};
    firewall.enable = false;
  };

  time.timeZone = "America/Toronto";

  console = {
    keyMap = "cf";
  };

  programs.fish.enable = true;

  # TODO: Manually set GID and UID for share user to facilitate things
  users = {
    # Make sure some groups exist
    groups.share = { };
    groups.wheel = { };
    users = {
      cbrunel = {
        isNormalUser = true;
        extraGroups = [ "wheel" "docker" ];
        shell = pkgs.fish;
      };
      share = {
        createHome = false;
        isNormalUser = false;
        isSystemUser = true;
        group = "share";
        initialPassword = "share";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    gcc
    neovim
    wget
    curl
    docker-compose
    git
    exa
    htop
    btop
    lm_sensors
  ];

  services = {
    openssh.enable = true;
    # NOTE: You also need to run "smbpasswd -a share". Use "pdbedit -L" to verify that it worked.
    samba = {
      enable = true;
      #openFirewall = true;
      securityType = "user";
      extraConfig = ''
        workgroup = WORKGROUP
        #log file = /var/log/samba/log.%m
        #max log size = 1000
        #logging = file
        server role = standalone server
        obey pam restrictions = yes
        unix password sync = yes
        map to guest = bad user
        usershare allow guests = yes

        server string = smbnix
        netbios name = smbnix
        security = user
        # Whitelist
        #hosts allow = 192.168.0 localhost
        #hosts deny = 0.0.0.0/0
        guest account = nobody
      '';
      shares = {
        public = {
          path = "/mnt/Shares/Public";
          browseable = "yes";
          "read only" = "no";
          "guest ok" = "yes";
          "create mask" = "0644";
          "directory mask" = "0755";
          "force user" = "share";
          "force group" = "share";
        };
        publiczfs = {
          path = "/mnt/zfs/Public ZFS/";
          browseable = "yes";
          "read only" = "no";
          "guest ok" = "yes";
          "create mask" = "0644";
          "directory mask" = "0755";
          "force user" = "share";
          "force group" = "share";
        };
        private = {
          path = "/mnt/Shares/Private";
          browseable = "yes";
          "read only" = "no";
          "guest ok" = "no";
          "create mask" = "0644";
          "directory mask" = "0755";
          "force user" = "share";
          "force group" = "share";
        };
      };
    };
    udev.extraRules = ''
      ACTION=="add|change", KERNEL="sd[a-z]*[0-9]*|mmcblk[0-9]*p[0-9]|nvme[0-9]*n[0-9]*p[0-9]*", ENV{ID_FS_TYPE}="zfs_member", ATTR{../queue/scheduler}="none"
    ''; # zfs already has its own scheduler.
    zfs.autoScrub.enable = true;
  };

  virtualisation.docker.enable = true;

  system = {
    stateVersion = "21.11";
    autoUpgrade = {
      enable = true;
      # TODO: Set time at which it would update to make sure reboot doesn't occur at a bad time
      allowReboot = false;
    };
  };
}

# vim: expandtab ts=2 sw=2:
