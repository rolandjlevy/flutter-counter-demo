# Flutter Sandbox Test

A minimal Flutter app for validating a GitHub Codespaces sandbox setup —
a single counter button. If it builds and increments in the browser, the
whole pipeline (Flutter SDK install → build → web serve → port forward)
works.

## What's included

```
flutter-sandbox-test/
├── .devcontainer/
│   ├── devcontainer.json      # Codespace config: base image, Flutter install, port forwarding
│   └── install-flutter.sh     # Clones Flutter stable into /opt/flutter on container creation
├── .gitignore
├── README.md
├── analysis_options.yaml      # Standard flutter_lints config
├── pubspec.yaml                # Project manifest + dependencies
└── lib/
    └── main.dart                # The entire app: a counter with one button
```

## What's deliberately NOT included

The platform folders (`android/`, `ios/`, `web/`, `linux/`, `macos/`,
`windows/`) are **not** hand-written here. They're boilerplate that Flutter
generates from a template matching your exact installed SDK version — hand-
crafting them risks a mismatch with whatever Flutter stable pulls down in the
container, which could cause confusing build errors that have nothing to do
with your code. Since `flutter create` regenerates them safely and for free,
it's the correct source for these files, not a hand-copied guess.

## First run in the Codespace

1. Push this to a repo (or open it as-is) and create a Codespace from it.
   Wait for `.devcontainer/install-flutter.sh` to finish — first build takes
   a few minutes.
2. Generate the missing platform folders around the existing files:
   ```bash
   flutter create . --project-name sandbox_test
   ```
   This fills in `web/`, `android/`, etc. without touching `lib/main.dart`
   or `pubspec.yaml`, since they already exist.
3. Run it on the web target:
   ```bash
   flutter run -d web-server --web-port 8080
   ```
4. Open the **Ports** tab in VS Code, find port 8080, open it in the browser.
5. Click the `+` button. If the number increments, the sandbox works end to
   end.
6. Optional: with the app running, press `r` in the terminal to test hot
   reload after editing `lib/main.dart`.

## Using this as an actual sandbox

- Work on a throwaway branch, or don't push at all if you're just
  experimenting.
- If something breaks, don't debug the container — delete the Codespace and
  recreate it. That's the point of the setup: it rebuilds identically every
  time from `.devcontainer/`.
