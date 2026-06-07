# M4 Sentetik İş Analitiği Projesi

Bu klasör, MUY665 İş Analitiği dönem projesi için temiz paylaşım paketidir. Gereksiz taslaklar ve eski deneme dosyaları çıkarılmıştır.

## İçerik

- `final_proje.qmd`: Quarto ile render edilecek final proje raporu.
- `data/`: Analizde kullanılan veri dosyaları.
- `outputs/figures/`: Raporda kullanılan grafikler.
- `outputs/tables/`: Raporda kullanılan özet ve karar tabloları.
- `scripts/`: Veriyi ve grafikleri yeniden üretmek için R scriptleri.
- `M4_PROJE_FINAL.Rproj`: RStudio proje dosyası.

## Nasıl Açılır?

1. Klasörü bilgisayarda herhangi bir yere çıkarın.
2. `M4_PROJE_FINAL.Rproj` dosyasını çift tıklayarak RStudio ile açın.
3. RStudio içinde `final_proje.qmd` dosyasını açın.
4. Üstteki **Render** butonuna basın.

## Paketler

Projede şu R paketleri kullanılmıştır:

- `readr`
- `dplyr`
- `tidyr`
- `stringr`
- `ggplot2`
- `knitr`

Paket eksikse RStudio Console'da şunu çalıştırın:

```r
source("scripts/00_paket_kontrol.R")
```

## Yol Değiştirmek Gerekir mi?

Hayır. Scriptlerde sabit bilgisayar yolu kullanılmamaktadır. Klasör nereye taşınırsa taşınsın, `M4_PROJE_FINAL.Rproj` ile açıldığında dosya yolları göreli olarak çalışacaktır.

## Önemli Not

Bu projedeki veri gerçek saha/test ölçümü değildir. Veri seti, mühimmat kullanmayan elektronik eğitim simülatöründe geri tepme davranışını temsil etmek amacıyla oluşturulmuş sentetik/senaryo tabanlı deney verisidir.

