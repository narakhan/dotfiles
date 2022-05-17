#####################
# Pyenv
#####################

export PYENV_ROOT="$XDG_DATA_HOME/pyenv"

# Pyenv manages its own bin
export PATH="$PYENV_ROOT/bin:$PATH"

#####################
# Virtualenvwrapper
#####################

export WORKON_HOME="$XDG_DATA_HOME/virtualenvs"
export PROJECT_HOME="$HOME/Documents/scratch"
export VIRTUALENVWRAPPER_WORKON_CD=0

source /usr/bin/virtualenvwrapper.sh

# Disable pipenv warnings
export PIPENV_VERBOSITY=-1

{%@@ if profile == 'apep' @@%}
#####################
# Office
#####################

export PIP_CERT=/etc/ssl/cert.pem
export REQUESTS_CA_BUNDLE=/etc/ssl/cert.pem
{%@@ endif @@%}
