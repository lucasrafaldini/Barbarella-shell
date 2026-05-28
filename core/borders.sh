#!/usr/bin/env bash
# Decorative border styles for the prompt line
# Choose independently from color themes: bbl border <name>
#
# Two collections:
#   - MSN-era text art (waves, cascade, starlight, etc.)
#   - Unicode/emoji nick-style (shimmer, gothic, boop, etc.)

BBL_ALL_BORDERS="none waves cascade starlight flow mystery tech royal blossom glitter aurora ribbon petals lace cupid rose moonbeam frame comet chain elegant crystal flirty moonlight ornate sweet classic kawaii matrix gamer cyber dream sleepy retro circles whisper shimmer nova temple equalizer celestial stardust starwave boop huggy kittycat cherry bow candy gothic mystic darkrose smiley softy robot crown party sparkly loveletter hearts formal vintage gem heartwave snowflake valentine starornate floral happyface wink lovesong starjewel heartthrob heartbow question pulse golden mist simple mirror arrow blade dot dizzy leaf bracket chevron breeze bronze scroll dots goldstar sultan sakura gradient checker zen barcode"

_bbl_load_border() {
  local name="${1:-none}"
  BBL_DECO_SEP=" · "

  case "$name" in

    # ══════════════════════════════════════════════════════════════════════════
    #  MSN-era text art borders (from first collection)
    # ══════════════════════════════════════════════════════════════════════════

    none)
      BBL_DECO_LEFT=""
      BBL_DECO_RIGHT=""
      BBL_BORDER_NAME="none"
      BBL_BORDER_LABEL="Sem borda"
      ;;
    waves)
      BBL_DECO_LEFT="©º°¨¨°º©©º°¨¨°º©"
      BBL_DECO_RIGHT="©º°¨¨°º©©º°¨¨°º©"
      BBL_BORDER_NAME="waves"
      BBL_BORDER_LABEL="Waves"
      ;;
    cascade)
      BBL_DECO_LEFT=".·´¯(_.·´¯(_.·´¯(_"
      BBL_DECO_RIGHT="_)\`·._)\`·._)\`·."
      BBL_BORDER_NAME="cascade"
      BBL_BORDER_LABEL="Cascade"
      ;;
    starlight)
      BBL_DECO_LEFT=",-*'^'~*-.,_,.-*~"
      BBL_DECO_RIGHT="~*-.,_,.-*~'^'*-,"
      BBL_BORDER_NAME="starlight"
      BBL_BORDER_LABEL="Starlight"
      ;;
    flow)
      BBL_DECO_LEFT="(¯\`·.¸¸.·´¯\`·.¸¸.->"
      BBL_DECO_RIGHT="<-.¸¸.·´¯\`·.¸¸.·´¯)"
      BBL_BORDER_NAME="flow"
      BBL_BORDER_LABEL="Flow"
      ;;
    mystery)
      BBL_DECO_LEFT="?.?.?/??.?.?"
      BBL_DECO_RIGHT="?.?.?/??.?.?"
      BBL_BORDER_NAME="mystery"
      BBL_BORDER_LABEL="Mystery"
      ;;
    tech)
      BBL_DECO_LEFT="_|/_-=<><>||[]"
      BBL_DECO_RIGHT="[]||<><>=-_|/_"
      BBL_BORDER_NAME="tech"
      BBL_BORDER_LABEL="Tech"
      ;;
    royal)
      BBL_DECO_LEFT="¤º°\`¯ ¯\`°²º¤æ=¬«"
      BBL_DECO_RIGHT="»¬=æ¤º²°\`¯ ¯\`°º¤"
      BBL_BORDER_NAME="royal"
      BBL_BORDER_LABEL="Royal"
      ;;
    blossom)
      BBL_DECO_LEFT="(¯\`·._(¯\`·._(¯\`·._("
      BBL_DECO_RIGHT=")_.·´¯)_.·´¯)_.·´¯)"
      BBL_BORDER_NAME="blossom"
      BBL_BORDER_LABEL="Blossom"
      ;;
    glitter)
      BBL_DECO_LEFT="*®*´¯\`*.¸¸.*´¯\`*"
      BBL_DECO_RIGHT="*´¯\`*.¸¸.*´¯\`*"
      BBL_BORDER_NAME="glitter"
      BBL_BORDER_LABEL="Glitter"
      ;;
    aurora)
      BBL_DECO_LEFT="~^°',.;:,/'°^~^°',.;:,/'°^|"
      BBL_DECO_RIGHT="|^°',.;:,/'°^~^°',.;:,/'°^~"
      BBL_BORDER_NAME="aurora"
      BBL_BORDER_LABEL="Aurora"
      ;;
    ribbon)
      BBL_DECO_LEFT="¯\`·.¸¸.·´¯\`·.¸¸.·´¯"
      BBL_DECO_RIGHT="¯\`·.¸¸.·´¯\`·.¸¸.·´¯"
      BBL_BORDER_NAME="ribbon"
      BBL_BORDER_LABEL="Ribbon"
      ;;
    petals)
      BBL_DECO_LEFT="(¯\`·.(¯\`·.(¯\`·.(¯\`·."
      BBL_DECO_RIGHT=".·´¯).·´¯).·´¯).·´¯)"
      BBL_BORDER_NAME="petals"
      BBL_BORDER_LABEL="Petals"
      ;;
    lace)
      BBL_DECO_LEFT="¸.·\`¯\`·.¸¸.·\`¯\`·"
      BBL_DECO_RIGHT="·\`¯\`·.¸¸.·\`¯\`·.¸"
      BBL_BORDER_NAME="lace"
      BBL_BORDER_LABEL="Lace"
      ;;
    cupid)
      BBL_DECO_LEFT="(¯\`·.¸¸.-> °º"
      BBL_DECO_RIGHT="º° <-.¸¸.·´¯)"
      BBL_BORDER_NAME="cupid"
      BBL_BORDER_LABEL="Cupid"
      ;;
    rose)
      BBL_DECO_LEFT="(\`¨§/¨´)---»--@-}"
      BBL_DECO_RIGHT="{-@--«---(\`¨§/¨´)"
      BBL_BORDER_NAME="rose"
      BBL_BORDER_LABEL="Rose"
      ;;
    moonbeam)
      BBL_DECO_LEFT="°·.¸.·°¯°·.¸.·°¯°·.¸.->"
      BBL_DECO_RIGHT="<-.¸.·°¯°·.¸.·°¯°·.¸.·°"
      BBL_BORDER_NAME="moonbeam"
      BBL_BORDER_LABEL="Moonbeam"
      ;;
    frame)
      BBL_DECO_LEFT="|!¤*'~\`\`~'*¤!||"
      BBL_DECO_RIGHT="||!¤*'~\`\`~'*¤!|"
      BBL_BORDER_NAME="frame"
      BBL_BORDER_LABEL="Frame"
      ;;
    comet)
      BBL_DECO_LEFT=",._.,-*^~*-,._.,-~>"
      BBL_DECO_RIGHT="<~-,._.,-*~^~*-,._.,"
      BBL_BORDER_NAME="comet"
      BBL_BORDER_LABEL="Comet"
      ;;
    chain)
      BBL_DECO_LEFT=".,;\`';_,_;\`';_._;'\`';_."
      BBL_DECO_RIGHT="._;'\`;\`._.';\`._.';\`,."
      BBL_BORDER_NAME="chain"
      BBL_BORDER_LABEL="Chain"
      ;;
    elegant)
      BBL_DECO_LEFT="»»-(¯\`·.·´¯)->"
      BBL_DECO_RIGHT="<-(¯\`·.·´¯)-««"
      BBL_BORDER_NAME="elegant"
      BBL_BORDER_LABEL="Elegant"
      ;;
    crystal)
      BBL_DECO_LEFT="(¨:::\"\"\"×_×/\"\"\":::*)----}"
      BBL_DECO_RIGHT="{----(+:::\"\"\"×_×/\"\"\":::¨)"
      BBL_BORDER_NAME="crystal"
      BBL_BORDER_LABEL="Crystal"
      ;;
    flirty)
      BBL_DECO_LEFT=".·\`sexy\`·..·>"
      BBL_DECO_RIGHT="<·..·´smart\`·."
      BBL_BORDER_NAME="flirty"
      BBL_BORDER_LABEL="Flirty"
      ;;
    moonlight)
      BBL_DECO_LEFT=".°.. °.. °.. °.."
      BBL_DECO_RIGHT="..° ..° ..° ..°."
      BBL_BORDER_NAME="moonlight"
      BBL_BORDER_LABEL="Moonlight"
      ;;
    ornate)
      BBL_DECO_LEFT="°º\"°¨¨°(_.·´¯\`·«¤°"
      BBL_DECO_RIGHT="°¤»·´¯\`·._)°¨¨°\"º°"
      BBL_BORDER_NAME="ornate"
      BBL_BORDER_LABEL="Ornate"
      ;;
    sweet)
      BBL_DECO_LEFT="(_*/Sweet/*_)(_*/*"
      BBL_DECO_RIGHT="*/*_)(_/*Love*/_)"
      BBL_BORDER_NAME="sweet"
      BBL_BORDER_LABEL="Sweet"
      ;;
    classic)
      BBL_DECO_LEFT="(°¨¨°/°¨¨°»"
      BBL_DECO_RIGHT="«°¨¨°/°¨¨°)"
      BBL_BORDER_NAME="classic"
      BBL_BORDER_LABEL="Classic"
      ;;
    kawaii)
      BBL_DECO_LEFT="(^^(-_-)^^)"
      BBL_DECO_RIGHT="(^^(-_-)^^)"
      BBL_BORDER_NAME="kawaii"
      BBL_BORDER_LABEL="Kawaii"
      ;;
    matrix)
      BBL_DECO_LEFT="||¯|_|¯|_.°.. °.. ->"
      BBL_DECO_RIGHT="<-..° ..°._|¯|_|¯||"
      BBL_BORDER_NAME="matrix"
      BBL_BORDER_LABEL="Matrix"
      ;;
    gamer)
      BBL_DECO_LEFT="²ºº³ xXx_"
      BBL_DECO_RIGHT="_xXx ²ºº³"
      BBL_BORDER_NAME="gamer"
      BBL_BORDER_LABEL="Gamer"
      ;;
    cyber)
      BBL_DECO_LEFT="¥-×xXx×-¥~"
      BBL_DECO_RIGHT="~¥-×xXx×-¥"
      BBL_BORDER_NAME="cyber"
      BBL_BORDER_LABEL="Cyber"
      ;;
    dream)
      BBL_DECO_LEFT=",.-~*´¨¯¨\`*·~-.¸-("
      BBL_DECO_RIGHT=")-,.-~*´¨¯¨\`*·~-.¸"
      BBL_BORDER_NAME="dream"
      BBL_BORDER_LABEL="Dream"
      ;;
    sleepy)
      BBL_DECO_LEFT="~~((-_-))~~_¯¯_/¯¯_"
      BBL_DECO_RIGHT="_¯¯_/¯¯_~~((-_-))~~"
      BBL_BORDER_NAME="sleepy"
      BBL_BORDER_LABEL="Sleepy"
      ;;
    retro)
      BBL_DECO_LEFT="_-'('-_°_-'('-_"
      BBL_DECO_RIGHT="_-')'-_°_-')'-_"
      BBL_BORDER_NAME="retro"
      BBL_BORDER_LABEL="Retro"
      ;;
    circles)
      BBL_DECO_LEFT=".o0×X×0o."
      BBL_DECO_RIGHT=".o0×X×0o."
      BBL_BORDER_NAME="circles"
      BBL_BORDER_LABEL="Circles"
      ;;
    whisper)
      BBL_DECO_LEFT="*-._.-* *-."
      BBL_DECO_RIGHT=".-*  *-._.-*"
      BBL_BORDER_NAME="whisper"
      BBL_BORDER_LABEL="Whisper"
      ;;

    # ══════════════════════════════════════════════════════════════════════════
    #  Unicode/Emoji nick-style borders (gerador de nick collection)
    # ══════════════════════════════════════════════════════════════════════════

    shimmer)
      BBL_DECO_LEFT="ミ★"
      BBL_DECO_RIGHT="★彡"
      BBL_BORDER_NAME="shimmer"
      BBL_BORDER_LABEL="Shimmer ★"
      ;;
    nova)
      BBL_DECO_LEFT="╰•★★"
      BBL_DECO_RIGHT="★★•╯"
      BBL_BORDER_NAME="nova"
      BBL_BORDER_LABEL="Nova ★★"
      ;;
    temple)
      BBL_DECO_LEFT="꧁•⊹٭"
      BBL_DECO_RIGHT="٭⊹•꧂"
      BBL_BORDER_NAME="temple"
      BBL_BORDER_LABEL="Temple ꧁꧂"
      ;;
    equalizer)
      BBL_DECO_LEFT="ıllıllı⭐🌟"
      BBL_DECO_RIGHT="🌟⭐ıllıllı"
      BBL_BORDER_NAME="equalizer"
      BBL_BORDER_LABEL="Equalizer 🌟"
      ;;
    celestial)
      BBL_DECO_LEFT="¸.·✩·.¸¸.·¯⍣✩"
      BBL_DECO_RIGHT="✩⍣¯·.¸¸.·✩·.¸"
      BBL_BORDER_NAME="celestial"
      BBL_BORDER_LABEL="Celestial ✩"
      ;;
    stardust)
      BBL_DECO_LEFT="\`✵•.¸,✵°✵.｡.✰"
      BBL_DECO_RIGHT="✰.｡.✵°✵,¸.•✵´"
      BBL_BORDER_NAME="stardust"
      BBL_BORDER_LABEL="Stardust ✵"
      ;;
    starwave)
      BBL_DECO_LEFT="·.★·.·´¯\`·.·★"
      BBL_DECO_RIGHT="★·.·´¯\`·.·★.·"
      BBL_BORDER_NAME="starwave"
      BBL_BORDER_LABEL="Starwave ★"
      ;;
    boop)
      BBL_DECO_LEFT="(◍•ᴗ•◍) ミ💖"
      BBL_DECO_RIGHT="💖彡"
      BBL_BORDER_NAME="boop"
      BBL_BORDER_LABEL="Boop 💖"
      ;;
    huggy)
      BBL_DECO_LEFT="(づ｡◕‿‿◕｡)づ"
      BBL_DECO_RIGHT="٩(˘◡˘)۶"
      BBL_BORDER_NAME="huggy"
      BBL_BORDER_LABEL="Huggy ◕‿◕"
      ;;
    kittycat)
      BBL_DECO_LEFT="≽^•⩊•^≼"
      BBL_DECO_RIGHT="◝(ᵔᵕᵔ)◜"
      BBL_BORDER_NAME="kittycat"
      BBL_BORDER_LABEL="Kittycat 🐱"
      ;;
    cherry)
      BBL_DECO_LEFT="🌸ξξ(∵❤◡❤∵)ξξ·¯·♩¸"
      BBL_DECO_RIGHT="¸♩·¯·ξξ(∵❤◡❤∵)ξξ🌸"
      BBL_BORDER_NAME="cherry"
      BBL_BORDER_LABEL="Cherry 🌸"
      ;;
    bow)
      BBL_DECO_LEFT="•´¯\`•. 🎀"
      BBL_DECO_RIGHT="🎀 .•\`¯´•"
      BBL_BORDER_NAME="bow"
      BBL_BORDER_LABEL="Bow 🎀"
      ;;
    candy)
      BBL_DECO_LEFT="🍰 ⋆ 🍭 🎀"
      BBL_DECO_RIGHT="🎀 🍭 ⋆ 🍰"
      BBL_BORDER_NAME="candy"
      BBL_BORDER_LABEL="Candy 🍭"
      ;;
    gothic)
      BBL_DECO_LEFT="꧁༺"
      BBL_DECO_RIGHT="༻꧂"
      BBL_BORDER_NAME="gothic"
      BBL_BORDER_LABEL="Gothic ༺༻"
      ;;
    mystic)
      BBL_DECO_LEFT="ঔৣ☬✞"
      BBL_DECO_RIGHT="✞☬ঔৣ"
      BBL_BORDER_NAME="mystic"
      BBL_BORDER_LABEL="Mystic ☬"
      ;;
    darkrose)
      BBL_DECO_LEFT="꧁༆•❤༒☬"
      BBL_DECO_RIGHT="☬༒❤•༆꧂"
      BBL_BORDER_NAME="darkrose"
      BBL_BORDER_LABEL="Dark Rose ☬❤"
      ;;
    smiley)
      BBL_DECO_LEFT="(^▽^)"
      BBL_DECO_RIGHT="(✿^▽^)"
      BBL_BORDER_NAME="smiley"
      BBL_BORDER_LABEL="Smiley (^▽^)"
      ;;
    softy)
      BBL_DECO_LEFT="•ᴗ•"
      BBL_DECO_RIGHT="˶ᵔ ᵕ ᵔ˶"
      BBL_BORDER_NAME="softy"
      BBL_BORDER_LABEL="Softy •ᴗ•"
      ;;
    robot)
      BBL_DECO_LEFT="♥╣[-_-]╠♥"
      BBL_DECO_RIGHT="♥╣[-_-]╠♥"
      BBL_BORDER_NAME="robot"
      BBL_BORDER_LABEL="Robot ╣╠"
      ;;
    crown)
      BBL_DECO_LEFT="°•꧁,👑_"
      BBL_DECO_RIGHT="_👑꧂•°"
      BBL_BORDER_NAME="crown"
      BBL_BORDER_LABEL="Crown 👑"
      ;;
    party)
      BBL_DECO_LEFT="ﾟ･:,｡★＼(^-^ )♪"
      BBL_DECO_RIGHT="♪( ^-^)/★,｡･:･ﾟ"
      BBL_BORDER_NAME="party"
      BBL_BORDER_LABEL="Party ♪★"
      ;;
    sparkly)
      BBL_DECO_LEFT="｡+ﾟ☆ﾟ+｡★｡+ﾟ"
      BBL_DECO_RIGHT="☆ﾟ+｡★｡+ﾟ☆ﾟ+"
      BBL_BORDER_NAME="sparkly"
      BBL_BORDER_LABEL="Sparkly ☆"
      ;;
    loveletter)
      BBL_DECO_LEFT="✧˖°˚₊·💌"
      BBL_DECO_RIGHT="💝⁺˚⋆🌹⁺˚⋆💝"
      BBL_BORDER_NAME="loveletter"
      BBL_BORDER_LABEL="Love Letter 💌"
      ;;
    hearts)
      BBL_DECO_LEFT="◦•●❤♡"
      BBL_DECO_RIGHT="♡❤●•◦"
      BBL_BORDER_NAME="hearts"
      BBL_BORDER_LABEL="Hearts ❤♡"
      ;;
    formal)
      BBL_DECO_LEFT="§.•´¨'°÷•..×"
      BBL_DECO_RIGHT="×,.•´¨'°÷•..§"
      BBL_BORDER_NAME="formal"
      BBL_BORDER_LABEL="Formal §"
      ;;
    vintage)
      BBL_DECO_LEFT="¸„.-•~¹°\"ˆ˜¨"
      BBL_DECO_RIGHT="¨˜ˆ\"°¹~•-.„¸"
      BBL_BORDER_NAME="vintage"
      BBL_BORDER_LABEL="Vintage"
      ;;
    gem)
      BBL_DECO_LEFT="*•.¸♡"
      BBL_DECO_RIGHT="♡¸.•*"
      BBL_BORDER_NAME="gem"
      BBL_BORDER_LABEL="Gem ♡"
      ;;
    heartwave)
      BBL_DECO_LEFT="෴❤️෴"
      BBL_DECO_RIGHT="෴❤️෴"
      BBL_BORDER_NAME="heartwave"
      BBL_BORDER_LABEL="Heartwave ෴❤️"
      ;;
    snowflake)
      BBL_DECO_LEFT="*ੈ✩‧₊˚"
      BBL_DECO_RIGHT="˚₊‧✩*ੈ"
      BBL_BORDER_NAME="snowflake"
      BBL_BORDER_LABEL="Snowflake ✩"
      ;;
    valentine)
      BBL_DECO_LEFT="💖´ *•.¸♥¸.•**"
      BBL_DECO_RIGHT="**•.¸♥¸.•*´💖"
      BBL_BORDER_NAME="valentine"
      BBL_BORDER_LABEL="Valentine 💖"
      ;;
    starornate)
      BBL_DECO_LEFT="★¸.•☆•.¸★"
      BBL_DECO_RIGHT="★¸.•☆•.★"
      BBL_BORDER_NAME="starornate"
      BBL_BORDER_LABEL="Star Ornate ☆"
      ;;
    floral)
      BBL_DECO_LEFT="ミミ◦❧◦°˚°◦.¸¸◦°´❤*•.¸♥"
      BBL_DECO_RIGHT="♥¸.•*❤´°◦¸¸.◦°˚°◦☙◦彡彡"
      BBL_BORDER_NAME="floral"
      BBL_BORDER_LABEL="Floral ❧☙"
      ;;
    happyface)
      BBL_DECO_LEFT="(人◕‿◕)"
      BBL_DECO_RIGHT="(•◡•)"
      BBL_BORDER_NAME="happyface"
      BBL_BORDER_LABEL="Happy (◕‿◕)"
      ;;
    wink)
      BBL_DECO_LEFT="彡(✿╹◡╹)"
      BBL_DECO_RIGHT="(｀∀´)Ψ"
      BBL_BORDER_NAME="wink"
      BBL_BORDER_LABEL="Wink (✿╹◡╹)"
      ;;
    lovesong)
      BBL_DECO_LEFT="♡〜ლ(๑癶"
      BBL_DECO_RIGHT="癶๑)ლ〜♡"
      BBL_BORDER_NAME="lovesong"
      BBL_BORDER_LABEL="Lovesong ♡ლ"
      ;;
    starjewel)
      BBL_DECO_LEFT="٭⊹¤.•⨳•.*☆✬"
      BBL_DECO_RIGHT="✬☆*.•⨳•.¤⊹٭"
      BBL_BORDER_NAME="starjewel"
      BBL_BORDER_LABEL="Star Jewel ☆✬"
      ;;
    heartthrob)
      BBL_DECO_LEFT="💗◕‿◕💗"
      BBL_DECO_RIGHT="(♡˓‿♡)"
      BBL_BORDER_NAME="heartthrob"
      BBL_BORDER_LABEL="Heartthrob 💗"
      ;;
    heartbow)
      BBL_DECO_LEFT="\`•.¸¸.•´´¯\`••._.• 🎀"
      BBL_DECO_RIGHT="🎀 •._.••\`¯´´•.¸¸.•\`"
      BBL_BORDER_NAME="heartbow"
      BBL_BORDER_LABEL="Heart Bow 🎀"
      ;;

    # ══════════════════════════════════════════════════════════════════════════
    #  MSN-era text art borders — collection 3
    # ══════════════════════════════════════════════════════════════════════════

    question)
      BBL_DECO_LEFT="•?((¯°·._.•"
      BBL_DECO_RIGHT="•._.·°¯))؟•"
      BBL_BORDER_NAME="question"
      BBL_BORDER_LABEL="Question"
      ;;
    pulse)
      BBL_DECO_LEFT="ıllıllı"
      BBL_DECO_RIGHT="ıllıllı"
      BBL_BORDER_NAME="pulse"
      BBL_BORDER_LABEL="Pulse"
      ;;
    golden)
      BBL_DECO_LEFT="¸,ø¤º°\`°º¤ø,¸¸,ø¤º°"
      BBL_DECO_RIGHT="°º¤ø,¸¸,ø¤º°\`°º¤ø,¸"
      BBL_BORDER_NAME="golden"
      BBL_BORDER_LABEL="Golden"
      ;;
    mist)
      BBL_DECO_LEFT="°°°·.°·..·°¯°·._.·"
      BBL_DECO_RIGHT="·._.·°¯°·.·° .·°°°"
      BBL_BORDER_NAME="mist"
      BBL_BORDER_LABEL="Mist"
      ;;
    simple)
      BBL_DECO_LEFT="•´¯\`•."
      BBL_DECO_RIGHT=".•´¯\`•"
      BBL_BORDER_NAME="simple"
      BBL_BORDER_LABEL="Simple"
      ;;
    mirror)
      BBL_DECO_LEFT="×º°\"˜\`\"°º×"
      BBL_DECO_RIGHT="×º°\"˜\`\"°º×"
      BBL_BORDER_NAME="mirror"
      BBL_BORDER_LABEL="Mirror"
      ;;
    arrow)
      BBL_DECO_LEFT="•]••´º´•»"
      BBL_DECO_RIGHT="«•´º´••[•"
      BBL_BORDER_NAME="arrow"
      BBL_BORDER_LABEL="Arrow"
      ;;
    blade)
      BBL_DECO_LEFT="]|I{•------»"
      BBL_DECO_RIGHT="«------•}I|["
      BBL_BORDER_NAME="blade"
      BBL_BORDER_LABEL="Blade"
      ;;
    dot)
      BBL_DECO_LEFT="•°¯\`••"
      BBL_DECO_RIGHT="••´¯°•"
      BBL_BORDER_NAME="dot"
      BBL_BORDER_LABEL="Dot"
      ;;
    dizzy)
      BBL_DECO_LEFT="._|.<(+_+)>.|_."
      BBL_DECO_RIGHT="._|.<(+_+)>.|_."
      BBL_BORDER_NAME="dizzy"
      BBL_BORDER_LABEL="Dizzy"
      ;;
    leaf)
      BBL_DECO_LEFT="•._.••´¯\`\`•.¸¸.•\`"
      BBL_DECO_RIGHT="\`•.¸¸.•´´¯\`••._.•"
      BBL_BORDER_NAME="leaf"
      BBL_BORDER_LABEL="Leaf"
      ;;
    bracket)
      BBL_DECO_LEFT="(¯´•._.•"
      BBL_DECO_RIGHT="•._.•´¯)"
      BBL_BORDER_NAME="bracket"
      BBL_BORDER_LABEL="Bracket"
      ;;
    chevron)
      BBL_DECO_LEFT="••¤(\`×[¤"
      BBL_DECO_RIGHT="¤]×´)¤••"
      BBL_BORDER_NAME="chevron"
      BBL_BORDER_LABEL="Chevron"
      ;;
    breeze)
      BBL_DECO_LEFT="•´¯\`•»"
      BBL_DECO_RIGHT="«•´¯\`•"
      BBL_BORDER_NAME="breeze"
      BBL_BORDER_LABEL="Breeze"
      ;;
    bronze)
      BBL_DECO_LEFT="\`•.,¸¸,.•´¯"
      BBL_DECO_RIGHT="¯\`•.,¸¸,.•´"
      BBL_BORDER_NAME="bronze"
      BBL_BORDER_LABEL="Bronze"
      ;;
    scroll)
      BBL_DECO_LEFT="¸,ø¤º°\`°º¤ø,¸"
      BBL_DECO_RIGHT="¸,ø¤º°\`°º¤ø,¸"
      BBL_BORDER_NAME="scroll"
      BBL_BORDER_LABEL="Scroll"
      ;;
    dots)
      BBL_DECO_LEFT="••.•´¯\`•.••"
      BBL_DECO_RIGHT="••.•´¯\`•.••"
      BBL_BORDER_NAME="dots"
      BBL_BORDER_LABEL="Dots"
      ;;
    goldstar)
      BBL_DECO_LEFT=".•°¤*(¯\`★´¯)*¤°"
      BBL_DECO_RIGHT="°¤*(¯´★\`¯)*¤°•."
      BBL_BORDER_NAME="goldstar"
      BBL_BORDER_LABEL="Gold Star ★"
      ;;
    sultan)
      BBL_DECO_LEFT="๑۞๑,¸¸,ø¤º°\`°๑۩"
      BBL_DECO_RIGHT="๑۩ ,¸¸,ø¤º°\`°๑۞๑"
      BBL_BORDER_NAME="sultan"
      BBL_BORDER_LABEL="Sultan ۞"
      ;;
    sakura)
      BBL_DECO_LEFT="-漫~*'¨¯¨'*·舞~"
      BBL_DECO_RIGHT="~舞*'¨¯¨'*·~漫-"
      BBL_BORDER_NAME="sakura"
      BBL_BORDER_LABEL="Sakura 漫舞"
      ;;
    gradient)
      BBL_DECO_LEFT="▁ ▂ ▄ ▅ ▆ ▇ █"
      BBL_DECO_RIGHT="█ ▇ ▆ ▅ ▄ ▂ ▁"
      BBL_BORDER_NAME="gradient"
      BBL_BORDER_LABEL="Gradient █▁"
      ;;
    checker)
      BBL_DECO_LEFT="▀▄▀▄▀▄"
      BBL_DECO_RIGHT="▄▀▄▀▄▀"
      BBL_BORDER_NAME="checker"
      BBL_BORDER_LABEL="Checker ▀▄"
      ;;
    zen)
      BBL_DECO_LEFT="(-_-)"
      BBL_DECO_RIGHT="(-_-)"
      BBL_BORDER_NAME="zen"
      BBL_BORDER_LABEL="Zen"
      ;;
    barcode)
      BBL_DECO_LEFT="▌│█║▌║▌║"
      BBL_DECO_RIGHT="║▌║▌║█│▌"
      BBL_BORDER_NAME="barcode"
      BBL_BORDER_LABEL="Barcode ▌║"
      ;;

    next)
      _bbl_border_next
      return $?
      ;;
    *)
      printf 'barbarella: borda "%s" não encontrada\n' "$name" >&2
      printf 'Use: bbl border list\n' >&2
      return 1
      ;;
  esac

  _bbl_config_set "BBL_CURRENT_BORDER" "$name"
}

_bbl_border_next() {
  local borders=($BBL_ALL_BORDERS)
  local current="${BBL_BORDER_NAME:-none}"
  local idx=0 i
  for i in "${!borders[@]}"; do
    [[ "${borders[$i]}" == "$current" ]] && { idx=$i; break; }
  done
  local next=$(( (idx + 1) % ${#borders[@]} ))
  _bbl_load_border "${borders[$next]}"
}

_bbl_cmd_border() {
  case "${1:-list}" in
    list|ls|"")
      _bbl_border_list
      ;;
    preview)
      _bbl_border_preview
      ;;
    *)
      _bbl_load_border "${1}" && {
        _bbl_rebuild_prompt 2>/dev/null || bbl_rebuild_prompt
        printf '%s Borda aplicada: %s\n' \
          "$(bbl_fg "${BBL_C_SUCCESS:-114}")" \
          "$(bbl_paint_bold "${BBL_C_PRIMARY:-218}" "${BBL_BORDER_LABEL}")$(bbl_reset)"
      }
      ;;
  esac
}

_bbl_border_list() {
  printf '\n'
  bbl_paint_bold "${BBL_C_PRIMARY}" "  Bordas decorativas:"
  printf '\n'
  bbl_paint "${BBL_C_MUTED}" "  Use: bbl border <nome>  |  bbl border preview  |  Ctrl+X b"
  printf '\n\n'

  local b current_marker
  local section=""

  for b in $BBL_ALL_BORDERS; do
    [ "$b" = "next" ] && continue

    # Section headers
    if [ "$b" = "none" ] && [ "$section" != "msn" ]; then
      bbl_paint "${BBL_C_ACCENT}" "  ── MSN / Text Art ──"
      printf '\n'
      section="msn"
    elif [ "$b" = "shimmer" ] && [ "$section" != "unicode" ]; then
      printf '\n'
      bbl_paint "${BBL_C_ACCENT}" "  ── Unicode / Emoji ──"
      printf '\n'
      section="unicode"
    elif [ "$b" = "question" ] && [ "$section" != "msn3" ]; then
      printf '\n'
      bbl_paint "${BBL_C_ACCENT}" "  ── MSN / Text Art II ──"
      printf '\n'
      section="msn3"
    fi

    current_marker=""
    [ "$b" = "${BBL_BORDER_NAME:-none}" ] && current_marker=" $(bbl_paint "${BBL_C_SUCCESS}" "◀ atual")"
    printf '  %-16s %s%s\n' \
      "$(bbl_paint_bold "${BBL_C_SECONDARY}" "$b")" \
      "$(bbl_dim)$(bbl_fg "${BBL_C_MUTED}")bbl border ${b}$(bbl_reset)" \
      "$current_marker"
  done
  printf '\n'
}

_bbl_border_preview() {
  printf '\n'
  bbl_paint_bold "${BBL_C_PRIMARY}" "  Preview de bordas:"
  printf '\n\n'
  local b
  local saved_l="${BBL_DECO_LEFT:-}"
  local saved_r="${BBL_DECO_RIGHT:-}"
  local saved_name="${BBL_BORDER_NAME:-none}"
  local section=""

  for b in $BBL_ALL_BORDERS; do
    [ "$b" = "none" ] && continue
    [ "$b" = "next" ] && continue

    # Section headers
    if [ "$b" = "waves" ] && [ "$section" != "msn" ]; then
      bbl_paint "${BBL_C_ACCENT}" "  ── MSN / Text Art ──"
      printf '\n'
      section="msn"
    elif [ "$b" = "shimmer" ] && [ "$section" != "unicode" ]; then
      printf '\n'
      bbl_paint "${BBL_C_ACCENT}" "  ── Unicode / Emoji ──"
      printf '\n'
      section="unicode"
    elif [ "$b" = "question" ] && [ "$section" != "msn3" ]; then
      printf '\n'
      bbl_paint "${BBL_C_ACCENT}" "  ── MSN / Text Art II ──"
      printf '\n'
      section="msn3"
    fi

    _bbl_load_border "$b" 2>/dev/null
    printf '  %-14s %s %s %s\n' \
      "$(bbl_paint_bold "${BBL_C_SECONDARY}" "$b")" \
      "$(bbl_paint "${BBL_C_PRIMARY}" "$BBL_DECO_LEFT")" \
      "$(bbl_paint "${BBL_C_ACCENT}" "user@host · ~/path · 10:42")" \
      "$(bbl_paint "${BBL_C_PRIMARY}" "$BBL_DECO_RIGHT")"
  done
  # Restore
  BBL_DECO_LEFT="$saved_l"
  BBL_DECO_RIGHT="$saved_r"
  BBL_BORDER_NAME="$saved_name"
  printf '\n'
}
