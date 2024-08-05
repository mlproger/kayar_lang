import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:kayr_lang/screens/AboutEntity.dart';
import 'package:kayr_lang/screens/EntityScreens.dart';
import 'package:kayr_lang/screens/MainMenuScreen.dart';
import 'package:kayr_lang/screens/videoScreen.dart';
import '../server/api.dart';
import 'package:catcher/catcher.dart';

import 'dart:async';

final video_links = [
  [
    [
      "https://downloader.disk.yandex.ru/disk/4174571103e0feb93c43ae79fdb091b77a77968ecda7b9dab4611703d7194384/64690d56/fJYh421IwtlNhm0_WKcaqI0wCYNahuiOYDaaQt9Td66B2LsqGw3d3zIjJ7yjnOifUOMw7bjaPMqcviIcbeasPQ%3D%3D?uid=0&filename=%D0%BC%D0%B5%D0%B4%D0%B2%D0%B5%D0%B4%D1%8C.mp4&disposition=attachment&hash=nsp7ig%2BiND5OheyGU8K9HjPcYC%2B0jfHV5tE5Txg%2BE3%2BFSBv8RviNuW2jwQl3GyQWq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=28992740&hid=8cee8eaddef0cc345f1bf9c1122e1c29&media_type=video&tknv=v2",
      "https://downloader.disk.yandex.ru/disk/2db5b5e595b3b49a681089f0382ca6bfdcbd9b9fe5b966e0b6170f72f959eb99/64690e40/fJYh421IwtlNhm0_WKcaqPzJw8r4xb3L_sZDD3UdVTysn4Zu1xeUnE6hFJYshMrBT2B1uySk6tE5LfInLldvIQ%3D%3D?uid=0&filename=%D0%BC%D0%B5%D0%B4%D0%B2%D0%B5%D0%B4%D1%8C.mp4&disposition=attachment&hash=WV2nsLz8GmiVyuLlhhQ4nde7/XVZJ48LQpVdOodc8uuMoXR8se9ayDc/rdzN9WlZq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=57561531&hid=54235c248256abba1d1b6c8a44a5897b&media_type=video&tknv=v2"
    ],
    ["https://downloader.disk.yandex.ru/disk/d17aad69070c2555d3561bdee35fa0c1817e2787c8bf753bf66e7e1a91a50d15/64690e6e/fJYh421IwtlNhm0_WKcaqLatdU_lDbT8LBLdO98GniY-eCfF-8zt__GQs5Eo6uQJbJ2PABWz5WK81HfF677RRA%3D%3D?uid=0&filename=%D0%B5%D0%B2%D1%80%D0%B0%D0%B6%D0%BA%D0%B0.mp4&disposition=attachment&hash=v42WQ%2BTQCQrIZpadZpb7UnKtpydJ0G/5MdwfffSzahop/oPxgT/w%2BZBTtqdE96Krq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=14687687&hid=9ad9346926bd2e28cbf798bc0a36de10&media_type=video&tknv=v2"],
    ["https://downloader.disk.yandex.ru/disk/1fc5465209cd89ffc070f532453d9657858c91d087f323f50225be55afce98be/64690e92/fJYh421IwtlNhm0_WKcaqIFtG-2gds6vtJxwIu8Ai4YOY_oZQ7A_eCuBxxf60FsX9eRg6kCfGSV5btoUakqwVw%3D%3D?uid=0&filename=%D1%80%D0%BE%D1%81%D0%BE%D0%BC%D0%B0%D1%85%D0%B0.mp4&disposition=attachment&hash=SwIoFJZriz%2BWPT%2B6STBYEB0KMKZV3JR6bgsv8ckkwBuiENHLH6MYOy9OtwOAWJwFq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=30429422&hid=f51126ab7b079e45da38f2d94a9ab1d4&media_type=video&tknv=v2"],
    ["https://downloader.disk.yandex.ru/disk/b417e975336e8e513d302e7ad1516b5ba1fafd45ae6cb7f174347a86575b4fb4/64690eb8/fJYh421IwtlNhm0_WKcaqOyk-oT9OhH2eMjJ0765TJYuk5NG81XR5nKnTrVp2kCYUtHx4IAF4xuzvEm0mH3T2Q%3D%3D?uid=0&filename=%D1%80%D1%8B%D1%81%D1%8C.mp4&disposition=attachment&hash=%2BBa2TbGmCm1EoMCgV8QENvCCX0lFSpJ3ifTmi4CSPRJuwzh88a5wiwnkUNgdbmssq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=27962623&hid=11820410d35d9c67f3b55506442b6d11&media_type=video&tknv=v2"],
    ["https://downloader.disk.yandex.ru/disk/90f8d92e91fddcddb3dd76148fa3063b643e30b988bf9ec90e2d1eea14eaf41c/6469172c/fJYh421IwtlNhm0_WKcaqOVSUs2NCBSNxT3sw1SBfbsbiRWq2Bo9Xd8i9iWL8DbT_2tK0ZUp-whc_-KwGvma_w%3D%3D?uid=0&filename=%D1%81%D0%BE%D0%B1%D0%BE%D0%BB%D1%8C.mp4&disposition=attachment&hash=3k7kaz1so1plkhzBMCYxeR/NJI5Hf2/sTSSD/T/TObi7cH6pKU7wgmpshuAEeJtDq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=18091651&hid=ef8fcf511ca47b4a4eac6797233e560c&media_type=video&tknv=v2"],
    ["https://downloader.disk.yandex.ru/disk/3660ba4dc3c83e6b11042a685e6979ff845d7ee015babbcfb6c9a094aa373750/646913c4/fJYh421IwtlNhm0_WKcaqBJLKM9hD_QBUnwCrocl8I2KyDdSfj_HsUunDixxUDQswcQnhNLgTPTy995gH2Dcqg%3D%3D?uid=0&filename=%D0%BC%D1%8B%D1%88%D1%8C.mp4&disposition=attachment&hash=fFBKdlGvftikpCnNhw7lzjvdsYQNrWBcE2KA53PyQrJEvEimCX11XCtOUPggsHEQq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=22317740&hid=d11a9c76c9aa1917ccbaf62b6f0d92ba&media_type=video&tknv=v2"],
    ["https://downloader.disk.yandex.ru/disk/fa3ff9fea5ebabebea3ff55b81534dab3097e269fcac993806c88e732258a092/646913e0/fJYh421IwtlNhm0_WKcaqGl5IHoYpQTzIhugr46EtHeLWi_91GSOFhcHCQTYvkCrGOJnuHQxG5v4vEVnLMyZPA%3D%3D?uid=0&filename=%D0%BB%D0%BE%D1%81%D1%8C.mp4&disposition=attachment&hash=Ox9sqdnm36eGRhW2JA9LyjCrFEed0ylRjKdol64%2B946YCA2ovHi0xT9UGB32oZKuq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=17248730&hid=4518ed2ceec794f94bfc2552e27e0999&media_type=video&tknv=v2"],
    ["https://downloader.disk.yandex.ru/disk/490c122cfddb3b5cb59ef4bf486602f0462a8758195754b3d569bfbf78f164a2/646913fc/fJYh421IwtlNhm0_WKcaqIeKubhxlrab7pS_OLbmBckWr7WzGL06iNpbfnq-NFMZO1j7dqclwSPUIC0GdH4m8Q%3D%3D?uid=0&filename=%D0%BB%D0%B8%D1%81%D0%B0.mp4&disposition=attachment&hash=rGkIxdCkA%2BtYfQaC/7kietnesLD9JKONElQfSpGmjU3YkKcvEpYWVniqYCryHjVfq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=21848174&hid=ebd6609114512fc791275b000d53aa3b&media_type=video&tknv=v2"],
    ["https://downloader.disk.yandex.ru/disk/129ebe398d46539d052add10412f5b5d32002e607a9038a232632f1f7bf5b0cb/64691421/fJYh421IwtlNhm0_WKcaqJu_UHau1VEgavRL4_E45J7oNYxNcePtFR_hBWRGg9Z0IRirbnI8m_7N8kTPp42w5g%3D%3D?uid=0&filename=%D0%B2%D0%BE%D0%BB%D0%BA.mp4&disposition=attachment&hash=yRxZBZtDzne3Dus%2B146ATiwB9AVKadYjCA1ZYR%2BeHGAymIVzlixFceFDOhV0no83q/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=16418605&hid=b43d5e3041f77daec37c4ba68d046779&media_type=video&tknv=v2"],
    ["https://downloader.disk.yandex.ru/disk/72286b618fc948e692b7e1d372fb80eb9ff337f48caf349e43587630ba3a2f23/6469143a/fJYh421IwtlNhm0_WKcaqDhGOJzr7Ng2suxvk45o3et5IeP8wvb2TBezgNRMQ0roj2_9Kg9F7nwNDUbvIaAEuw%3D%3D?uid=0&filename=%D0%B7%D0%B0%D1%8F%D1%86.mp4&disposition=attachment&hash=FyZkAZ938dkowqxSCqtfLG0MuSJTKZo9Upn6F/k11b2Q1b5di1irJNkOfVndLEi2q/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=19849070&hid=2422aa681bca23f408ea77a17e55903d&media_type=video&tknv=v2"],
    ["https://downloader.disk.yandex.ru/disk/99d58390f63a2a92a813ca6cc1031339307443ef7aead8edd562ccbcf0f24582/64691453/fJYh421IwtlNhm0_WKcaqFPogSRwbMLI1Ew9ryHSwgd7yFnbVQoCSpCLNal-M8gN5tp0NVaI-hvlZZ626C-FhQ%3D%3D?uid=0&filename=%D0%B3%D0%BE%D1%80%D0%BD%D1%8B%D0%B9%20%D0%B1%D0%B0%D1%80%D0%B0%D0%BD.mp4&disposition=attachment&hash=mwLFy/QpyuXX/b1v2fXyOqVR7q0aURGYkO1D4Q13FktbfOjcaiA8B13av%2BqR3cHWq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=15724201&hid=7f04a629a5e545fafb67cae1afa99c4b&media_type=video&tknv=v2"],
    ["https://downloader.disk.yandex.ru/disk/483ae2d300c8ef7ed734775705365172638309d5b8615cc590fe1edaced1d1d6/6469178e/fJYh421IwtlNhm0_WKcaqJlX-up6_wsu3xig3AearhU4IsQBq72htyYo3n7ORDFJl2YIN3Ux3jJwiG_cxVm1Uw%3D%3D?uid=0&filename=%D0%BF%D0%B5%D1%81%D0%B5%D1%86.mp4&disposition=attachment&hash=NjIdvzePXSRhs0WeKUF4uGsXs4q0bucLpHoDQluOUGS9XGyidK1DEQIVYPRHex/oq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=25574753&hid=1dec523cd280f6592a9f28ab23374e76&media_type=video&tknv=v2",],
    ["https://downloader.disk.yandex.ru/disk/3bf8b134f59298968efb0f011f4b8c1fdc06bb2ad2a9d6d4334e9c196a777c02/646917d7/fJYh421IwtlNhm0_WKcaqLH0qr2kp5Yo1Ivczj6MJqVbdp3995RW6-k_Seu7tB0-OxlZXp-1Ub_MwsdIEPZ3yw%3D%3D?uid=0&filename=%D1%81%D0%BE%D0%B1%D0%B0%D0%BA%D0%B0.mp4&disposition=attachment&hash=sUnrShE7Nc77zj53dNVcwpYn1lrpfdcZPaVQFF1noOMLmjomHzxAQqaG9Rb4BFP5q/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=19716687&hid=ad399da826d38fb114fd6d72b8273ceb&media_type=video&tknv=v2"],
    ["https://downloader.disk.yandex.ru/disk/3fe151709c9cd19b071af714f4bd709a44b2b0c8e3b6fe13eb5225f9c66ad07b/646917ec/fJYh421IwtlNhm0_WKcaqGltjCDX1FJELkvD4cjtSvqWnPOw0M-X41AFuV6FKL73Y_fl6W7NDrC1Q1SHpAkqXQ%3D%3D?uid=0&filename=%D0%9E%D0%BB%D0%B5%D0%BD%D1%8C.mp4&disposition=attachment&hash=VTEufiozuHybTrPK7NfKzipJFt46kfr/l4Brl7WOGFTPtO2XYM%2B8G6kGLGNGSe8Aq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=44441149&hid=204801bf36618d96b1b2da82e3bcf554&media_type=video&tknv=v2"]

  ],

  [
    ["https://downloader.disk.yandex.ru/disk/ba28547f07216b78e831f1a0fe9f59dc71771ed5b9b3800aebbe28bc5e794212/64691c5c/fJYh421IwtlNhm0_WKcaqGOayC947udDGJoz5cVgsbrmBvyh2GWM0RoDYstU1s31Bn3wbBhHFPgnNubD8LWFPw%3D%3D?uid=0&filename=%D0%BC%D1%83%D1%85%D0%B0.mp4&disposition=attachment&hash=1TB605KLTabVcq8I5YsJHjQALR2nKaJLF4n/pAhPh8dYVagHBPSfhq/%2BICstRj5tq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=20051605&hid=bace1de25bd17c0602ce2f60466203db&media_type=video&tknv=v2"],
    ["https://downloader.disk.yandex.ru/disk/eb5761de2255e420130a6817178f0e8716fe25a7372325490d2e35165361ffcb/64691c8f/fJYh421IwtlNhm0_WKcaqBsGeLV2-JglLMrOT4Xto6YkPzmRinSp1MAv7E_fBrGRmGJFu1B4kAGjho0IxurXFQ%3D%3D?uid=0&filename=%D0%B1%D0%B0%D0%B1%D0%BE%D1%87%D0%BA%D0%B0.mp4&disposition=attachment&hash=whY7z1hFPOXYAgxDAmiUJvo7zIoi/WE%2BgUvmQ8/F60LvMcDrrhjoZpUyKLSa3xIyq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=20426947&hid=0fe9880f815a3fbba1f5ae62202908d2&media_type=video&tknv=v2"],
    ["https://downloader.disk.yandex.ru/disk/d11ef3277f4ab7676cbe19f349aeea8e84162afa08296349fe95be7ead6634b8/64691ca9/fJYh421IwtlNhm0_WKcaqI8MkL5j3Z8CAIfEhBD6nA62lLP8uspzDr9Y7KwgvIak2sNMNTCTEEIZb3hOKyblrA%3D%3D?uid=0&filename=%D0%BE%D1%81%D0%B0.mp4&disposition=attachment&hash=gs7Ge2URvQicY5Q1ot4s7XjbjbLgynluHJU50BGySRWs50Dz3GxS2f5P5N5rI05Qq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=13440987&hid=aff009dec86e8d7ed00cbccb5fe87be0&media_type=video&tknv=v2"],
    ["https://downloader.disk.yandex.ru/disk/0de6eb8a6e940f63314f1a7f5d9a410a6428c33f1ad73a6cfaa9d4f115671001/64691cc0/fJYh421IwtlNhm0_WKcaqEoAQ78Hx0G3UvuqK4wrLGyNSOVUiCjxVHvgnJvyjAdfWCnfnb-ZtMB6UftpuJbtZw%3D%3D?uid=0&filename=%D0%9A%D0%BE%D0%BC%D0%B0%D1%80.mp4&disposition=attachment&hash=%2ByPaF7t8JhpexQfmkpYPgxESR8DxG6lcZraMI6M/TwnL0zh67UJkep5UbUruGgQfq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=16397163&hid=35494a048382b23d83d297f39ad23fe6&media_type=video&tknv=v2"],
    ["https://downloader.disk.yandex.ru/disk/bf4624fb168f5af3a45946179d2facf73213d8cbf44bbf97c582fe5263fb74ce/64691cdd/fJYh421IwtlNhm0_WKcaqPDerJvyr-TFF_txl4xRowE0SIZ5YmWCF8F-zArNJ6qNu6dgZBHV6skhQUVr1FPAPQ%3D%3D?uid=0&filename=%D0%BC%D0%BE%D1%88%D0%BA%D0%B0.mp4&disposition=attachment&hash=V2NW50j8u9N45FIEFT1cBbqaVWEt/Xl6slwESXhUtqCPofK7tb7k4WVD/6uW8g9jq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=10711460&hid=9e1e9369e156b139fb9b663ba2dfcf4d&media_type=video&tknv=v2"],
    ["https://downloader.disk.yandex.ru/disk/4934bbe1b8538535d0777afe5904a8b35050f3c32091d4f4a680e087a8acf7d6/64691cf5/fJYh421IwtlNhm0_WKcaqFDysUCsQtr334a3lTXiwZI0iY4inuZ6WJTQ9xiJ-mPF7gs8lArE4cBNWCpOuSuh5A%3D%3D?uid=0&filename=%D0%BF%D1%87%D0%B5%D0%BB%D0%B0.mp4&disposition=attachment&hash=Mi/IFdgnKGsxm9Ff5jWzTHFwGSYQL1/hMjBJLXCiGzmm2B7II3NIfBSMqjb3q98uq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=9941833&hid=0eae12f6cd29d5178083a56e888c13ab&media_type=video&tknv=v2"],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
  ],

  [
    ["https://downloader.disk.yandex.ru/disk/327c72f1266a487447490eedc46d93304eed2ae39e6f8c59214f6949d10fcaa8/64691851/fJYh421IwtlNhm0_WKcaqN9vZaAcXSUSKHpwmLUSVd_Xg7Aar7fAMknGDgkpu3dEMIrvFNZ8QOoF97EcnB9X-Q%3D%3D?uid=0&filename=%D0%B3%D0%B0%D0%B3%D0%B0%D1%80%D0%B0.mp4&disposition=attachment&hash=11HV18m%2BG%2BphOOWmb5UPSJxDRU%2BXtkoQ1gZI%2BIbfQgmewa5Mo7WKa1X5Bf/TqTZGq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=72270344&hid=4f1e4d8f25b7d3766efa5c9aaf78ea4e&media_type=video&tknv=v2"],
    ["https://downloader.disk.yandex.ru/disk/e6719181b096831e61d84a2e3921763668e57a4d2a24c115301948fbf99cc7dc/64691886/fJYh421IwtlNhm0_WKcaqCdYxTntj4cNwRt2l0S28r1uusYwUyiIbL-KZWC52HIygcRmcb4F2apl5B-DBB2kFg%3D%3D?uid=0&filename=%D0%B2%D0%BE%D1%80%D0%BE%D0%BD.mp4&disposition=attachment&hash=YjEYyjnwtWYecT08irSJpwrm4uvrYrHvyK9eKBbW/rkptvdg/LiVN9n3KeTHL7Mtq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=34542213&hid=1bd3b4fd73d75429aa678c443322459a&media_type=video&tknv=v2"],
    ["https://downloader.disk.yandex.ru/disk/008e033c4ea22af286c38ee7f890ef31ae5f0dc55c04968bd7a1be9d0312c583/646919bb/fJYh421IwtlNhm0_WKcaqHBvnA7-BxZq0PqZggTQCdOUQF4VWX6lmIrRrntS2Po_uTRqcCcYqRksiCD5Yp9UwA%3D%3D?uid=0&filename=%D0%BB%D0%B5%D0%B1%D0%B5%D0%B4%D1%8C.mp4&disposition=attachment&hash=j0lphg/7KjlSoFbpzfCh18PihBBQjWdzvRzEX3wgCbSQ4m7AcSKzwmFgX%2BhK4ErOq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=29782011&hid=e5a9004a0c7bf5aebc50562c47b91032&media_type=video&tknv=v2"],
    ["https://disk.yandex.ru/i/QtLEOnmqSmJQew"],
    ["https://downloader.disk.yandex.ru/disk/d1a422e4329b888aed99d72947e13dd0df2c4ccdb98a9e72996d75615b597e4c/646918c3/fJYh421IwtlNhm0_WKcaqPnn3n5x7Za4GeG7o51MYc3YuCe4-jwp8bnKn3U71aopRuwYVRdrNPtfvJx7qQDb_Q%3D%3D?uid=0&filename=%D0%BA%D1%83%D0%BA%D1%83%D1%88%D0%BA%D0%B0.mp4&disposition=attachment&hash=i7IyDuDOVi7rP5CHTR6eV9DBi%2B1FZ2l%2BycZtupS26BUkUAkkSZCPpnPssR1oppchq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=15596882&hid=50c1f78736631121f179ec6c242165d3&media_type=video&tknv=v2"],
    ["https://disk.yandex.ru/i/QtLEOnmqSmJQew"],
    ["https://downloader.disk.yandex.ru/disk/bbb946051bcab56c4160fcd69a31f8a6b6c5d057225b7c3714aa9d2f423b4b00/646918fb/fJYh421IwtlNhm0_WKcaqLg4wPyUkUJSox6GU1hhT1AdYA0whfNkc7TkG7l2SZ2OupKpqbU-gQb7jY1DlN2mKA%3D%3D?uid=0&filename=%D0%BA%D1%83%D1%80%D0%BE%D0%BF%D0%B0%D1%82%D0%BA%D0%B0.mp4&disposition=attachment&hash=8nzhavKhZiIM2SpWtnhTlDU9Blfi8zMU%2BurJp6YoGO7R7R%2B1csxysEPS9CBe%2Bh7oq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=21963792&hid=4c5aae6849c2723ab08f6e7729c61990&media_type=video&tknv=v2"],
    ["ttps://downloader.disk.yandex.ru/disk/88e81ac9c62eaef39c8abb392287f126a5abe239be1e0dce0bd3691680bd4f5f/64691918/fJYh421IwtlNhm0_WKcaqKrm_Qbpuy2oXxw4iYofhQqyQy_C-jG_T13aJ6_AefCjkAzO3C7nNQu8pWgmaki02A%3D%3D?uid=0&filename=%D1%81%D0%BE%D1%80%D0%BE%D0%BA%D0%B0.mp4&disposition=attachment&hash=6MrLeZwDqIwEAdrcpzw/hLSThWIHMCzPRL/EXhiuvfC%2BD4wacUDNSSjcl9HQB6IOq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=29051176&hid=93a74290958252e7d99d1751e5fe9177&media_type=video&tknv=v2"],
    ["https://downloader.disk.yandex.ru/disk/9e91e06258b86f42961eb17289abf86e4d3a5b3b5063736fde670a970f9a6ba4/64691933/fJYh421IwtlNhm0_WKcaqK4DJ7jJiAJ4_hgeaTAZZs_slJxqw1A10wvZLVHTY0_CPBhFNk2SasgSMMuky0828w%3D%3D?uid=0&filename=%D1%87%D0%B0%D0%B9%D0%BA%D0%B0.mp4&disposition=attachment&hash=MPR3yWtOog9WDKe0fI1J/LP0Aw9cI6BhXgIKUD6cQXwxAPXL5tW4EiWkHqJQzP6Pq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=35751745&hid=7facc21f85a560f28810b6cb3e3d51f7&media_type=video&tknv=v2"],
    ["ttps://downloader.disk.yandex.ru/disk/289bce417ae63499ab713c0d9f66b05e3ee616709720cea8a1b6ed70e2068f7b/64691949/fJYh421IwtlNhm0_WKcaqK3Vvar2WU4n8EkndsBGfYyicyslaQs-OMvaOV7PTQNNnpT3My253ynYKnUhbc4XnQ%3D%3D?uid=0&filename=%D1%81%D0%BE%D0%B2%D0%B0.mp4&disposition=attachment&hash=phSMmx9VdEbJ0C8D6PgH5f/HNVaEmWlcAuTb/Kg2qayIvcyHIyd5AtSMMjQ%2Buodbq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=15914551&hid=a62267348f437f526b426672eb3ad723&media_type=video&tknv=v2"],
    ["https://downloader.disk.yandex.ru/disk/4597cbb5e9917a12d62bc3c5914cb5284ea2860c06f4557a25fa9231484c83ee/64691964/fJYh421IwtlNhm0_WKcaqO3gDg3c5ww9b0IOffPbObNiic7gNLFuN1dEhVmGweNFbnJ7mOex65oV8jAA0xI5ng%3D%3D?uid=0&filename=%D1%83%D1%82%D0%BA%D0%B0%20%D0%B3%D0%B0%D0%B3%D0%B0.mp4&disposition=attachment&hash=1QRtiaKF8mpSYR/f%2BRKcebdCJV%2BgVo6iVxzWAm/rrTyXvhAf/Dh25iP7VyT0r8ffq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=23483504&hid=d693f165e405e934bc2f55b32b93a186&media_type=video&tknv=v2"],
    ["ttps://downloader.disk.yandex.ru/disk/ab582700d6b6a309139eb3fb8afb72d90fa386a3c2242547a4cccf394e89ca23/6469197a/fJYh421IwtlNhm0_WKcaqJIKIOMRDA5Kpr1FzUXkYNKKygqegRFNT1oSeof518RCU-KTVhzcQQdpBLWmwjLYSQ%3D%3D?uid=0&filename=%D0%B6%D1%83%D1%80%D0%B0%D0%B2%D0%BB%D1%8C.mp4&disposition=attachment&hash=lBKx8GGNpi2g4zVsWmJYb8NgWGSKHydbKGtKP1Snh5SaHO/h2HgxuqDb9C5hon9Tq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=28715767&hid=0b4d4cabff09dd61ae9e4f06c8ba1f32&media_type=video&tknv=v2"],
    ["https://downloader.disk.yandex.ru/disk/d421b86629b2719fbd1d5051c47047b67bc8285c0a2fee8f6a4038cc65a5dd2a/64691999/fJYh421IwtlNhm0_WKcaqIBRCU54behCQoHvjsYpqZtFLGl3_Rsp5syFScKKY2xfCdMX6Hu7-Ii9ianHMOjNUw%3D%3D?uid=0&filename=%D0%B3%D0%BB%D1%83%D1%85%D0%B0%D1%80%D1%8C%20%28%20%D0%9A%D0%B0%D1%80%D0%B8%D0%BD%D0%B0%20%D0%B8%20%D0%90%D0%BB%D0%B5%D0%BA%D1%81%D0%B5%D0%B9%20%29.mp4&disposition=attachment&hash=TAKkQOvQqVFLPk5QbJDuzScsABx9fRMoF50DjjrII3LUen9/O6eRAgJJowFjJXVIq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=41889834&hid=6b0c46a29961bf1908953ce167612e69&media_type=video&tknv=v2"],

  ],

  [
    ["https://downloader.disk.yandex.ru/disk/9cf217873035595543b04bd81fe1ca0314b989401c63d24896c93c4039ae5ad3/64691a31/fJYh421IwtlNhm0_WKcaqEm1LmiNTiSquS-JoyIzs6YtvmijUYaWHlAICSbLvUY-BvaJsJbIK-tvsC62zTcBuQ%3D%3D?uid=0&filename=%D1%80%D1%8B%D0%B1%D0%BA%D0%B02.mp4&disposition=attachment&hash=cab9/UhALeu%2BS1dRbXCAwabAPbOzNExWf3Zp0E5WBzrfepoGqrjWIhnQBcNp42WBq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=58560788&hid=fae2228eaf66d8157afb15940a4058af&media_type=video&tknv=v2"],
    [],
    ["https://downloader.disk.yandex.ru/disk/72c8e17fc0d4b784c639bb836b5efc9b5276a130c277f0b5b27103fef55327b8/64691a53/fJYh421IwtlNhm0_WKcaqA7u0P-9eB_-pe6QTjqC4FUB0w8Ltuy3vJo-9Ten923-4L5Kt3JPFLzDY0PPuAMkCw%3D%3D?uid=0&filename=%D0%BF%D0%B0%D0%BB%D1%82%D1%83%D1%81%20%D0%B8%20%D0%BA%D0%B0%D0%BC%D0%B1%D0%B0%D0%BB%D0%B0.mp4&disposition=attachment&hash=9eMCOp5TF57A3V9HIw2keIFREXRB8jHJ6%2BUoG56cIR454tllg7P5SAlB0PQgvY%2Bmq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=42498054&hid=3ecc278f8020db74fba933d64d0dd7bd&media_type=video&tknv=v2"],
    [],
    [],
    [],
    [],
    [],
    [],
    ["https://downloader.disk.yandex.ru/disk/a247aa3d3b7fad29e4fa8590102b7da567602976c5c1ba20f510b0bbc98875c5/64691b15/fJYh421IwtlNhm0_WKcaqOYO_C_PQsTPwmpSemIgzAfWR5qdlCnzhhqVbhNib2olHbrCcCEmHc4AwVs4-TIGyw%3D%3D?uid=0&filename=%D1%81%D0%B8%D0%B2%D1%83%D1%87.mp4&disposition=attachment&hash=Dib09qu2%2BT2xVDT/FSjbEMZzZSUASS0hQcMd6y/kY4DrtPVNTDUTEjJM7D70nevIq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=33584625&hid=a3b3352f38340d15dc29497e5322bd63&media_type=video&tknv=v2"],
    [],
    ["https://downloader.disk.yandex.ru/disk/361a8efc50acc433fcadb61ae01dfc8410827e5db02945a52b5b711a011ea084/64691b35/fJYh421IwtlNhm0_WKcaqP9jUivjBAPSET_oxgf3V9YsrKvGnb-6YWN-MqOcfrsac0ZJ7Eqz2ACa-VsS5GrufQ%3D%3D?uid=0&filename=%D0%BD%D0%B5%D1%80%D0%BF%D0%B0.mp4&disposition=attachment&hash=BjYKcIzHKtgRzrazzcfmrKhOw/E7O1jxk3cWBZ2Npq9tQtKuyxIDE5yP1SYlw3lSq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=44319771&hid=ff540fad35059004fd14a9bb5eab538d&media_type=video&tknv=v2",
      "https://downloader.disk.yandex.ru/disk/785bc320acfd6ed6ee62d90f4677a76dc90a49aff7eea20bf6920b792144ea38/64691b50/fJYh421IwtlNhm0_WKcaqLXtRagkA2YtO_nfK26MUZBeEdK6nWdP2FgLU5hbVKKqDRE5XCBMUijPyWqQ1G9WtQ%3D%3D?uid=0&filename=%D0%BD%D0%B5%D1%80%D0%BF%D0%B0.mp4&disposition=attachment&hash=%2BIs1m58KVZhvNEG03HAG5KGHrtPCW3KVyvXqgASsl7MJ/bT%2BZCnWFb2DAC5Wb1etq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=71399788&hid=740302782c6ee2f5232de7446077ef00&media_type=video&tknv=v2"],
    ["https://downloader.disk.yandex.ru/disk/5ba63f9704a92ee7ca1abbeb9ad19b6361892c2dfded2e1877557d7f7b7ba2c8/64691b72/fJYh421IwtlNhm0_WKcaqIfKKFAkEVGSWaKavkNAGMmE6xGK9GmS1j6UbZPzbnIo-k7crR5HxmuCtm3nMAPOFg%3D%3D?uid=0&filename=%D0%BA%D0%B0%D1%81%D0%B0%D1%82%D0%BA%D0%B0.mp4&disposition=attachment&hash=l0wf%2BM90QuldV8RmDmPdUteY6c2Tf/5U1NhLyR33TmYD/JYjYqx8eDDEtmSuLBgmq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=38058369&hid=8095a94efbd703a0583ca89aa2510eee&media_type=video&tknv=v2"],
    ["https://downloader.disk.yandex.ru/disk/bfdb345a314a13999ddbe1d39350f7d4319c5fafdf2ea71dfbd8e4204ca3cb24/64691b8f/fJYh421IwtlNhm0_WKcaqA0mUeZ6MDjCbgNKjrCIjXheB1u84nbae6VT8TZV5iKXsQdAvp0JcrxbrzBTJEyGbQ%3D%3D?uid=0&filename=%D0%BA%D0%B8%D1%82.mp4&disposition=attachment&hash=GrLGdJfZdPMOWXJ1yNXMEs0stc5t2Md82sLfOW3OE83ikqkxwTMdZVKKH8%2B2pEEoq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=17641421&hid=487b32ccd4925cd81424d15195591b0d&media_type=video&tknv=v2"],
    ["https://downloader.disk.yandex.ru/disk/652b7070f323d1ddc5bdd7a2de1d5ff9ed460c15c610ae75a65e0ddcae255b74/64691ba6/fJYh421IwtlNhm0_WKcaqORGzuefZu4hXAhbtbHFYvYPkG1GbJvUydgsssDYuNMKW4Mf92y3JPX8muWm5PfylQ%3D%3D?uid=0&filename=%D0%BA%D1%80%D0%B0%D0%B1.mp4&disposition=attachment&hash=SZPlhyIIu/P6C9UZ7yLztbI6T2TIVdiFZ0VD2OXiWT8Kn1R6EUwK9luzVBuzyMaeq/J6bpmRyOJonT3VoXnDag%3D%3D%3A&limit=0&content_type=video%2Fmp4&owner_uid=1801615430&fsize=20672394&hid=803b3c19bc6b17b4ab51307a965d53c3&media_type=video&tknv=v2"],
    [],
    [],
    [],
    []
  ],

  [
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    []
  ],

];


final links = [

  [
    ["https://disk.yandex.ru/i/0rJTlgY8vetTtw", "https://disk.yandex.ru/i/P8Yl0RQZBGYr6w"],
    ["https://disk.yandex.ru/i/OK99p0RnyihFQg"],
    ["https://disk.yandex.ru/i/3QyYx0XrUXHhMA"],
    ["https://disk.yandex.ru/i/atWVscqI5u_Ujg"],
    ["https://disk.yandex.ru/i/a-5Do99tshb2mg"],
    ["https://disk.yandex.ru/i/2Jtlc0uBbf3BZQ"],
    ["https://disk.yandex.ru/i/ZVOQMlQuJkIJMA"],
    ["https://disk.yandex.ru/i/_lBTX7cNi4lkeQ"],
    ["https://disk.yandex.ru/i/TAFBTGNvk8Jllw"],
    ["https://disk.yandex.ru/i/K7HWDQoezil5XA"],
    ["https://disk.yandex.ru/i/9s6Azs6LmeqNXA"],
    ["https://disk.yandex.ru/i/jCYTwu4SPJ0Mcg"],
    ["https://disk.yandex.ru/i/P_fwbx9uU4wbmw"],
    ["https://disk.yandex.ru/i/RAWzYOJrnQp7rw"],
  ],

  [
    ["https://disk.yandex.ru/i/HzKbLTJzwyknyg"],
    ["https://disk.yandex.ru/i/PyAHLH29AnUT_g"],
    ["https://disk.yandex.ru/i/Fou-_G0FQjki8Q"],
    ["https://disk.yandex.ru/i/c00YUf-KP6EfjA"],
    ["https://disk.yandex.ru/i/RWN5KwoiAzalQA"],
    ["https://disk.yandex.ru/i/81Ev5WyZmdcvdw"]
  ],

  [
    ["https://disk.yandex.ru/i/GFBKDD-bCsxndA"],
    ["https://disk.yandex.ru/i/hGW7CxZlwVNCKA"],
    ["https://disk.yandex.ru/i/rTgpUlAIaiyGcQ"],
    ["https://disk.yandex.ru/i/QtLEOnmqSmJQew"],
    ["https://disk.yandex.ru/i/iykjFEnA9tgIKg"],
    ["https://disk.yandex.ru/i/ndIIoBijsDSS-A"],
    ["https://disk.yandex.ru/i/W_wgf3zs9f4rmg"],
    ["https://disk.yandex.ru/i/ThqP4006NxJZ8A"],
    ["https://disk.yandex.ru/i/ASA9ARjMd6-TKg"],
    ["https://disk.yandex.ru/i/X3Sz1razVYmk9g"],
    ["https://disk.yandex.ru/i/P11Cu1atLhzTjA"],
    ["https://disk.yandex.ru/i/5WLmBaIzx7_trg"],
    ["https://disk.yandex.ru/i/sH-hlU03-_5ycQ"]
  ],

  [
    ["https://disk.yandex.ru/i/F64lnr052b_T1w"],
    [],
    ["https://disk.yandex.ru/i/nHxSosnD_yPpxw"],
    [],
    [],
    [],
    [],
    [],
    [],
    ["https://disk.yandex.ru/i/KY3sGvYUbLSDKw"],
    [],
    ["https://disk.yandex.ru/i/dCsj-MEo8FLfkA", "https://disk.yandex.ru/i/nNbdpnk_aYSMfg"],
    ["https://disk.yandex.ru/i/YS1pgw_33PYd7Q"],
    ["https://disk.yandex.ru/i/8kzvWPQ-XQbu1A"],
    ["https://disk.yandex.ru/i/YoyxiRJk5R-_Jg"],
    []
  ],

  [
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    []
  ],

];

final animals = [
  'Рассказ о \nмедведе',
  'Рассказ о \nевражке',
  'Рассказ о \nросомахе',
  'Рассказ о \nрыси',
  'Рассказ о \nсоболе',
  'Рассказ о \nмыши',
  'Рассказ о \nлосе',
  'Рассказ о \nлисе',
  'Рассказ о \nволке',
  'Рассказ о \nзайце',
  'Рассказ о \nгорном баране',
  'Рассказ о \nпесце',
  'Рассказ о \nсобаке',
  'Рассказ об \nолене'
];

final insects = [
  'Рассказ о \nмухе',
  'Рассказ о \nбабочке',
  'Рассказ об \nосе',
  'Рассказ о \nкомаре',
  'Рассказ о \nмошке',
  'Рассказ о \nпчеле'
];

final birds = [
  'Рассказ о \nгагаре',
  'Рассказ о \nвороне',
  'Рассказ о \nлебеде',
  'Рассказ об \nорле',
  'Рассказ о \nкукушке',
  'Рассказ о \nкречете',
  'Рассказ о \nкуропатке',
  'Рассказ о \nсороке',
  'Рассказ о \nчайке',
  'Рассказ о \nсове',
  'Рассказ об \nутке',
  'Рассказ о \nжуравле',
  'Рассказ о \nглухаре'
];

final fishes = [
  'Рассказ о \nнерке',
  'Рассказ о \nгольце',
  'Рассказ о \nкорюшке',
  'Рассказ о \nнаваге',
  'Рассказ о \nхариусе',
  'Рассказ о \nкижуче',
  'Рассказ о \nчавыче',
  'Рассказ о \nкете',
  'Рассказ о \nкамбале',
  'Рассказ о \nсивуче',
  'Рассказ о \nпалтусе',
  'Рассказ о \nнерпе',
  'Рассказ о \nкосатке',
  'Рассказ о \nките',
  'Рассказ о \nкрабе',
  'Рассказ о \nщуке',
  'Рассказ о \nгобуше'
];



final animals2 = [
  'Исполнение медведя',
  'Исполнение евражки',
  'Исполнение росомахи',
  'Исполнение рыси',
  'Исполнение соболя',
  'Исполнение мыши',
  'Исполнение лося',
  'Исполнение лисы',
  'Исполнение волка',
  'Исполнение зайца',
  'Исполнение горного барана',
  'Исполнение песца',
  'Исполнение собаки',
  'Исполнение оленя'
];

final insects2 = [
  'Исполнение мухи',
  'Исполнение бабочки',
  'Исполнение осы',
  'Исполнение комара',
  'Исполнение мошки',
  'Исполнение пчелы',
];

final birds2 = [
  'Исполнение гагары',
  'Исполнение вороны',
  'Исполнение лебедя',
  'Исполнение орла',
  'Исполнение кукушки',
  'Исполнение кречета',
  'Исполнение куропатки',
  'Исполнение сороки',
  'Исполнение чайки',
  'Исполнение совы',
  'Исполнение утки',
  'Исполнение журавля',
  'Исполнение глухаря',
];

final fishes2 = [
  'Исполнение нерки',
  '',
  'Исполнение наваги',
  '',
  '',
  '',
  '',
  '',
  'Исполнение камбалы',
  'Исполнение сивуча',
  'Исполнение палтуса',
  'Исполнение нерпы',
  'Исполнение косатки',
  'Исполнение кита',
  'Исполнение краба'
  '',
  '',
];

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  Catcher(runAppFunction: () {
    runApp(const MyApp());
    },
    
  );
  
  for (int i = 0; i < links.length; i++) {
    for(int j = 0; j < links[i].length; j++){
      if(links[i][j].length == 1){
          var href = await getLink(links[i][j][0]);
          video_links[i][j][0] = href;
          print(i);
        }
      else if(links[i][j].length == 2){
        var href1 = await getLink(links[i][j][0]);
        var href2 = await getLink(links[i][j][1]);
        video_links[i][j][0] = href1;
        video_links[i][j][1] = href2;
      }
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Этно-карточки',
      home: AnimatedSplashScreen(
        duration: 3000,
        nextScreen: MainMenuWidget(), 
        splash: Image(image: AssetImage('assets/img/phone.jpg'), fit: BoxFit.fitHeight,),
        splashIconSize: double.infinity,
        splashTransition: SplashTransition.fadeTransition,
      ),
      routes: {
        "/currentEntity": (context) => const AboutEntityWidget(),
        "/entityList": (context) => const EntityListWidget(),
        "/numsScreen": (context) => const EntityListWidget()
      },
    );
  }
}

