Verbs::Conjugator.conjugations do |conjugate|

  conjugate.irregular :be do |verb| # copular
    verb.form :am,    :tense => :present, :person => :first,  :plurality => :singular
    verb.form :is,    :tense => :present, :person => :third,  :plurality => :singular
    verb.form :are,   :tense => :present, :person => :second, :plurality => :singular
    verb.form :are,   :tense => :present, :person => :second, :plurality => :plural
    verb.form :are,   :tense => :present, :person => :first,  :plurality => :plural
    verb.form :are,   :tense => :present, :person => :third,  :plurality => :plural
    verb.form :was,   :tense => :past,    :person => :first,  :plurality => :singular
    verb.form :was,   :tense => :past,    :person => :third,  :plurality => :singular
    verb.form :were,  :tense => :past,    :person => :second, :plurality => :singular
    verb.form :were,  :tense => :past,    :person => :second, :plurality => :plural
    verb.form :were,  :tense => :past,    :person => :first,  :plurality => :plural
    verb.form :were,  :tense => :past,    :person => :third,  :plurality => :plural
    verb.form :were,  :tense => :past,    :mood => :subjunctive
    verb.form :be,    :tense => :present, :mood => :subjunctive
    verb.form :being, :tense => :present, :derivative => :participle
    verb.form :been,  :tense => :past,    :derivative => :participle
  end

  conjugate.irregular :have do |verb|
    verb.form :have,   :tense => :present, :person => :first,  :plurality => :singular
    verb.form :has,    :tense => :present, :person => :third,  :plurality => :singular
    verb.form :have,   :tense => :present, :person => :second, :plurality => :singular
    verb.form :have,   :tense => :present, :person => :second, :plurality => :plural
    verb.form :have,   :tense => :present, :person => :first,  :plurality => :plural
    verb.form :have,   :tense => :present, :person => :third,  :plurality => :plural
    verb.form :had,    :tense => :past,    :person => :first,  :plurality => :singular
    verb.form :had,    :tense => :past,    :person => :third,  :plurality => :singular
    verb.form :had,    :tense => :past,    :person => :second, :plurality => :singular
    verb.form :had,    :tense => :past,    :person => :second, :plurality => :plural
    verb.form :had,    :tense => :past,    :person => :first,  :plurality => :plural
    verb.form :had,    :tense => :past,    :person => :third,  :plurality => :plural
    verb.form :having, :tense => :present, :derivative => :participle
    verb.form :had,    :tense => :past,    :derivative => :participle
  end

  # http://cpansearch.perl.org/src/RWG/Lingua-EN-Conjugate-0.308/lib/Lingua/EN/Conjugate.pm
  conjugate.irregular :awake, :awoke, :awoken
  conjugate.irregular :bear, :bore, :born
  conjugate.irregular :beat, :beat, :beat
  conjugate.irregular :become, :became, :become
  conjugate.irregular :begin, :began, :begun
  conjugate.irregular :bend, :bent, :bent
  conjugate.irregular :beset, :beset, :beset
  conjugate.irregular :bet, :bet, :bet
  conjugate.irregular :bid, :bid, :bid
  conjugate.irregular :bind, :bound, :bound
  conjugate.irregular :bite, :bit, :bitten
  conjugate.irregular :bleed, :bled, :bled
  conjugate.irregular :blow, :blew, :blown
  conjugate.irregular :break, :broke, :broken
  conjugate.irregular :breed, :bred, :bred
  conjugate.irregular :bring, :brought, :brought
  conjugate.irregular :broadcast, :broadcast, :broadcast
  conjugate.irregular :build, :built, :built
  conjugate.irregular :burn, :burned, :burned
  conjugate.irregular :burst, :burst, :burst
  conjugate.irregular :buy, :bought, :bought
  conjugate.irregular :cast, :cast, :cast
  conjugate.irregular :catch, :caught, :caught
  conjugate.irregular :choose, :chose, :chosen
  conjugate.irregular :cling, :clung, :clung
  conjugate.irregular :come, :came, :come
  conjugate.irregular :cost, :cost, :cost
  conjugate.irregular :creep, :crept, :crept
  conjugate.irregular :cut, :cut, :cut
  conjugate.irregular :deal, :dealt, :dealt
  conjugate.irregular :dig, :dug, :dug
  conjugate.irregular :dive, :dove, :dived
  conjugate.irregular 'do', :did, :done
  conjugate.irregular :draw, :drew, :drawn
  conjugate.irregular :dream, :dreamed, :dreamed
  conjugate.irregular :drive, :drove, :driven
  conjugate.irregular :drink, :drank, :drunk
  conjugate.irregular :eat, :ate, :eaten
  conjugate.irregular :fall, :fell, :fallen
  conjugate.irregular :feed, :fed, :fed
  conjugate.irregular :feel, :felt, :felt
  conjugate.irregular :fight, :fought, :fought
  conjugate.irregular :find, :found, :found
  conjugate.irregular :fit, :fit, :fit
  conjugate.irregular :flee, :fled, :fled
  conjugate.irregular :fling, :flung, :flung
  conjugate.irregular :fly, :flew, :flown
  conjugate.irregular :forbid, :forbade, :forbidden
  conjugate.irregular :forget, :forgot, :forgotten
  conjugate.irregular :forego, :forewent, :foregone
  conjugate.irregular :forgo, :forwent, :forgone
  conjugate.irregular :forgive, :forgave, :forgiven
  conjugate.irregular :forsake, :forsook, :forsaken
  conjugate.irregular :freeze, :froze, :frozen
  conjugate.irregular :get, :got, :gotten
  conjugate.irregular :give, :gave, :given
  conjugate.irregular :go, :went, :gone
  conjugate.irregular :grind, :ground, :ground
  conjugate.irregular :grow, :grew, :grown
  conjugate.irregular :hang, :hung, :hung
  conjugate.irregular :hear, :heard, :heard
  conjugate.irregular :hide, :hid, :hidden
  conjugate.irregular :hit, :hit, :hit
  conjugate.irregular :hold, :held, :held
  conjugate.irregular :hurt, :hurt, :hurt
  conjugate.irregular :keep, :kept, :kept
  conjugate.irregular :kneel, :knelt, :knelt
  conjugate.irregular :knit, :knit, :knit
  conjugate.irregular :know, :knew, :known
  conjugate.irregular :lay, :laid, :laid
  conjugate.irregular :lead, :led, :led
  conjugate.irregular :leap, :leaped, :leaped
  conjugate.irregular :learn, :learned, :learned
  conjugate.irregular :leave, :left, :left
  conjugate.irregular :lend, :lent, :lent
  conjugate.irregular :let, :let, :let
  conjugate.irregular :lie, :lay, :lain
  conjugate.irregular :light, :lit, :lighted
  conjugate.irregular :lose, :lost, :lost
  conjugate.irregular :make, :made, :made
  conjugate.irregular :mean, :meant, :meant
  conjugate.irregular :meet, :met, :met
  conjugate.irregular :misspell, :misspelled, :misspelled
  conjugate.irregular :mistake, :mistook, :mistaken
  conjugate.irregular :mow, :mowed, :mowed
  conjugate.irregular :overcome, :overcame, :overcome
  conjugate.irregular :overdo, :overdid, :overdone
  conjugate.irregular :overtake, :overtook, :overtaken
  conjugate.irregular :overthrow, :overthrew, :overthrown
  conjugate.irregular :pay, :paid, :paid
  conjugate.irregular :plead, :pled, :pled
  conjugate.irregular :prove, :proved, :proved
  conjugate.irregular :put, :put, :put
  conjugate.irregular :quit, :quit, :quit
  conjugate.irregular :read, :read, :read
  conjugate.irregular :reset, :reset, :reset
  conjugate.irregular :rid, :rid, :rid
  conjugate.irregular :ride, :rode, :ridden
  conjugate.irregular :ring, :rang, :rung
  conjugate.irregular :rise, :rose, :risen
  conjugate.irregular :run, :ran, :run
  conjugate.irregular :saw, :sawed, :sawed
  conjugate.irregular :say, :said, :said
  conjugate.irregular :see, :saw, :seen
  conjugate.irregular :seek, :sought, :sought
  conjugate.irregular :sell, :sold, :sold
  conjugate.irregular :send, :sent, :sent
  conjugate.irregular :set, :set, :set
  conjugate.irregular :sew, :sewed, :sewed
  conjugate.irregular :shake, :shook, :shaken
  conjugate.irregular :shave, :shaved, :shaved
  conjugate.irregular :shear, :shore, :shorn
  conjugate.irregular :shed, :shed, :shed
  conjugate.irregular :shine, :shone, :shone
  conjugate.irregular :shoe, :shoed, :shoed
  conjugate.irregular :shoot, :shot, :shot
  conjugate.irregular :show, :showed, :showed
  conjugate.irregular :shrink, :shrank, :shrunk
  conjugate.irregular :shut, :shut, :shut
  conjugate.irregular :sing, :sang, :sung
  conjugate.irregular :sink, :sank, :sunk
  conjugate.irregular :sit, :sat, :sat
  conjugate.irregular :sleep, :slept, :slept
  conjugate.irregular :slay, :slew, :slain
  conjugate.irregular :slide, :slid, :slid
  conjugate.irregular :sling, :slung, :slung
  conjugate.irregular :slit, :slit, :slit
  conjugate.irregular :smite, :smote, :smitten
  conjugate.irregular :sow, :sowed, :sowed
  conjugate.irregular :speak, :spoke, :spoken
  conjugate.irregular :speed, :sped, :sped
  conjugate.irregular :spend, :spent, :spent
  conjugate.irregular :spill, :spilled, :spilled
  conjugate.irregular :spin, :spun, :spun
  conjugate.irregular :spit, :spit, :spit
  conjugate.irregular :split, :split, :split
  conjugate.irregular :spread, :spread, :spread
  conjugate.irregular :spring, :sprang, :sprung
  conjugate.irregular :stand, :stood, :stood
  conjugate.irregular :steal, :stole, :stolen
  conjugate.irregular :stick, :stuck, :stuck
  conjugate.irregular :sting, :stung, :stung
  conjugate.irregular :stink, :stank, :stunk
  conjugate.irregular :stride, :strod, :stridden
  conjugate.irregular :strike, :struck, :struck
  conjugate.irregular :string, :strung, :strung
  conjugate.irregular :strive, :strove, :striven
  conjugate.irregular :swear, :swore, :sworn
  conjugate.irregular :sweep, :swept, :swept
  conjugate.irregular :swell, :swelled, :swelled
  conjugate.irregular :swim, :swam, :swum
  conjugate.irregular :swing, :swung, :swung
  conjugate.irregular :take, :took, :taken
  conjugate.irregular :teach, :taught, :taught
  conjugate.irregular :tear, :tore, :torn
  conjugate.irregular :tell, :told, :told
  conjugate.irregular :think, :thought, :thought
  conjugate.irregular :thrive, :thrived, :thrived
  conjugate.irregular :throw, :threw, :thrown
  conjugate.irregular :thrust, :thrust, :thrust
  conjugate.irregular :tread, :trod, :trodden
  conjugate.irregular :understand, :understood, :understood
  conjugate.irregular :uphold, :upheld, :upheld
  conjugate.irregular :upset, :upset, :upset
  conjugate.irregular :wake, :woke, :woken
  conjugate.irregular :wear, :wore, :worn
  conjugate.irregular :weave, :wove, :woven
  conjugate.irregular :wed, :wed, :wed
  conjugate.irregular :weep, :wept, :wept
  conjugate.irregular :wind, :wound, :wound
  conjugate.irregular :win, :won, :won
  conjugate.irregular :withhold, :withheld, :withheld
  conjugate.irregular :withstand, :withstood, :withstood
  conjugate.irregular :wring, :wrung, :wrung
  conjugate.irregular :write, :wrote, :written
  conjugate.single_terminal_consonant :abandon
  conjugate.single_terminal_consonant :accouter
  conjugate.single_terminal_consonant :accredit
  conjugate.single_terminal_consonant :adhibit
  conjugate.single_terminal_consonant :administer
  conjugate.single_terminal_consonant :alter
  conjugate.single_terminal_consonant :anchor
  conjugate.single_terminal_consonant :answer
  conjugate.single_terminal_consonant :attrit
  conjugate.single_terminal_consonant :audit
  conjugate.single_terminal_consonant :author
  conjugate.single_terminal_consonant :ballot
  conjugate.single_terminal_consonant :banner
  conjugate.single_terminal_consonant :batten
  conjugate.single_terminal_consonant :bedizen
  conjugate.single_terminal_consonant :bespatter
  conjugate.single_terminal_consonant :betoken
  conjugate.single_terminal_consonant :bewilder
  conjugate.single_terminal_consonant :billet
  conjugate.single_terminal_consonant :blacken
  conjugate.single_terminal_consonant :blither
  conjugate.single_terminal_consonant :blossom
  conjugate.single_terminal_consonant :bother
  conjugate.single_terminal_consonant :brighten
  conjugate.single_terminal_consonant :broaden
  conjugate.single_terminal_consonant :broider
  conjugate.single_terminal_consonant :burden
  conjugate.single_terminal_consonant :caparison
  conjugate.single_terminal_consonant :catalog
  conjugate.single_terminal_consonant :censor
  conjugate.single_terminal_consonant :center
  conjugate.single_terminal_consonant :charter
  conjugate.single_terminal_consonant :chatter
  conjugate.single_terminal_consonant :cheapen
  conjugate.single_terminal_consonant :chipper
  conjugate.single_terminal_consonant :chirrup
  conjugate.single_terminal_consonant :christen
  conjugate.single_terminal_consonant :clobber
  conjugate.single_terminal_consonant :cluster
  conjugate.single_terminal_consonant :coarsen
  conjugate.single_terminal_consonant :cocker
  conjugate.single_terminal_consonant :coedit
  conjugate.single_terminal_consonant :cohabit
  conjugate.single_terminal_consonant :color
  conjugate.single_terminal_consonant :concenter
  conjugate.single_terminal_consonant :corner
  conjugate.single_terminal_consonant :cover
  conjugate.single_terminal_consonant :covet
  conjugate.single_terminal_consonant :cower
  conjugate.single_terminal_consonant :credit
  conjugate.single_terminal_consonant :custom
  conjugate.single_terminal_consonant :dampen
  conjugate.single_terminal_consonant :deafen
  conjugate.single_terminal_consonant :decipher
  conjugate.single_terminal_consonant :deflower
  conjugate.single_terminal_consonant :delimit
  conjugate.single_terminal_consonant :deliver
  conjugate.single_terminal_consonant :deposit
  conjugate.single_terminal_consonant :develop
  conjugate.single_terminal_consonant :differ
  conjugate.single_terminal_consonant :disaccustom
  conjugate.single_terminal_consonant :discover
  conjugate.single_terminal_consonant :discredit
  conjugate.single_terminal_consonant :disencumber
  conjugate.single_terminal_consonant :dishearten
  conjugate.single_terminal_consonant :disinherit
  conjugate.single_terminal_consonant :dismember
  conjugate.single_terminal_consonant :dispirit
  conjugate.single_terminal_consonant :dither
  conjugate.single_terminal_consonant :dizen
  conjugate.single_terminal_consonant :dodder
  conjugate.single_terminal_consonant :edit
  conjugate.single_terminal_consonant :elicit
  conjugate.single_terminal_consonant :embitter
  conjugate.single_terminal_consonant :embolden
  conjugate.single_terminal_consonant :embosom
  conjugate.single_terminal_consonant :embower
  conjugate.single_terminal_consonant :empoison
  conjugate.single_terminal_consonant :empower
  conjugate.single_terminal_consonant :enamor
  conjugate.single_terminal_consonant :encipher
  conjugate.single_terminal_consonant :encounter
  conjugate.single_terminal_consonant :endanger
  conjugate.single_terminal_consonant :enfetter
  conjugate.single_terminal_consonant :engender
  conjugate.single_terminal_consonant :enlighten
  conjugate.single_terminal_consonant :enter
  conjugate.single_terminal_consonant :envelop
  conjugate.single_terminal_consonant :envenom
  conjugate.single_terminal_consonant :environ
  conjugate.single_terminal_consonant :exhibit
  conjugate.single_terminal_consonant :exit
  conjugate.single_terminal_consonant :fasten
  conjugate.single_terminal_consonant :fatten
  conjugate.single_terminal_consonant :feather
  conjugate.single_terminal_consonant :fester
  conjugate.single_terminal_consonant :filter
  conjugate.single_terminal_consonant :flatten
  conjugate.single_terminal_consonant :flatter
  conjugate.single_terminal_consonant :flounder
  conjugate.single_terminal_consonant :fluster
  conjugate.single_terminal_consonant :flutter
  conjugate.single_terminal_consonant :follow
  conjugate.single_terminal_consonant :foreshorten
  conjugate.single_terminal_consonant :founder
  conjugate.single_terminal_consonant :fritter
  conjugate.single_terminal_consonant :gammon
  conjugate.single_terminal_consonant :gather
  conjugate.single_terminal_consonant :gladden
  conjugate.single_terminal_consonant :glimmer
  conjugate.single_terminal_consonant :glisten
  conjugate.single_terminal_consonant :glower
  conjugate.single_terminal_consonant :greaten
  conjugate.single_terminal_consonant :hamper
  conjugate.single_terminal_consonant :hanker
  conjugate.single_terminal_consonant :happen
  conjugate.single_terminal_consonant :harden
  conjugate.single_terminal_consonant :harken
  conjugate.single_terminal_consonant :hasten
  conjugate.single_terminal_consonant :hearten
  conjugate.single_terminal_consonant :hoarsen
  conjugate.single_terminal_consonant :honor
  conjugate.single_terminal_consonant :imprison
  conjugate.single_terminal_consonant :inhabit
  conjugate.single_terminal_consonant :inhibit
  conjugate.single_terminal_consonant :inspirit
  conjugate.single_terminal_consonant :interpret
  conjugate.single_terminal_consonant :iron
  conjugate.single_terminal_consonant :know
  conjugate.single_terminal_consonant :laten
  conjugate.single_terminal_consonant :launder
  conjugate.single_terminal_consonant :lengthen
  conjugate.single_terminal_consonant :liken
  conjugate.single_terminal_consonant :limber
  conjugate.single_terminal_consonant :limit
  conjugate.single_terminal_consonant :linger
  conjugate.single_terminal_consonant :litter
  conjugate.single_terminal_consonant :liven
  conjugate.single_terminal_consonant :loiter
  conjugate.single_terminal_consonant :lollop
  conjugate.single_terminal_consonant :louden
  conjugate.single_terminal_consonant :lower
  conjugate.single_terminal_consonant :lumber
  conjugate.single_terminal_consonant :madden
  conjugate.single_terminal_consonant :malinger
  conjugate.single_terminal_consonant :market
  conjugate.single_terminal_consonant :matter
  conjugate.single_terminal_consonant :misinterpret
  conjugate.single_terminal_consonant :misremember
  conjugate.single_terminal_consonant :monitor
  conjugate.single_terminal_consonant :moulder
  conjugate.single_terminal_consonant :murder
  conjugate.single_terminal_consonant :murmur
  conjugate.single_terminal_consonant :muster
  conjugate.single_terminal_consonant :number
  conjugate.single_terminal_consonant :offer
  conjugate.single_terminal_consonant :open
  conjugate.single_terminal_consonant :order
  conjugate.single_terminal_consonant :outmaneuver
  conjugate.single_terminal_consonant :overmaster
  conjugate.single_terminal_consonant :pamper
  conjugate.single_terminal_consonant :pilot
  conjugate.single_terminal_consonant :pivot
  conjugate.single_terminal_consonant :plaster
  conjugate.single_terminal_consonant :plunder
  conjugate.single_terminal_consonant :powder
  conjugate.single_terminal_consonant :power
  conjugate.single_terminal_consonant :prohibit
  conjugate.single_terminal_consonant :reckon
  conjugate.single_terminal_consonant :reconsider
  conjugate.single_terminal_consonant :recover
  conjugate.single_terminal_consonant :redden
  conjugate.single_terminal_consonant :redeliver
  conjugate.single_terminal_consonant :register
  conjugate.single_terminal_consonant :rejigger
  conjugate.single_terminal_consonant :remember
  conjugate.single_terminal_consonant :renumber
  conjugate.single_terminal_consonant :reopen
  conjugate.single_terminal_consonant :reposit
  conjugate.single_terminal_consonant :rewaken
  conjugate.single_terminal_consonant :richen
  conjugate.single_terminal_consonant :roister
  conjugate.single_terminal_consonant :roughen
  conjugate.single_terminal_consonant :sadden
  conjugate.single_terminal_consonant :savor
  conjugate.single_terminal_consonant :scatter
  conjugate.single_terminal_consonant :scupper
  conjugate.single_terminal_consonant :sharpen
  conjugate.single_terminal_consonant :shatter
  conjugate.single_terminal_consonant :shelter
  conjugate.single_terminal_consonant :shimmer
  conjugate.single_terminal_consonant :shiver
  conjugate.single_terminal_consonant :shorten
  conjugate.single_terminal_consonant :shower
  conjugate.single_terminal_consonant :sicken
  conjugate.single_terminal_consonant :smolder
  conjugate.single_terminal_consonant :smoothen
  conjugate.single_terminal_consonant :soften
  conjugate.single_terminal_consonant :solicit
  conjugate.single_terminal_consonant :squander
  conjugate.single_terminal_consonant :stagger
  conjugate.single_terminal_consonant :stiffen
  conjugate.single_terminal_consonant :stopper
  conjugate.single_terminal_consonant :stouten
  conjugate.single_terminal_consonant :straiten
  conjugate.single_terminal_consonant :strengthen
  conjugate.single_terminal_consonant :stutter
  conjugate.single_terminal_consonant :suffer
  conjugate.single_terminal_consonant :sugar
  conjugate.single_terminal_consonant :summon
  conjugate.single_terminal_consonant :surrender
  conjugate.single_terminal_consonant :swelter
  conjugate.single_terminal_consonant :sypher
  conjugate.single_terminal_consonant :tamper
  conjugate.single_terminal_consonant :tauten
  conjugate.single_terminal_consonant :tender
  conjugate.single_terminal_consonant :thicken
  conjugate.single_terminal_consonant :threaten
  conjugate.single_terminal_consonant :thunder
  conjugate.single_terminal_consonant :totter
  conjugate.single_terminal_consonant :toughen
  conjugate.single_terminal_consonant :tower
  conjugate.single_terminal_consonant :transit
  conjugate.single_terminal_consonant :trigger
  conjugate.single_terminal_consonant :tucker
  conjugate.single_terminal_consonant :unburden
  conjugate.single_terminal_consonant :uncover
  conjugate.single_terminal_consonant :unfetter
  conjugate.single_terminal_consonant :unloosen
  conjugate.single_terminal_consonant :upholster
  conjugate.single_terminal_consonant :utter
  conjugate.single_terminal_consonant :visit
  conjugate.single_terminal_consonant :vomit
  conjugate.single_terminal_consonant :wander
  conjugate.single_terminal_consonant :water
  conjugate.single_terminal_consonant :weaken
  conjugate.single_terminal_consonant :whiten
  conjugate.single_terminal_consonant :winter
  conjugate.single_terminal_consonant :wonder
  conjugate.single_terminal_consonant :worsen
end
