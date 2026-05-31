Configuration

  make help
  make list-defconfigs
  make <board>_defconfig
  make menuconfig
  make savedefconfig
  make olddefconfig

  Build

  make
  make -j$(nproc)
  make source              # télécharge les sources sans compiler

  Images générées

  ls output/images/
  ls output/target/
  ls output/build/

  Nettoyage

  make clean               # supprime les artefacts de build
  make distclean           # reset complet, supprime aussi .config

  Paquets

  make <pkg>-rebuild
  make <pkg>-reconfigure
  make <pkg>-dirclean
  make <pkg>-source

  Exemples :

  make busybox-rebuild
  make linux-reconfigure
  make openssh-dirclean

  Menus spécifiques

  make linux-menuconfig
  make busybox-menuconfig
  make uboot-menuconfig

  Debug / analyse

  make graph-depends
  make graph-build
  make legal-info
  make show-targets

  Build séparé recommandé

  make O=output-myboard <board>_defconfig
  make O=output-myboard menuconfig
  make O=output-myboard -j$(nproc)