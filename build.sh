#!/usr/bin/env bash

set -euo pipefail

if command -v dotnet >/dev/null 2>&1; then
    DOTNET=dotnet
elif [[ -x /usr/lib/dotnet/dotnet ]]; then
    DOTNET=/usr/lib/dotnet/dotnet
else
    printf 'Error: .NET 8 SDK was not found.\n' >&2
    exit 1
fi

rm -rf ./package

"$DOTNET" restore
"$DOTNET" publish -c Release \
    -o ./package/addons/counterstrikesharp/plugins/MatchZy
cp -r ./cfg ./package/

printf 'Build complete: ./package\n'