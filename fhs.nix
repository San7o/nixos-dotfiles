# CAREFUL
# I don't know how reliable Is this
{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSEnv {
  name = "simple-x11-env";
  targetPkgs = pkgs: (with pkgs; [
    udev
    alsa-lib
  ]) ++ (with pkgs.xorg; [
    libX11
    libXcursor
    libXrandr
  ]);
  multiPkgs = pkgs: (with pkgs; [
    # Import packages here
    udev
    alsa-lib
    libgcc   
    zlib             # Many applications require libz.so.1
    appimage-run     # To run appimages
  ]);
  runScript = "bash";
}).env
