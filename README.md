# 🌟 AETHER-X: Bio-Symbiotic AI Environment

## 📋 Proje Durumu

✅ **Kod Durumu:** Temiz (0 hata, 0 uyarı)  
✅ **Bağımlılıklar:** Güncel (33 paket güncellendi)  
✅ **Web Uyumluluğu:** Düzeltildi  
✅ **Android Gradle:** 8.7.3 / Kotlin 2.1.0  
⚠️ **APK Build:** RAM yetersizliği nedeniyle yerel sistemde başarısız

---

## 🚀 Kurulum ve Çalıştırma

### Gereksinimler
- Flutter SDK 3.27+ 
- Dart SDK 3.10+
- Android Studio / VS Code
- **En az 8GB RAM + 8GB Sanal Bellek**

### Hızlı Başlangıç

```bash
# Bağımlılıkları yükle
flutter pub get

# Kodu analiz et
flutter analyze

# Debug modda çalıştır (Android)
flutter run

# Web'de çalıştır
flutter run -d chrome
```

---

## 📦 APK Derleme

### Seçenek 1: Otomatik Script (Önerilen)
```bash
BUILD_RELEASE.bat
```

Bu script otomatik olarak:
1. ✅ Android namespace sorunlarını düzeltir
2. ✅ Önbellekleri temizler
3. ✅ Bağımlılıkları yükler
4. ✅ Isar model dosyalarını üretir
5. ✅ Web uyumluluğunu sağlar
6. ✅ APK dosyasını derler ve `apk/` klasörüne kopyalar

### Seçenek 2: Manuel
```bash
# 1. Namespace düzeltmesi
powershell -ExecutionPolicy Bypass -File fix_dependencies.ps1

# 2. Build
flutter build apk --release --no-tree-shake-icons
```

### Seçenek 3: GitHub Actions (RAM sorunu varsa)
`.github/workflows/build.yml` dosyası içinde GitHub Actions kullanarak cloud üzerinde build alabilirsiniz.

---

## 🏗️ Proje Yapısı

```
AETHER-X/
├── lib/
│   ├── core/              # Temel AI ve veritabanı bileşenleri
│   │   ├── ai/           # Gemini entegrasyonu
│   │   ├── brain/        # Nöral işleme
│   │   ├── memory/       # Isar veritabanı
│   │   ├── senses/       # Biyometrik sensörler
│   │   └── services/     # Arka plan servisleri
│   ├── domain/           # İş mantığı ve varlıklar
│   ├── models/           # Veri modelleri
│   ├── providers/        # Riverpod state yönetimi
│   ├── screens/          # UI ekranları
│   ├── services/         # API ve servisler
│   ├── utils/            # Tema ve yardımcılar
│   └── widgets/          # Yeniden kullanılabilir bileşenler
├── android/              # Android platorm kodu
├── tool/                 # Build yardımcı scriptleri
│   └── fix_web_build.dart  # Web integer düzeltmesi
└── assets/               # Görseller ve modeller
```

---

## 🔧 Önemli Scriptler

| Script | Açıklama |
|--------|----------|
| `BUILD_RELEASE.bat` | Tam otomatik APK build |
| `fix_dependencies.ps1` | Android namespace sorunlarını düzeltir |
| `tool/fix_web_build.dart` | Web için integer limitlerini düzeltir |
| `cleanup_project.bat` | Proje önbelleklerini temizler |

---

## 📱 Özellikler

### ✨ AI Yetenekleri
- **Gemini AI Entegrasyonu:** Doğal dil işleme
- **Offline Mode:** İnternet olmadan da karar verebilme
- **Öğrenme:** Kullanıcı alışkanlıklarını öğrenme

### 🏥 Sağlık Takibi
- Oturma süresi izleme
- Aktivite hatırlatıcıları
- Su içme takibi
- Göz dinlendirme uyarıları

### 📊 İstatistik ve Analiz
- Günlük/haftalık/aylık raporlar
- Başarı rozetleri
- Sosyal liderlik tablosu

---

## 🐛 Bilinen Sorunlar ve Çözümleri

### RAM Yetersizliği (JVM Crash)
**Sorun:** Gradle build sırasında JVM crash  
**Çözüm:**
1. Sanal belleği artırın (8GB+)
2. GitHub Actions kullanın
3. Daha güçlü bir PC'de build alın

### Namespace Hataları
**Sorun:** `package=` attribute hatası  
**Çözüm:** `fix_dependencies.ps1` scriptini çalıştırın

### Web Build Integer Hatası
**Sorun:** "Integer literal too large for JavaScript"  
**Çözüm:** `dart tool/fix_web_build.dart` otomatik düzeltir

---

## 📚 Güncel Bağımlılıklar

**Core:**
- flutter_riverpod: ^2.6.1
- isar: ^3.1.0
- google_generative_ai: ^0.4.7

**Sensors:**
- health: ^13.2.1
- sensors_plus: ^7.0.0
- camera: ^0.11.3

**UI:**
- fl_chart: ^1.1.1
- google_fonts: ^6.2.1
- flutter_animate: ^4.5.0

---

## 🔄 Güncelleme Geçmişi

### v4.0.0+nebula (12 Aralık 2025)
- ✅ 33 paket güncellemesi
- ✅ Android Gradle 8.7.3
- ✅ Kotlin 2.1.0
- ✅ Gradle 8.11.1
- ✅ Tüm kod hataları düzeltildi
- ✅ Web uyumluluğu sağlandı

---

## 📞 Destek

Sorun yaşarsanız:
1. `flutter doctor` çalıştırın
2. `flutter clean && flutter pub get` deneyin
3. `BUILD_RELEASE.bat` scriptini kullanın

---

## 📄 Lisans

Bu proje özel bir projedir ve telif hakkı sahibine aittir.
