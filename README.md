# ImmoSuite ERP — Application Android (APK)

Scaffold Capacitor **prêt à compiler**. L'ERP est embarqué dans l'APK
(`www/index.html`) avec toutes ses dépendances en local (`www/vendor/`) :
fonctionne **100 % hors-ligne**.

---

## 1. Pré-requis (à installer une seule fois)

- **Node.js** (LTS) : https://nodejs.org
- **Android Studio** : https://developer.android.com/studio
  (lancer une fois, laisser installer le **SDK Android** + accepter les licences)
- **JDK 17** (fourni avec Android Studio récent)

---

## 2. Génération de l'APK — méthode automatique

Double-cliquer sur **`BUILD_APK.bat`**.

Le script :
1. installe les dépendances npm
2. ajoute la plateforme Android
3. synchronise le code web
4. compile l'APK de debug

APK généré dans :
```
android\app\build\outputs\apk\debug\app-debug.apk
```

Copier ce fichier sur le téléphone, l'ouvrir, autoriser
« Installer depuis sources inconnues », installer.

---

## 3. Méthode manuelle (équivalente)

```bash
npm install
npx cap add android
npx cap sync android
npx cap open android      # ouvre Android Studio
```
Dans Android Studio : **Build > Build APK(s)**.

---

## 4. Permissions

Après `npx cap add android`, ouvrir
`android/app/src/main/AndroidManifest.xml`
et ajouter les permissions du fichier **`PERMISSIONS_AndroidManifest.txt`**
(caméra pour le scan badge, stockage pour les exports PDF/CSV).
Puis `npx cap sync android` et recompiler.

---

## 5. Icône & nom de l'application

- Nom : déjà défini dans `capacitor.config.json` (`appName: "ImmoSuite"`).
- Icône : remplacer les fichiers dans
  `android/app/src/main/res/mipmap-*/ic_launcher.png`
  (ou utiliser Android Studio : clic droit sur `res` > New > Image Asset).

---

## 6. APK signé pour distribution (release)

Pour distribuer hors debug (plus stable, installable largement) :

```bash
# 1. Générer une clé de signature (une seule fois)
keytool -genkey -v -keystore immosuite.keystore -alias immosuite ^
  -keyalg RSA -keysize 2048 -validity 10000

# 2. Configurer android/app/build.gradle (bloc signingConfigs)
#    puis :
cd android
gradlew.bat assembleRelease
```
APK release : `android\app\build\outputs\apk\release\app-release.apk`

> Conserver `immosuite.keystore` + mot de passe en lieu sûr :
> obligatoire pour publier les mises à jour.

---

## 7. Mise à jour de l'ERP

À chaque nouvelle version du fichier HTML :
1. remplacer `www/index.html` par la nouvelle version
   (re-appliquer le patch des CDN si nécessaire — voir `patch_cdn.py`)
2. `npx cap sync android`
3. recompiler

---

## 8. Points techniques

- **IndexedDB** : persistant dans le WebView, aucune perte entre sessions.
- **Supabase** : se synchronise dès qu'il y a réseau.
- **EmailJS / Leaflet / Chart.js** : embarqués en local (`www/vendor/`),
  fonctionnent sans connexion.
- **Cartes Leaflet** : si les marqueurs n'apparaissent pas, ajouter dans
  le code après le chargement de Leaflet :
  `L.Icon.Default.imagePath = 'vendor/images/';`

---

Contact projet : PARTNER IMMO CI — `ci.partnerimmo.immosuite`
