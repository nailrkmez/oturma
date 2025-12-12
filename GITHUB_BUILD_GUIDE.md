# 🚀 GitHub Actions ile APK Oluşturma Kılavuzu

## ❗ Neden Bu Yöntem?

Sisteminizde **RAM yetersizliği** nedeniyle yerel build başarısız oluyor. GitHub Actions, bulut üzerinde **16GB RAM** ile build yapar - **tamamen ücretsiz!**

---

## 📋 ADIM ADIM TALİMATLAR

### 1️⃣ GitHub Hesabı ve Repository Oluşturma

#### a) GitHub hesabınız yoksa:
1. [github.com](https://github.com) adresine gidin
2. "Sign up" ile ücretsiz hesap oluşturun

#### b) Yeni repository oluşturun:
1. GitHub'da sağ üst köşeden **"+" → "New repository"**
2. Repository adı: `aether-x` (veya istediğiniz ad)
3. **Private** seçin (projeniz gizli kalsın)
4. **Initialize this repository with a README** işaretini KALDIRUN
5. "Create repository" tıklayın

---

### 2️⃣ Projeyi GitHub'a Yükleme

Komut satırında (PowerShell) şu komutları çalıştırın:

```powershell
# Proje klasörüne gidin
cd d:\OTURMA

# Git başlat (eğer yoksa)
git init

# .gitignore oluştur
@"
# Build outputs
build/
.dart_tool/
.gradle/
*.iml
local.properties

# IDE
.idea/
.vscode/

# Logs
*.log

# APK outputs (sadece geliştirme için)
# apk/ klasörünü de ekleyebilirsiniz
"@ | Out-File -FilePath .gitignore -Encoding UTF8

# Tüm dosyaları ekle
git add .

# Commit yap
git commit -m "Initial commit - AETHER-X Project"

# GitHub repository'nizin URL'sini ekleyin (GitHub'dan kopyalayın)
git remote add origin https://github.com/KULLANICI_ADINIZ/aether-x.git

# Ana branch'i ayarlayın
git branch -M main

# GitHub'a yükleyin
git push -u origin main
```

> **Not:** `KULLANICI_ADINIZ` yazan yere kendi GitHub kullanıcı adınızı yazın.

---

### 3️⃣ GitHub Actions ile Build Başlatma

#### Otomatik Yöntem:
Yukarıdaki `git push` komutu çalıştığında otomatik olarak build başlar.

#### Manuel Yöntem:
1. GitHub'daki repository'nize gidin
2. Üstteki **"Actions"** sekmesine tıklayın
3. Sol taraftan **"Build APK"** workflow'unu seçin
4. Sağ üstteki **"Run workflow"** dropdown'unu açın
5. **"Run workflow"** butonuna tıklayın

---

### 4️⃣ APK'yı İndirme

Build tamamlandıktan sonra (yaklaşık 5-10 dakika):

1. **Actions** sekmesinde yeşil ✅ işareti görünecek
2. O build'e tıklayın
3. Aşağı kaydırın, **"Artifacts"** bölümünü bulun
4. **"aether-x-apk"** linkine tıklayarak APK'yı indirin
5. ZIP dosyasını açın, içinde `app-release.apk` olacak

---

## 🎯 HIZLI BAŞLANGIÇ (Kopyala-Yapıştır)

```powershell
# 1. Proje klasörüne git
cd d:\OTURMA

# 2. Git ayarlarını yap (ilk kez yapıyorsanız)
git config --global user.name "Adınız"
git config --global user.email "email@example.com"

# 3. Repository başlat
git init
git add .
git commit -m "Initial commit"

# 4. GitHub'a bağlan (kendi URL'nizi yazın!)
git remote add origin https://github.com/KULLANICI_ADI/REPO_ADI.git
git branch -M main
git push -u origin main
```

Bitti! GitHub Actions otomatik olarak APK oluşturacak.

---

## 📱 APK'yı Telefona Yükleme

APK'yı indirdikten sonra:

1. **USB ile:**
   - APK'yı telefona kopyalayın
   - Dosya Yöneticisi ile açın ve yükleyin

2. **Google Drive:**
   - APK'yı Drive'a yükleyin
   - Telefondan indirip yükleyin

3. **Kablosuz:**
   - APK'yı bir web sunucusuna yükleyin
   - Telefondan tarayıcı ile indirin

> ⚠️ "Bilinmeyen kaynaklardan yükleme" iznini vermeniz gerekebilir.

---

## 🔧 SORUN GİDERME

### Git yüklü değil?
```powershell
# Chocolatey ile Git kurulumu
choco install git -y

# Veya: https://git-scm.com/download/win
```

### "Authentication failed" hatası?
1. GitHub'da **Settings → Developer settings → Personal access tokens**
2. **"Generate new token (classic)"**
3. **"repo"** iznini seçin
4. Token'ı kopyalayın
5. Push yaparken şifre yerine bu token'ı kullanın

### Build başarısız oldu?
1. Actions sekmesinde hataya tıklayın
2. Log'lara bakın
3. Genellikle `pubspec.yaml` veya import hataları olur

---

## 💡 İPUÇLARI

### Her değişiklikten sonra yeni APK almak için:

```powershell
git add .
git commit -m "Değişiklik açıklaması"
git push
```

GitHub Actions otomatik olarak yeni APK oluşturur.

### Tag ile Release oluşturma:

```powershell
git tag v1.0.0
git push origin v1.0.0
```

Bu, GitHub Releases sayfasında indirilebilir APK oluşturur.

---

## 📊 MALIYET

✅ **Tamamen ücretsiz!**
- GitHub Actions: 2000 dakika/ay (private repo)
- Her build: ~10 dakika
- **Aylık ~200 build hakkınız** var

---

## 🎉 SONUÇ

Artık RAM sorunu olmadan sınırsız APK oluşturabilirsiniz! 

**Sorularınız için:**
- GitHub Actions logs
- [GitHub Docs](https://docs.github.com/actions)
