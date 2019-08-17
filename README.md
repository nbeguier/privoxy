# privoxy

## Prerequisites

```
# Install privoxy package
apt install privoxy

cd /etc/privoxy
rm user.action
git init
git remote add origin https://github.com/nbeguier/privoxy.git
git pull origin master

# Restart privoxy
systemctl restart privoxy.service
```

## Update all filters

```
bash tools/update_all.sh
```

## Update a filter

```
# Filters optimized for uBlock, to be used along EasyList
bash tools/gen_action.sh https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt ublock

# General advert blocking filters
bash tools/gen_action.sh https://easylist.to/easylist/easylist.txt easylist

# General tracking systems
bash tools/gen_action.sh https://easylist.to/easylist/easyprivacy.txt easylistprivacy

# Filtres francophones complémentaires à EasyList
bash tools/gen_action.sh https://easylist-downloads.adblockplus.org/liste_fr.txt listfr
```

## Whitelist a domain

Edit the file `whitelist.txt` and run `tools/update_all.sh`.

