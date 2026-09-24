{
  targets.darwin.defaults = {
    NSGlobalDomain = {
      "com.apple.swipescrolldirection" = false; # ナチュラルスクロール
      AppleInterfaceStyle = "Dark"; # ダークモード
      AppleICUForce24HourTime = true; # 24時間表示
      NSStatusItemSelectionPadding = 6; # メニューアイコンの余白
      NSStatusItemSpacing = 6; # メニューアイコンの間隔
      InitialKeyRepeat = 15; # リピート認識までの時間
      KeyRepeat = 2; # リピート速度
    };
    "com.apple.finder" = {
      AppleShowAllExtensions = true; # ファイル拡張子
      AppleShowAllFiles = true; # 隠しファイル
    };
    "com.apple.dock" = {
      autohide = true; # 自動的に表示/非表示
      largesize = 24;
    };
    "com.apple.menuextra.clock" = {
      ShowSeconds = true; # 時刻の秒表示
    };
  };

  targets.darwin.currentHostDefaults = {
    "com.apple.controlcenter" = {
      BatteryShowPercentage = true; # バッテリー残量の%表示
    };
  };
}
