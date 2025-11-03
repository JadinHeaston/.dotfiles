{{ sls }}:
  pkg.installed:
    - name: minecraft-installer
    - refresh: True
    - source: https://launcher.mojang.com/download/Minecraft.deb

