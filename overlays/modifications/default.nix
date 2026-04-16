{ ... }:
final: prev: {
  polybar = prev.polybar.override {
    mpdSupport = true;
    i3Support = true;
  };

  i3lock-fancy = prev.i3lock-fancy.overrideAttrs (_finalAttrs: _previousAttrs: {
    postPatch = ''
      sed -i i3lock-fancy \
        -e "s|mktemp|${final.coreutils}/bin/mktemp|" \
        -e "s|'rm -f |'${final.coreutils}/bin/rm -f |" \
        -e "s|scrot -z |${final.scrot}/bin/scrot -z |" \
        -e "s|convert |${final.imagemagick.out}/bin/convert |" \
        -e "s|awk -F|${final.gawk}/bin/awk -F|" \
        -e "s| awk | ${final.gawk}/bin/awk |" \
        -e "s|i3lock -i |${final.i3lock-color}/bin/i3lock-color --ring-color=#f699cdcc --keyhl-color=#ffffffcc --separator-color=#ddddddcc -i |" \
        -e 's|icon="/usr/share/i3lock-fancy/icons/lockdark.png"|icon="'$out'/share/i3lock-fancy/icons/lockdark.png"|' \
        -e 's|icon="/usr/share/i3lock-fancy/icons/lock.png"|icon="'$out'/share/i3lock-fancy/icons/lock.png"|' \
        -e "s|getopt |${final.getopt}/bin/getopt |" \
        -e "s|fc-match |${final.fontconfig.bin}/bin/fc-match |" \
        -e "s|shot=(import -window root)|shot=(${final.scrot}/bin/scrot -z -o)|" \
        -e "s|^font.*|font='DejaVu-Sans' |"
      rm Makefile
    '';
  });
}
