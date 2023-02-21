#!/bin/sh

cd /app/bin
sed -i "s@aabbccflagccbbaa@$FLAG@g" ./gen.c
gcc ./gen.c -o ./gen
chmod +x ./gen
DATA=$(./gen)
# Encoded data -> $DATA

export PATH="/usr/lib/llvm-10/bin/:$PATH"

sed -i "s@aabbccflagccbbaa@$DATA@g" ./game.c
clang -Os -fno-builtin -Wall -Wextra -Wswitch-enum --target=wasm32 --no-standard-libraries -Wl,--export=game_init -Wl,--export=game_render -Wl,--export=game_update -Wl,--export=game_info -Wl,--export=game_keydown -Wl,--no-entry -Wl,--allow-undefined  -o game.wasm game.c

# Deploy environment
cd /app
cp /app/bin/game.wasm /app
rm -r /app/bin
python3 -m http.server 8080
