{ pkgs, lib, config, inputs, ... }:

{
  packages = [ pkgs.graphicsmagick pkgs.ffmpeg ];

  languages.python = {
    enable = true;
    uv = {
      enable = true;
      sync.enable = true;
    };
  };
}
