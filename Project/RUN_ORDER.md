# R Script Çalıştırma Sırası

Normalde sadece `final_proje.qmd` dosyasını Render etmek yeterlidir. Veriler, tablolar ve grafikler klasörde hazır bulunmaktadır.

Analizi baştan üretmek gerekirse RStudio içinde şu sırayla çalıştırın:

1. `scripts/00_paket_kontrol.R`
2. `scripts/01_sentetik_veri_uret.R`
3. `scripts/02_veri_okuma_duzenleme.R`
4. `scripts/03_eda_ozet_tablolar.R`
5. `scripts/04_grafik_verileri_ve_grafikler.R`
6. `scripts/05_coklu_yanit_skoru.R`

Sonra tekrar:

RStudio'da `final_proje.qmd` açıkken **Render** butonuna basın.
