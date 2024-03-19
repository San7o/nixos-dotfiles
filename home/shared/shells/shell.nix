/*

# Usage

nix-shell <path-to-shell>

# Why using nix-shell for developement

While it is true that you can install compilers globally to environment.systemPackages, this is actually not the "standard configuration" for development tools. The recommended method is in fact nix-shell (or nix-develop for a flake-based environment), which was specifically designed to create cleanly separated development environments.

For example, you can place a file named shell.nix in your project folder with this code:

{ pkgs ? import <nixpkgs> {}
}: pkgs.mkShell {
  nativeBuildInputs = with pkgs.buildPackages; [
    cargo
    rustc
  ];
}

Then, you can run nix-shell with no arguments from your project directory to get a consistent Rust development environment each time, while still granting you the ability to use different tools and configurations for different projects without creating conflicts. Because it runs in user-space and has such reproducible results (including on non-NixOS hosts) it can even be safely checked into source control for others. Reproducibility is what Nix is all about!

This will also install the default C compiler into your shell, which as of this writing is gcc-12.3.0 for nixos-23.11, but you can swap it out as needed for a different version, a cross-compiler, clang, etc.

Don't worry about wasting disk space, either: as long as two nix-shells use the exact same version and configuration of the same tool, they will typically share the same package in /nix/store. If things change and packages go unused, the garbage collector will eventually remove them.
*/

{ pkgs ? import <nixpkgs> {} }: pkgs.mkShell {
  nativeBuildInputs = with pkgs.buildPackages; [
    gcc.cc.libgcc
    stdmanpages  # To use man for std functions
    # cargo
    # rustc
  ];
}
