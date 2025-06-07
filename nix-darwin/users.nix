{ pkgs, ... }:

{
  users = {
    knownUsers = [
      "ilyes"
    ];
    users = {
      ilyes = {
        uid = 501;
        shell = pkgs.zsh;
      };
    };
  };
}
