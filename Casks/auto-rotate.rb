cask "auto-rotate" do
  version "0.1.1"
  sha256 "898dbf22c5b973a2bf9663250c1a2ac635b08732929ebcda30d18a67c2a5c305"

  url "https://github.com/gedejong/auto-rotate/releases/download/v#{version}/Auto-Rotate-#{version}.dmg"
  name "Auto-Rotate"
  desc "Deskew and turn upright every page of a PDF"
  homepage "https://github.com/gedejong/auto-rotate"

  # Apple-Silicon, macOS 14+ build (single-arch; see project notes).
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Auto-Rotate.app"

  zap trash: [
    "~/Library/Application Support/Auto-Rotate",
    "~/Library/Preferences/dev.gedejong.autorotate.plist",
  ]

  caveats <<~CAVEATS
    Auto-Rotate is not yet notarized. On first launch, right-click the app and choose
    Open (or run: xattr -dr com.apple.quarantine "/Applications/Auto-Rotate.app").

    Orientation and OCR features need Tesseract (and OCRmyPDF for --ocr) on PATH:
      brew install tesseract ocrmypdf
  CAVEATS
end
