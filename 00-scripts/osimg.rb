#           00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f
hdstring = "eb 4e 90 48 45 4c 4c 4f 49 50 4c 00 02 01 01 00 " + # 00000000
           "02 e0 00 40 0b f0 09 00 12 00 02 00 00 00 00 00 " + # 00000010
           "40 0b 00 00 00 00 29 ff ff ff ff 48 45 4c 4c 4f " + # 00000020
           "2d 4f 53 20 20 20 46 41 54 31 32 20 20 20 00 00 " + # 00000030
           "00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 " + # 00000040
           "b8 00 00 8e d0 bc 00 7c 8e d8 8e c0 be 74 7c 8a " + # 00000050
           "04 83 c6 01 3c 00 74 09 b4 0e bb 0f 00 cd 10 eb " + # 00000060
           "ee f4 eb fd 0a 0a 68 65 6c 6c 6f 2c 20 77 6f 72 " + # 00000070
           "6c 64 0a"                                           # 00000080

imgsz = 0x168000
writecnt = 0

open(ARGV[0], "wb") {|dest|
  tmp = hdstring.split(' ').each{|str|
    hexch = str.hex
    dest.putc(hexch)
    writecnt += 1
  }

  (0x1fe - writecnt).times{
    dest.putc(0)
    writecnt += 1
  }
  dest.putc(0x55)
  dest.putc(0xaa)
  dest.putc(0xf0)
  dest.putc(0xff)
  dest.putc(0xff)
  writecnt += 5

  (0x1400 - writecnt).times{
    dest.putc(0)
    writecnt += 1
  }
  dest.putc(0xf0)
  dest.putc(0xff)
  dest.putc(0xff)
  writecnt += 3

  (imgsz - writecnt).times{
    dest.putc(0)
  }

}
