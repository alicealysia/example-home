{ config, lib, ... }: {
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Mod+Shift+A".action.spawn                        = ["dms" "ipc" "spotlight" "toggle"];
  };
}