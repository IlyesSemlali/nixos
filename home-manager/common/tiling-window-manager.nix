{ config, ... }:

{
  home.file.volume = {
    source = ../dot-files/.local/bin/volume;
    target = "${config.home.homeDirectory}/.local/bin/volume";
    executable = true;
  };
}
