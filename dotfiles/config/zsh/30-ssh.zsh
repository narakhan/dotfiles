# Enable GNUPG authentication
unset SSH_AGENT_PID

if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

# Update if using a new X session
export GPG_TTY=$(tty)

gpg-connect-agent updatestartuptty /bye >/dev/null
