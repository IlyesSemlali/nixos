{ pkgs, lib, config, ... }:

let
  homeDir = config.home.homeDirectory;

  remoteUrl = "git@github.com:IlyesSemlali/dot-files.git";
  sshKey = "${homeDir}/.ssh/id_github";
  branch = "mac-os";

  # Renamed to avoid shadowing pkgs.git and pkgs.openssh
  gitCmd = "${pkgs.git}/bin/git";
  sshCmd = "${pkgs.openssh}/bin/ssh";

in {
  home.activation.syncDotfiles = lib.hm.dag.entryAfter ["writeBoundary"] ''
    echo "Syncing dotfiles to ${homeDir}..."
    cd "${homeDir}"

    export GIT_SSH_COMMAND="${sshCmd} -i ${sshKey} -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"

    if [ ! -d ".git" ]; then
      echo "Initializing repo in home directory..."
      ${gitCmd} init
      ${gitCmd} remote add github "${remoteUrl}"
    fi

    ${gitCmd} remote set-url github "${remoteUrl}"

    echo "Fetching from github..."
    if ${gitCmd} fetch github; then
      echo "Resetting home directory to match github/${branch}..."
      ${gitCmd} checkout -B ${branch}
      ${gitCmd} reset --hard github/${branch}
    else
      echo "Error: Git fetch failed. Check if ${sshKey} exists and has correct permissions."
    fi
  '';
}
