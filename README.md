<h1 align="center">
  Notes App
</h1>

<h3 align="center">
  <a href="">Play store link to be added soon</a>
</h3>

<p>
  This is a Flutter based application designed to support the note taking utility a user requires on his smartphone. The app is based on hive and stores the data locally on your device only. The synchronization feature, which would enable a user to backup his notes over Google Drive will be added soon.
</p>

<h2>
Steps to rebuild
</h2>

<h3>1. Clone the repository</h3>
<p>Open a terminal or powershell window of your choice and make sure git is installed and working on your machine and type the following command:</p>

```
git clone https://github.com/vaibhav-yb/notes_app.git
```

<p>
  Alternatively, you can download the complete zip file from the repository page itself. <a href="https://github.com/vaibhav-yb/notes_app/archive/refs/heads/main.zip">Download here</a>.
</p>

<h3>2. Open an IDE of your choice</h3>
<p>
  The IDE of your choice can be <a href="https://developer.android.com/studio">Android Studio</a> or <a href="https://code.visualstudio.com/">VS Code</a>. Even though VS Code is a pretty powerful IDE, I prefer Android Studio for Android development, maybe because I started with this and subconciously I don't want to switch to anything else.
</p>

<h3>3. Configuring the type adapter</h3>
<p>
  The type adapters help you to create a writing/reading bridge for using custom objects with Hive, so before you actually start building, you are going to need to configure them, don't worry, just make sure that <a href="https://pub.dev/packages/build_runner">build_runner</a> and <a href="https://pub.dev/packages/build_runner">hive_generator</a> are in your <em>pubspec.yaml</em> and you have pulled your dependencies. Now all you need to do is run the following command:
</p>
  
  ```
  flutter packages pub run build_runner build
  ```

<h3>4. Run <a href="https://github.com/vaibhav-yb/notes_app/blob/main/lib/main.dart">main.dart</a></h3>
<p>
  Now there would be more steps related to configuration of the IDE, installing plugins, etc, I won't go into that because if you are coming to clone this repository, chances are, you are already familiar with those things and the setup is complete. So just go ahead and choose a target device and run the <a href="https://github.com/vaibhav-yb/notes_app/blob/main/lib/main.dart">main.dart</a> file.
</p>

<h3>5. Build your application</h3>
<p>
  Once you are done adding/removing features as per your choice, you can go to build the apk or any other version of your application as per you deem fit.
</p>

<h2>
  Tech stack used
</h2>

<ul>
  <li><a href="https://flutter.dev/">Flutter</a></li>
  <li><a href="https://pub.dev/packages/hive">Hive</a></li>
</ul>

<h3 align="center">
  <img src="http://ForTheBadge.com/images/badges/built-with-love.svg">
</h3>
