# 🚀 state_management_is_life

> **Flutter ile Çoklu State Management ve Modern Uygulama Mimarisi**


<p align="center">
  <img src="https://github.com/user-attachments/assets/89c1b87a-7404-4dda-8467-db3c42923250" width="300" />
  <img src="https://github.com/user-attachments/assets/05d02756-b0fe-40ad-94bf-147c501dac10" width="300" />
  <img src="https://github.com/user-attachments/assets/7ca84aa4-bb0e-416d-851f-33fe4887df3e" width="300" />
</p>


---

## 📝 Proje Hakkında

**state_management_is_life**, Flutter ile geliştirilmiş, farklı state management (durum yönetimi) yaklaşımlarını gerçek bir uygulama üzerinde karşılaştırmalı olarak gösteren, çok platformlu (mobil/web/desktop) bir örnek projedir. Uygulama; onboarding, login, seyahat (travel) ve harita (Google Maps) gibi modüller içerir. 

---

## 🎯 Amaçlar
- Farklı state management yöntemlerinin (Provider, Bloc, MobX) gerçek kullanımını göstermek
- Modern Flutter mimarisi ve dosya yapısı örneği sunmak
- Google Maps ve mock veri ile gerçekçi akışlar sağlamak
- Çoklu platform desteğiyle genişletilebilir bir temel oluşturmak

---

## 🧩 Modüller & Ekranlar

| Modül/Ekran      | Açıklama                                                                 |
|------------------|--------------------------------------------------------------------------|
| 🛫 Onboarding    | Uygulamaya ilk girişte kullanıcıya tanıtım kartları sunar                |
| 🔐 Login         | Kullanıcı adı ile giriş ve "Beni Hatırla" seçeneği                      |
| 🗺️ Travel        | Popüler destinasyonlar, arama ve detaylar                                |
| 📍 Maps          | Google Maps üzerinde konum ve detay kartları                             |
| 🏠 Ana Sekmeler  | Home, Bookmark, Notification, Profile sekmeleri                          |

---

## 🛠️ Kullanılan Teknolojiler & Paketler

- **Flutter** (SDK >=3.8.0)
- **State Management:**
  - 🟢 Provider
  - 🔵 Bloc (flutter_bloc)
  - 🟣 MobX (flutter_mobx)
- **Ağ Katmanı:**
  - ⚡ Dio
  - 🌐 Vexana
- **Harita:**
  - 🗺️ google_maps_flutter
- **Yardımcılar:**
  - 🧰 kartal
  - 🍏 cupertino_icons

---

## 🖥️ Desteklenen Platformlar

| Android | iOS | Web | macOS | Windows | Linux |
|:-------:|:---:|:---:|:----:|:-------:|:-----:|
|   ✅    | ✅  | ✅  |  ✅  |   ✅    |  ✅   |

---

## 📂 Proje Dosya Yapısı (Özet)

```
lib/
 ├─ feature/
 │   ├─ login/         # Login ekranı ve ViewModel'i
 │   ├─ onboard/       # Onboarding ekranı ve modelleri
 │   ├─ travel/        # Seyahat sekmesi, cubit ve modeller
 │   └─ maps/          # Harita ekranı, servis ve ViewModel
 ├─ product/
 │   ├─ model/state/   # Uygulama ve kullanıcı context'i
 │   ├─ init/          # Ağ yöneticisi (Vexana)
 │   └─ utility/       # Yardımcı fonksiyonlar ve extension'lar
 └─ main.dart          # Uygulama giriş noktası
```

---

## 🏗️ Kurulum

1. **Depoyu klonlayın:**
   ```sh
   git clone https://github.com/kullanici_adi/state_management_is_life.git
   cd state_management_is_life
   ```
2. **Bağımlılıkları yükleyin:**
   ```sh
   flutter pub get
   ```
3. **(iOS için) Pod bağımlılıklarını yükleyin:**
   ```sh
   cd ios
   pod install
   cd ..
   ```

---

## ▶️ Çalıştırma

- **Mobil/Desktop:**
  ```sh
  flutter run
  ```
- **Web:**
  ```sh
  flutter run -d chrome
  ```

---

## 🧪 Testler

Projede örnek widget ve servis testleri bulunmaktadır. Testleri çalıştırmak için:
```sh
flutter test
```

---

## 🧠 State Management Örnekleri

- **Provider:** Kullanıcı adı ve onboarding akışında
- **Bloc:** Travel sekmesinde destinasyon arama ve listeleme
- **MobX:** Harita ekranında marker ve kart yönetimi

---

## 📸 Ekran Görüntüleri

> (Buraya uygulama ekran görüntülerinizi ekleyebilirsiniz)

---

## 🔑 Google Maps API Anahtarı

Uygulama, Google Maps entegrasyonu için bir API anahtarı gerektirir. iOS için anahtar `ios/Runner/AppDelegate.swift` dosyasında gömülüdür. Kendi anahtarınızı kullanmak için bu dosyadaki `GMSServices.provideAPIKey(...)` satırını güncelleyiniz.

---

## 🤝 Katkı Sağlama

1. Fork'layın 🍴
2. Yeni bir branch oluşturun (`git checkout -b feature/yenilik`)
3. Değişikliklerinizi commit'leyin (`git commit -am 'Açıklama'`)
4. Branch'inizi push'layın (`git push origin feature/yenilik`)
5. Pull request açın

---

## 📄 Lisans

MIT Lisansı

---

## 📢 Notlar
- Proje, state management yöntemlerini karşılaştırmak ve öğretmek amacıyla hazırlanmıştır.
- Gerçek bir backend servisi ile entegre değildir, mock veriler kullanır.
- Google Maps API anahtarınızı güvenli şekilde saklamayı unutmayın.
- Her türlü katkı ve öneriye açıktır!
