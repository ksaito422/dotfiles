{
  system.defaults = {
    NSGlobalDomain= {
      # マウス/トラックパッド
      "com.apple.swipescrolldirection" = false; # ナチュラルスクロール
      AppleInterfaceStyle = "Dark"; # ダークモード
      AppleICUForce24HourTime = true; # 24時間表示
      NSStatusItemSelectionPadding = 6; # メニューアイコンの余白
      NSStatusItemSpacing = 6; # mメニューアイコンの間隔
      InitialKeyRepeat = 128; # リピート認識までの時間
      KeyRepeat = 128; # リピート速度
    };
    finder = {
      AppleShowAllExtensions = true; # ファイル拡張子
      AppleShowAllFiles = true; # 隠しファイル
    };
    dock = {
      autohide = true; # 自動的に表示/非表示
      largesize = 24;
    };
    menuExtraClock.ShowSeconds = true; # 時刻の秒表示
    controlcenter.BatteryShowPercentage = true; # バッテリー残量の%表示
  };
}
