# Dosya Haritası

Bu klasör final raporu merkeze alacak şekilde düzenlenmiştir. Eski deneme dosyaları, taslaklar ve alternatif ANOVA dosyaları dahil edilmemiştir.

## Ana Dosya

- `final_proje.qmd`: Teslim ve Render için kullanılacak ana Quarto raporudur.

## Veri Dosyaları

- `data/01_m4_faktor_tasarimi.csv`: Deneyde kullanılan 16 faktör kombinasyonunu gösterir.
- `data/02_m4_sentetik_ham_veri.csv`: 32 gözlemli ham sentetik veri setidir.
- `data/03_m4_temiz_veri.csv`: Faktörleri ve kombinasyon etiketi düzenlenmiş analiz verisidir.
- `data/04_m4_uzun_veri.csv`: Grafik ve özetlerde kullanılan uzun format veri setidir.

## Çıktı Dosyaları

- `outputs/tables/`: Raporda kullanılan özet ve karar tablolarını içerir.
- `outputs/figures/`: Raporda kullanılan grafik görsellerini içerir.

## Script Dosyaları

- `scripts/00_paket_kontrol.R`: Gerekli R paketlerini kontrol eder.
- `scripts/01_sentetik_veri_uret.R`: Sentetik veri setini üretir.
- `scripts/02_veri_okuma_duzenleme.R`: Veriyi okur ve düzenler.
- `scripts/03_eda_ozet_tablolar.R`: Keşifsel analiz tablolarını üretir.
- `scripts/04_grafik_verileri_ve_grafikler.R`: Grafik dosyalarını üretir.
- `scripts/05_coklu_yanit_skoru.R`: Kalite indeksi ve karar tablosunu üretir.

## Yol Bilgisi

Dosyalarda kişisel bilgisayara özel sabit yol kullanılmamaktadır. Klasör başka bir bilgisayara taşındığında `M4_PROJE_FINAL.Rproj` ile açılması yeterlidir.

