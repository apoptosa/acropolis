################################################################################
# Machine specific mount location.
################################################################################
export msm_mnt=/mnt/grottoop
export rce_mnt=$msm_mnt/_Repositories/comp_environment/acropolis

## Build path structures
export env_mnt=$rce_mnt/_Environment

. $env_mnt/env_paths.sh


## Parse aliases, motd and ~/.todo
. $env_mnt/env_aliases.sh
. $env_mnt/env_startup.sh

# private paths and aliases
. $env_mnt/env_paths.priv.sh
. $env_mnt/env_aliases.priv.sh
