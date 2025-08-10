# Messapi_Island — Godot 4 Prototype (Android-ready)

Questo è un prototipo base in pixel-art 32-bit (low-res ma dettagliata) con:
- Isola salentina stilizzata (scogliere, spiaggia, ulivi)
- Ciclo giorno/notte e stagioni
- Personaggio giocabile
- Barche nemiche che arrivano dal mare
- Ingresso caverna (scena placeholder)
- Controlli touch su schermo per Android

## Aprire il progetto
1) Scarica **Godot 4.2 o superiore** su PC (Windows/Mac/Linux).
2) `Project > Import` e seleziona questa cartella (quella con `project.godot`).
3) Premi **Play** per vedere la demo (desktop).

## Esportazione per Android (APK)
1) In Godot: `Editor > Editor Settings > Export > Android` e imposta:
   - **Android SDK Path** (cartella dove hai Android SDK)
   - **Java** (JDK 17) e **ADB** funzionanti
2) `Project > Install Android Build Template` se richiesto.
3) `Project > Export...` e scegli il preset **Android** già incluso; premi **Export Project** per generare l'APK.
4) Copia l'APK sul tuo telefono e installalo (abilita "Origini sconosciute").

## Comandi
- Desktop: WASD o frecce.
- Android: pulsanti touch sullo schermo. (Il pulsante **Attack** è placeholder).

## Note tecniche / cose da estendere
- Le barche ora scompaiono quando raggiungono la riva (qui potresti istanziare truppe greche/romane/illire).
- Aggiungi collisioni per scogliere/muri con `CollisionShape2D` e `TileMap` se vuoi un pathfinding solido.
- Per una pixel-art più "croccante": imposta `Project Settings > Rendering > Textures > Default Texture Filter = Nearest` e abilita il pixel snap.
- Aggiungi i **Messapi NPC** con ruoli (pescatore, costruttore) e un sistema risorse (acqua, cibo, legno, pietra).
- Implementa **maree** variando la riva (sposta il layer "mare" verticalmente) e scopri grotte temporaneamente accessibili.
- Le **stagioni** ora ruotano ogni 10 giorni (demo). Collega effetti su raccolti/onde/vento.

Buon lavoro e fammi sapere cosa vuoi che aggiunga (mura, edifici costruibili, IA dei nemici, inventario, salvataggi, ecc.).
