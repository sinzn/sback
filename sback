#!/bin/bash

DIR="/opt/sback"
REPO="https://github.com/sinzn/sback.git"
TMP="/tmp/sback"

[ "$EUID" -ne 0 ] && NEED_SUDO=true

case "$1" in
  backup)
    "$DIR/backup.sh"
    ;;

  restore)
    "$DIR/restore.sh"
    ;;

  update)
    [ "$NEED_SUDO" ] && { echo "Run with sudo"; exit 1; }
    rm -rf "$TMP"
    git clone "$REPO" "$TMP" >/dev/null
    cp "$TMP"/*.sh "$TMP"/sback "$DIR"
    chmod +x "$DIR"/*.sh "$DIR"/sback
    rm -rf "$TMP"
    echo "sback updated"
    ;;

  uninstall)
    [ "$NEED_SUDO" ] && { echo "Run with sudo"; exit 1; }
    rm -rf "$DIR" /usr/local/bin/sback
    echo "sback removed"
    ;;

  help|"")
    echo "Usage:"
    echo "  sback backup     Run backup"
    echo "  sback restore    Restore backup"
    echo "  sback update     Update sback"
    echo "  sback uninstall  Remove sback"
    ;;

  *)
    echo "Unknown command"
    echo "Run: sback help"
    ;;
esac

