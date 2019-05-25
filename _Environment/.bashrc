#Machine specific mount location.
export msm_mnt=/mnt/grottoop

#Build path structures
export env_mnt=$msm_mnt/_Environment
. $env_mnt/env_paths.sh

#Parse aliases, motd and ~/.todo
. $env_mnt/env_aliases.sh
. $env_mnt/env_startup.sh
