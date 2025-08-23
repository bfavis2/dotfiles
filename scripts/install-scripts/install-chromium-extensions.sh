#!/bin/bash

install_chrome_extension() {
  # preferences_dir_path="/opt/google/chrome/extensions"
  preferences_dir_path="/usr/share/google-chrome/extensions"
  pref_file_path="$preferences_dir_path/$1.json"
  upd_url="https://clients2.google.com/service/update2/crx"

  mkdir -p "$preferences_dir_path"

  echo "{" >"$pref_file_path"
  echo "  \"external_update_url\": \"$upd_url\"" >>"$pref_file_path"
  echo "}" >>"$pref_file_path"
  echo Added \""$pref_file_path"\" ["$2"]
}

install_chrome_extension "aeblfdkhhhdcdjpifhhbdiojplfjncoa" "1password"
install_chrome_extension "fmkadmapgofadopljbjfkapdkoienihi" "react dev tools"
install_chrome_extension "anmidgajdonkgmmilbccfefkfieajakd" "refined github"
install_chrome_extension "dbepggeogbaibhgnhhndojpepiihcmeb" "vimium c"
install_chrome_extension "jjhefcfhmnkfeepcpnilbbkaadhngkbi" "readwise highlighter"
