#Enable terraform cache

mkdir -p -m 750 /home/`whoami`/.terraform.d/plug-cache
echo "plugin_cache_dir = \"/home/`whoami`/.terraform.d/plugin-cache\"" > /home/`whoami`/.terraformrc 