# wiztok
A Tiktok clone made using flutter and Firebase. 

## Features
- TikTok like UI
- Authentication with Email & Password
- Uploading Videos with Caption
- Compressing Videos before upload
- Generating Thumbnails Out of Video
- Displaying Videos with Caption
- Liking on Posts
- Commenting on Posts
- Liking the Comments
- Searching Users
- Following Users
- Displaying Followers, Following, Likes & Posts of User Real-Time


## :rocket: Quick start

### Step 1: Clone the repo
Fork the repository. then clone the repo locally

After cloning this repository, migrate to ```WizTok``` folder. Then, follow the following steps:
- Create Firebase Project
- Enable Authentication
- Make Firestore Rules
- Create Android & iOS Emulator/Simulator

Install dependencies (Client Side)
```bash
flutter pub get
```

### Step 2: Change package name.
Change package name to something unique(For firebase setup).

### Step 3: Download google-services.json file
This projects uses firebase. So we need to download `google-services.json` file.
You can go through this: https://firebase.google.com/docs/android/setup

### Step 4: Using google services file.
Now, you need to add `google-services.json` given by firebase to `android/app` directory.

Run App
```bash
flutter run // After selecting the device you want to test on
```

## Tech Used
**Server**: Firebase Auth, Firebase Storage, Firebase Firestore

**Client**: Flutter, GetX

**Architecture**: MVC
    
## Enjoy
## :v: Contributing
After cloning & setting up the local project you can push the changes to your github fork and make a pull request.

