baseline
baseline: spec
  <baseline>
  spec for: #'common' do: [ spec
        package: 'SmalltalkCI-Core';
        package: 'SmalltalkCI-Tests'
          with: [ spec requires: 'SmalltalkCI-Core' ];
        package: 'SmalltalkCI-Package-Tests'
          with: [ spec requires: 'SmalltalkCI-Tests' ];
        package: 'SmalltalkCI-AllCases-Tests'
          with: [ spec requires: 'SmalltalkCI-Tests' ];
        package: 'SmalltalkCI-Excluded-Tests';
        yourself.
      spec
        group: 'default' with: #('Core');
        group: 'Core' with: #('SmalltalkCI-Core');
        group: 'tests'
          with: #('SmalltalkCI-Tests' 'SmalltalkCI-Excluded-Tests');
        yourself ].
  spec for: #'squeak' do: [ spec
        package: 'STON-Core';
        package: 'STON-Tests';
        package: 'SmalltalkCI-Core' with: [ spec
                requires: #('STON-Core');
                includes:
                    #('SmalltalkCI-Squeak-Core' 'SmalltalkCI-Monticello-Core') ];
        package: 'SmalltalkCI-Monticello-Core'
          with: [ spec requires: #('SmalltalkCI-Core') ];
        package: 'SmalltalkCI-Squeak-Core'
          with: [ spec requires: #('SmalltalkCI-Core') ];
        package: 'SmalltalkCI-Squeak-Tests'
          with: [ spec requires: #('SmalltalkCI-Squeak-Core') ];
        package: 'SmalltalkCI-Monticello-Tests'
          with: [ spec requires: #('SmalltalkCI-Squeak-Tests') ];
        yourself.
      spec
        group: 'tests'
        with:
          #('SmalltalkCI-Squeak-Tests' 'SmalltalkCI-Monticello-Tests' 'STON-Tests') ].
  spec for: #'pharo' do: [ spec configuration: 'Ston' with: [ spec
            version: #'stable';
            loads: #('Core');
            repository:
                'http://smalltalkhub.com/mc/SvenVanCaekenberghe/STON/main' ].
      spec
        package: 'SmalltalkCI-Core' with: [ spec
                requires: #('Ston');
                includes:
                    #('SmalltalkCI-Pharo-Core' 'Ston' 'SmalltalkCI-Monticello-Core') ];
        package: 'SmalltalkCI-Monticello-Core'
          with: [ spec requires: #('SmalltalkCI-Core') ];
        package: 'SmalltalkCI-Pharo-Core'
          with: [ spec requires: #('SmalltalkCI-Core') ];
        package: 'SmalltalkCI-Pharo-Tests'
          with: [ spec requires: #('SmalltalkCI-Pharo-Core') ];
        package: 'SmalltalkCI-Monticello-Tests'
          with: [ spec requires: #('SmalltalkCI-Pharo-Tests') ];
        yourself.
      spec
        group: 'tests'
        with: #('SmalltalkCI-Pharo-Tests' 'SmalltalkCI-Monticello-Tests') ].
  spec for: #'gemstoneCommon' do: [ spec
        package: 'SmalltalkCI-Core'
          with: [ spec includes: #('SmalltalkCI-GemStoneCommon-Core') ];
        package: 'SmalltalkCI-GemStoneCommon-Core'
          with: [ spec requires: #('SmalltalkCI-Core') ];
        yourself.
      spec
        group: 'Tests' with: #('tests');
        yourself ].
  spec for: #'gemstone64' do: [ spec
        baseline: 'Ston' with: [ spec
                loads: 'Core';
                repository:
                    'gitfiletree://github.com/GsDevKit/ston:gs_port/repository';
                yourself ];
        baseline: 'SmalltalkCompat' with: [ spec
                loads: 'Core';
                repository:
                    'gitfiletree://github.com/GsDevKit/SmalltalkCompat:master/repository';
                yourself ];
        yourself.
      spec
        package: 'SmalltalkCI-Core' with: [ spec
                requires: #('Ston' 'SmalltalkCompat');
                includes: #('SmalltalkCI-GemStone64-Core') ];
        package: 'SmalltalkCI-GemStone64-Core'
          with: [ spec requires: #('SmalltalkCI-Core' 'SmalltalkCI-GemStoneCommon-Core') ];
        package: 'SmalltalkCI-GemStone64-Tests'
          with: [ spec requires: 'SmalltalkCI-GemStone64-Core' ];
        yourself.
      spec group: 'tests' with: #('SmalltalkCI-GemStone64-Tests') ].
  spec for: #'gemstone' do: [ spec
        package: 'SmalltalkCI-Core'
          with: [ spec includes: #('SmalltalkCI-GemStone-Core' 'SmalltalkCI-Monticello-Core') ];
        package: 'SmalltalkCI-Monticello-Core'
          with: [ spec requires: #('SmalltalkCI-Core') ];
        package: 'SmalltalkCI-GemStone-Core' with: [ spec
                requires:
                  #('SmalltalkCI-Monticello-Core' 'SmalltalkCI-GemStoneCommon-Core') ];
        package: 'SmalltalkCI-GemStone-Tests'
          with: [ spec requires: 'SmalltalkCI-GemStone-Core' ];
        package: 'SmalltalkCI-Monticello-Tests'
          with: [ spec requires: #('SmalltalkCI-GemStone-Tests') ];
        yourself.
      spec
        group: 'tests'
        with: #('SmalltalkCI-GemStone-Tests' 'SmalltalkCI-Monticello-Tests') ]
