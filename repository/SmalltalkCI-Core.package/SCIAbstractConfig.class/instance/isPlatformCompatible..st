compatibility
isPlatformCompatible: aPlatformSymbol
  "If no platform is specified, we assume is valid for current execution platform"

  ^ self platforms isNil or: [ self platforms isEmpty or: [ self platforms includes: aPlatformSymbol ] ]
