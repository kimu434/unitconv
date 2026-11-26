# unitconv

![test](https://github.com/kimu434/unitconv/actions/workflows/test.yml/badge.svg)

標準入力から読み込んだ数値を、指定した物理・工学単位（角度・速度・温度）へ変換して標準出力へ出力するLinuxコマンドです。余計な装飾を出力しないため、他のコマンドとパイプ（`|`）でつないでデータ処理に利用できます。

## インストール方法

```bash
git clone [https://github.com/kimu434/unitconv.git](https://github.com/kimu434/unitconv.git)
cd unitconv
chmod +x unitconv
```

## 使い方

変換モードを引数に指定し、標準入力から数値を渡します。スペース・カンマ・改行区切りに対応しています。

### 変換モード一覧

| モード | 変換内容 |
| :--- | :--- |
| `deg2rad` | 度（deg） → ラジアン（rad） |
| `rad2deg` | ラジアン（rad） → 度（deg） |
| `kmh2ms` | 時速（km/h） → 秒速（m/s） |
| `ms2kmh` | 秒速（m/s） → 時速（km/h） |
| `c2f` | 摂氏（℃） → 華氏（℉） |
| `f2c` | 華氏（℉） → 摂氏（℃） |

### 実行例

```bash
# 角度（deg）をラジアン（rad）に変換
$ echo "0 90 180" | ./unitconv deg2rad
0 1.570796 3.141593

# 小数点以下の桁数を指定（-r オプション）
$ echo "180" | ./unitconv deg2rad -r 4
3.1416

# 時速（km/h）を秒速（m/s）に変換
$ echo "36 72" | ./unitconv kmh2ms
10 20
```

## 必要なソフトウェア
- Python
  - テスト済みバージョン: 3.10〜3.14

## テスト環境
- Ubuntu 24.04 LTS

## ライセンス
- このソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可されます。
- © 2026 Kazutoshi Murata
