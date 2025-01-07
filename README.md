1. common_widgets/:
   Bu klasör, uygulamanın her yerinde tekrar kullanılan widget'ları içerir. Örneğin:
   custom_button.dart: Özel bir buton widget'ı.
   custom_card.dart: Kart şeklinde bir widget.
   loading_indicator.dart: Yüklenme göstergesi.
   custom_text_field.dart: Özelleştirilmiş bir metin girişi widget'ı.

2. constants/:
   Bu klasör, uygulamanın genelinde kullanılan sabitleri içerir. Örneğin:
   app_constants.dart: Uygulama genelinde kullanılan sabit değerler (örneğin, API URL'leri, genel renkler).
   strings.dart: Uygulama içinde kullanılacak tüm metinler (özellikle lokalizasyon için).
   colors.dart: Uygulamadaki renklerin tanımları.
   assets.dart: Görsel dosya yolları.

3. exceptions/:
   Hataların yönetilmesini sağlayan sınıflar bulunur. Örneğin:
   custom_exception.dart: Özel hata sınıfı.
   network_exception.dart: Ağ bağlantısı hataları için özel sınıf.
   auth_exception.dart: Kimlik doğrulama hataları için özel sınıf.

4. features/:
   Uygulamanın ana işlevselliklerini içeren klasör. Örneğin, authentication özelliği:
   authentication/controllers/: Uygulama mantığını yöneten sınıflar. Örneğin:
   auth_controller.dart: Kullanıcı girişi, kaydı, oturum açma işlemlerini yöneten sınıf.
   authentication/models/: Veri modelleri. Örneğin:
   user_model.dart: Kullanıcı bilgilerini içeren model.
   authentication/screens/: Kimlik doğrulama ekranları. Örneğin:
   login_screen.dart: Kullanıcı girişi ekranı.
   signup_screen.dart: Kullanıcı kaydı ekranı.

5. localization/:
   Uygulamanın çoklu dil desteği için kullanılan dosyalar. Örneğin:
   app_localizations.dart: Dil çevirilerinin yönetildiği sınıf.
   en.dart: İngilizce dil dosyası.
   tr.dart: Türkçe dil dosyası.

6. routing/:
   Uygulamanın ekranlar arası geçişlerinin yönetildiği sınıflar. Örneğin:
   app_router.dart: Uygulama genelindeki yönlendirmeleri yöneten sınıf.
   route_names.dart: Yönlendirme için kullanılan sabitlerin bulunduğu dosya (örneğin, /login, /home).

7. utils/:
   Yardımcı fonksiyonlar ve genel uygulama işlemleri. Örneğin:
   validators.dart: Form doğrulama işlemleri.
   date_utils.dart: Tarih ve saat işlemleri.
   network_utils.dart: Ağ bağlantısı ile ilgili yardımcı fonksiyonlar.
   storage_utils.dart: Yerel depolama işlemleri.