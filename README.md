Muhabbet Chat Uygulaması
Muhabbet, kullanıcıların anlık mesajlaşma yapabildiği yerli ve milli bir chat uygulamasıdır.

Önkoşullar
Node.js'in en son sürümü yüklü olmalıdır.
Flutter SDK'nın en son sürümü yüklü olmalıdır.
Bir veritabanı sunucusuna (ör. MongoDB) erişiminiz olmalıdır.

Kurulum
Bu depoyu klonlayın:

git clone https://github.com/your-username/muhabbet.git

Server klasörüne gidin ve bağımlılıkları yükleyin:

cd muhabbet/server
npm install

Sunucuyu çalıştırın:

npm start

Client klasörüne gidin ve bağımlılıkları yükleyin:

cd ../client
flutter pub get

Uygulamayı başlatın:

flutter run
Uygulama başarıyla başlatıldıktan sonra, Muhabbet chat uygulamasına erişebileceğiniz yerel bir adres sağlanacaktır.

Yapılandırma

Server klasöründe .env adında bir dosya oluşturun ve aşağıdaki değişkenleri ayarlayın:

PORT=5000              # Sunucu port numarası
MONGODB_URI=mongodb://localhost:27017/muhabbet   # MongoDB bağlantı URL'si
JWT_SECRET=mysecretkey    # JWT imzalama anahtarı


const String apiUrl = 'http://localhost:3000';   // Server URL'si


Katkıda Bulunma
Muhabbet chat uygulaması geliştirilme aşamasındadır ve katkıda bulunmaktan memnuniyet duyarız. Herhangi bir hata veya iyileştirme önerisi için lütfen bir GitHub issue açın veya pull request gönderin.

Lisans
Bu proje MIT lisansı altında lisanslanmıştır. Daha fazla bilgi için LICENSE dosyasını inceleyin.


App İmages

![WhatsApp Image 2023-06-22 at 15 17 15](https://github.com/MusaKolcuk/Muhabbet/assets/82619526/7f3a00ad-b9b9-4068-ae03-5c164c5aa15a)

![WhatsApp Image 2023-06-22 at 15 17 16](https://github.com/MusaKolcuk/Muhabbet/assets/82619526/7c6dcaa2-b749-495a-9c38-7a1f9b0d2bd6)

![WhatsApp Image 2023-06-22 at 15 17 17](https://github.com/MusaKolcuk/Muhabbet/assets/82619526/c86f708f-fb51-4582-8002-f51eb6100d7a)

![WhatsApp Image 2023-06-22 at 15 17 16 (1)](https://github.com/MusaKolcuk/Muhabbet/assets/82619526/10811990-849b-4bee-8ef0-a224e75ff4ea)

![WhatsApp Image 2023-06-22 at 15 17 15 (1)](https://github.com/MusaKolcuk/Muhabbet/assets/82619526/a4b04667-acec-4f38-a641-8ce04d513524)

![WhatsApp Image 2023-06-22 at 15 17 14 (1)](https://github.com/MusaKolcuk/Muhabbet/assets/82619526/df03135f-f169-4caf-8e9d-9670fddcd006)

![WhatsApp Image 2023-06-22 at 15 17 14](https://github.com/MusaKolcuk/Muhabbet/assets/82619526/8693e76e-22c5-41b8-8996-4875cb438246)

![WhatsApp Image 2023-06-22 at 15 39 44](https://github.com/MusaKolcuk/Muhabbet/assets/82619526/6e496965-adde-4d7c-a2e7-f441c6df4701)

![WhatsApp Image 2023-06-22 at 15 39 59](https://github.com/MusaKolcuk/Muhabbet/assets/82619526/8cfce8b8-318f-4e56-91af-13ba97115510)

![WhatsApp Image 2023-06-22 at 14 43 37](https://github.com/MusaKolcuk/Muhabbet/assets/82619526/f4e67d10-ec80-4fe0-b98c-a17714c352eb)

![WhatsApp Image 2023-06-22 at 14 43 37 (1)](https://github.com/MusaKolcuk/Muhabbet/assets/82619526/f7cf8c8a-bd1e-452c-9285-b98f53428bce)

![WhatsApp Image 2023-06-22 at 15 17 17 (2)](https://github.com/MusaKolcuk/Muhabbet/assets/82619526/0847781a-d3eb-431f-bf39-93009c374955)

![WhatsApp Image 2023-06-22 at 15 17 18](https://github.com/MusaKolcuk/Muhabbet/assets/82619526/b244406a-6ee6-4aa2-a664-3316f831c7d6)

![WhatsApp Image 2023-06-22 at 15 17 18 (1)](https://github.com/MusaKolcuk/Muhabbet/assets/82619526/83ba5076-01ba-4414-be3f-80b85fd58167)














