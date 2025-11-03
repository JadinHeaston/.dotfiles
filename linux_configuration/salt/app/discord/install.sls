{{ sls }}:
  pkg.installed:
    - name: discord
    - refresh: True
    - source: https://discordapp.com/api/download?platform=linux&format=deb

