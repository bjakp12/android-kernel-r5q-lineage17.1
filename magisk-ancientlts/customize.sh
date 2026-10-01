# Ancient-LTS R5Q kernel boot-patcher (Magisk module installer)
# Flash via: Magisk app -> Modules -> Install from storage -> this zip.
# It unpacks the LIVE boot.img with magiskboot, swaps only the kernel with
# Image.gz-dtb, repacks and flashes back. Ramdisk + Magisk init untouched,
# so root is preserved. Stock boot.img is backed up to /sdcard/Ancient-LTS/.

ui_print "  ================================"
ui_print "  Ancient-LTS R5Q by bjakp12@ubunt"
ui_print "  ================================"

# --- device guard (r5q only) ---
DEV="$(getprop ro.product.device 2>/dev/null)"
[ -z "$DEV" ] && DEV="$(getprop ro.build.product 2>/dev/null)"
[ -z "$DEV" ] && DEV="$(getprop ro.product.vendor.device 2>/dev/null)"
case "$DEV" in
  *r5q*)
    ui_print "  device: $DEV (OK)"
    ;;
  "")
    ui_print "  !! device prop kosong, lanjut tanpa cek (recovery?)"
    ;;
  *)
    abort "  !! device '$DEV' bukan r5q, abort demi keamanan."
    ;;
esac

# --- locate live boot block (A/B aware) ---
SLOT="$(getprop ro.boot.slot_suffix 2>/dev/null)"
if [ -z "$SLOT" ]; then
  S="$(getprop ro.boot.slot 2>/dev/null)"
  case "$S" in
    a|A) SLOT="_a" ;;
    b|B) SLOT="_b" ;;
  esac
fi
BLOCK="/dev/block/by-name/boot${SLOT}"
[ -e "$BLOCK" ] || BLOCK="/dev/block/bootdevice/by-name/boot${SLOT}"
[ -e "$BLOCK" ] || BLOCK="/dev/block/platform/soc/1d84000.ufshc/by-name/boot${SLOT}"
[ -e "$BLOCK" ] || abort "  !! boot block tidak ketemu (slot='${SLOT}')."

ui_print "  boot block: $BLOCK"

# --- magiskboot ---
MB="$MODPATH/tools/magiskboot"
[ -f "$MB" ] || abort "  !! magiskboot hilang dari zip, abort."
chmod 755 "$MB"
"$MB" --version >/dev/null 2>&1 || "$MB" >/dev/null 2>&1
[ $? -ne 0 ] && [ $? -ne 1 ] && abort "  !! magiskboot tidak bisa jalan di device ini."
[ -f "$MODPATH/Image.gz-dtb" ] || abort "  !! Image.gz-dtb hilang dari zip, abort."

# --- unpack live boot ---
WORK="$TMPDIR/ancientlts-boot"
mkdir -p "$WORK"
cd "$WORK" || abort "  !! gagal masuk $WORK"
ui_print "  - backup + unpack boot.img ..."
dd if="$BLOCK" of=stock-boot.img bs=4096 2>/dev/null || abort "  !! baca boot block gagal."
cp -f stock-boot.img boot.img
"$MB" unpack boot.img >/dev/null 2>&1 || abort "  !! magiskboot unpack gagal."
[ -f kernel ] || abort "  !! format boot tak dikenal (tidak ada kernel)."

# --- swap kernel only ---
ui_print "  - pasang Ancient-LTS Image.gz-dtb ..."
cp -f "$MODPATH/Image.gz-dtb" kernel
"$MB" repack boot.img new-boot.img >/dev/null 2>&1 || abort "  !! magiskboot repack gagal."
[ -f new-boot.img ] || abort "  !! new-boot.img tidak terbentuk."

# --- backup stock, flash ---
mkdir -p /sdcard/Ancient-LTS
cp -f stock-boot.img "/sdcard/Ancient-LTS/stock-boot${SLOT}.img" 2>/dev/null || true
ui_print "  - flash new-boot.img ..."
dd if=new-boot.img of="$BLOCK" bs=4096 2>/dev/null || abort "  !! flash gagal, stock backup ada di /sdcard/Ancient-LTS/."

cd /
rm -rf "$WORK"
ui_print "  ================================"
ui_print "  Ancient-LTS R5Q terpasang."
ui_print "  Reboot untuk masuk kernel baru."
ui_print "  ================================"
