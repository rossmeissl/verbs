# Verbs

Conjugates most common english verbs for all persons, tenses, standard aspects, and modern moods (with active diathesis). Standard and exceptional spelling rules are obeyed.

```ruby
    Verbs::Conjugator.conjugate :be, :tense => :past, :person => :second, :plurality => :singular, :aspect => :perfective
    # => :were
    'be nice'.verb.conjugate :subject => 'Matz'
    # => "Matz is nice"
    :sleep.verb.conjugate :tense => :future, :person => :first, :plurality => :singular, :aspect => :progressive, :subject => true
    # => :"I will be sleeping"
```

## Installation

```bash
gem install verbs
```

## Options

This library takes a rather strict view of English verb conjugation.

### `:tense`

One of `:past`, `:present`, or `:future`. Defaults to `:present`.

### `:person`

One of `:first`, `:second`, or `:third`. Defaults to `:third`.

### `:plurality`

Either `:singular` or `:plural`. Defaults to `:singular`.

### `:aspect`

One of `:habitual`, `:perfect`, `:perfective`, `:progressive`, or
`:prospective`. Defaults to `:habitual` (`:perfective` for past tense).

See below for a guide to verb aspect.

### `:mood`

One of `:indicative`, `:imperative`, or `:subjunctive`. Defaults to
`:indicative`.

### `:subject`

Set this to a string to prepend the conjugated verb with it. When set to `true`, a standard personal pronoun will be used.

### `:diathesis`

One of `:active` or `:passive`. Defaults to `:active`.

## Tense/aspect quick reference

**EXAMPLE**|**TENSE**|**ASPECT**
:-----:|:-----:|:-----:
I used to accept|past|habitual
I had accepted|past|perfect
I accepted|past|perfective
I was accepting|past|progressive
I was about to accept|past|prospective
|
I accept|present|habitual
I have accepted|present|perfect
I am having accepted|present|perfective
I am accepting|present|progressive
I am about to accept|present|prospective
|
I will accept|future|habitual
I will have accepted|future|perfect

## Acknowledgements

- [Lingua::Conjugate](http://cpansearch.perl.org/src/RWG/Lingua-EN-Conjugate-0.308/lib/Lingua/EN/Conjugate.pm)
- [Pat Byrd and Tom McKlin](http://www2.gsu.edu/~wwwesl/egw/pluralsv.htm)
- [Rick Harrison](http://www.rickharrison.com/language/aspect.html)
- [Anatoli Makarevich](https://github.com/makaroni4) for [#6](https://github.com/rossmeissl/verbs/pull/6)
- [Nikita Kamaev](https://github.com/nerixim) for [#35](https://github.com/rossmeissl/verbs/pull/35)

## Copyright

Copyright (c) 2012 Andy Rossmeissl. See [LICENSE](https://github.com/rossmeissl/verbs/blob/master/LICENSE) for details.
