{ pkgs, ... }:

let 
  myEmacs = pkgs.emacs;
  emacsWithPackages = (pkgs.emacsPackagesFor myEmacs).emacsWithPackages;
in
  emacsWithPackages (epkgs: (with epkgs.melpaStablePackages; [
    magit          # ; Integrate git <C-x g>
    zerodark-theme # ; Nicolas' theme
  ])
  ++ (with epkgs.melpaPackages; [
    vterm
    exwm-x
    flycheck # needed by vterm
    use-package
    git
    magit # git tool
    evil-collection # vim key bindings
  ])
  ++ (with epkgs.elpaPackages; [
    auctex         # ; LaTeX mode
    nameless       # ; hide current package name everywhere in elisp code
  ])
  ++ [
    pkgs.notmuch   # From main packages set
  ])