--- core/libs/rawengine/libraw/internal/libraw_x3f.cpp.orig	2016-08-08 17:19:25 UTC
+++ core/libs/rawengine/libraw/internal/libraw_x3f.cpp
@@ -1239,7 +1239,7 @@ static void huffman_decode_row(x3f_info_
                                x3f_directory_entry_t *DE,
                                int bits,
                                int row,
-                               int offset,
+                               int16_t offset,
                                int *minimum)
 {
   x3f_directory_entry_header_t *DEH = &DE->header;
