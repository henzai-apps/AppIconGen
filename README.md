# AppIconGen

## install

```
$ make install
```

## Usage

```
$ appicongen -h
USAGE: appicon-gen [<name>] [--system-image-name <system-image-name>] [--color <color>] [--path <path>]

ARGUMENTS:
  <name>                  output appiconset name (default: AppIcon)

OPTIONS:
  --system-image-name <system-image-name>
                          SFSymbol name
  --color <color>         hex style color
  --path <path>           path
  -h, --help              Show help information.
```

## Example

```
$ appicongen "Document" --system-image-name "circle" --color "#C0FFEE"
```