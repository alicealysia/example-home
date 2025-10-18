{pkgs, ...}: {
  
  home.packages = with pkgs; [
#   Find an application from https://search.nixos.org/
#   then add the name of the application to a new line of this list

#   after saving, run the command:
#   home-manager switch

#   in the terminal below and any apps added below will be installed!  

#     (nix-vscode-extensions.override {
#       vscode = vscodium;
#       vscodeExtensions = with pkgs.vscode-marketplace; [
#         jnoortheen.nix-ide
#       ];
#     })
    hut
  ];
}


