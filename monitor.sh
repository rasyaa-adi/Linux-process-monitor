
#!/bin/bash

FOLDER="reports"
mkdir -p "$FOLDER"

WAKTU=$(date +"%Y-%m-%d_%H-%M-%S")
FILE="$FOLDER/laporan-$WAKTU.txt"

echo "================================"
echo "     LINUX PROCESS MONITOR"
echo "================================"
echo "1. Tampilkan semua proses"
echo "2. Cari proses berdasarkan nama"
read -r -p "Pilih menu (1/2): " PILIHAN

case "$PILIHAN" in
    1)
        ps -u "$USER" -o pid,ppid,%cpu,%mem,stat,cmd
        ps -u "$USER" -o pid,ppid,%cpu,%mem,stat,cmd > "$FILE"
        ;;
    2)
        read -r -p "Masukan nama proses: " NAMA

        {
             echo "Pencarian proses: $NAMA"
             echo "Waktu: $(date)"
             echo
             printf "%-8s %s\n" "PID" "COMMAND"

             if ! pgrep -a -u "$USER" -x "$NAMA"; then
                 echo "Tidak ada proses bernama '$NAMA'."
             fi
        } | tee "$FILE"
        ;;
    *)
        echo "Pilihan tidak valid."
        exit 1
        ;;
esac

echo
echo "laporan tersimpan di: $FILE"
