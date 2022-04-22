{ pkgs ? null } @ args:


let
  nixpkgs = builtins.fetchTarball {
    # nixos-21.05 at 28/06/2021
    url = "https://github.com/nixos/nixpkgs/archive/f77036342e2b690c61c97202bf48f2ce13acc022.tar.gz";
    sha256 = "1vcrb2s6ngfv0vy7nwlqdqhy1whlrck3ws4ifk5dfhmvdy3jqmr4";
  };

  pkgs = if args ? "pkgs"
    then args.pkgs
    else import nixpkgs { config = {}; };
in

with pkgs;

let
  drv = lib.callPackageWith pkgs ./. { };
in

  drv
