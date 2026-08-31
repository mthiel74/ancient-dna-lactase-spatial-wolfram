Get[FileNameJoin[{DirectoryName[DirectoryName[$InputFileName]], "src", "LactasePersistenceSpatial.wl"}]];

VerificationTest[
  LactasePersistenceSpatial`NormalizeGenotype[" ga "],
  "GA",
  TestID -> "normalize-genotype"
]

VerificationTest[
  LactasePersistenceSpatial`DerivedAlleleCopies["GA"],
  1,
  TestID -> "derived-copy-count"
]

VerificationTest[
  LactasePersistenceSpatial`DerivedAlleleCopies["GT"],
  1,
  TestID -> "derived-copy-count-t-strand-notation"
]

VerificationTest[
  LactasePersistenceSpatial`CalledAlleleCount["G"],
  1,
  TestID -> "single-read-called-allele-count"
]

VerificationTest[
  LactasePersistenceSpatial`AssignRegion["United Kingdom", 52.1, -1.5],
  "British Isles",
  TestID -> "british-region"
]

VerificationTest[
  LactasePersistenceSpatial`AssignRegion["Germany", 50.5, 8.1],
  "Rhine-Danube",
  TestID -> "rhine-danube-region"
]

VerificationTest[
  LactasePersistenceSpatial`AssignRegion["Spain", 40.4, -3.7],
  "Mediterranean",
  TestID -> "mediterranean-region"
]

VerificationTest[
  LactasePersistenceSpatial`AssignRegion["Latvia", 56.9, 24.1],
  "Baltic",
  TestID -> "baltic-region"
]

VerificationTest[
  Module[{row},
    row = <|
      "version_id" -> "I1",
      "master_id" -> "I1",
      "publication" -> "Fixture",
      "publication_year" -> 2026,
      "dr_group_id" -> "Fixture_Group",
      "locality" -> "Fixture",
      "country" -> "Germany",
      "lat" -> "51.0",
      "long" -> "8.0",
      "mean_date" -> "4200",
      "date_range" -> "2500-2200 BCE",
      "rs4988235_depth" -> 3,
      "rs4988235_most_likely_genotype" -> "GA"
    |>;
    Lookup[LactasePersistenceSpatial`CleanSampleRow[row], {"DerivedAlleles", "CalledAlleles", "Region"}]
  ],
  {1, 2, "Rhine-Danube"},
  TestID -> "clean-sample-row"
]

VerificationTest[
  Module[{row, sample},
    row = <|
      "version_id" -> "I2",
      "master_id" -> "I2",
      "publication" -> "Fixture",
      "publication_year" -> 2026,
      "dr_group_id" -> "Italy_Sicily_MN",
      "locality" -> "Sicily",
      "country" -> "Italy",
      "lat" -> 37724.,
      "long" -> 12916.,
      "mean_date" -> 6832,
      "date_range" -> "4987-4794 calBCE",
      "rs4988235_depth" -> 31,
      "rs4988235_most_likely_genotype" -> "GG"
    |>;
    sample = LactasePersistenceSpatial`CleanSampleRow[row];
    Round[Lookup[sample, {"Latitude", "Longitude"}], 0.001]
  ],
  {37.724, 12.916},
  TestID -> "scaled-coordinate-normalization"
]

VerificationTest[
  LactasePersistenceSpatial`LogisticProbability[-6, 1.2, 3000] > LactasePersistenceSpatial`LogisticProbability[-6, 1.2, 8000],
  True,
  TestID -> "logistic-increases-toward-present"
]

VerificationTest[
  Module[{grid = LactasePersistenceSpatial`BuildEuropeGrid[]},
    Length[grid] > 20 && AllTrue[grid, KeyExistsQ[#, "DairyingOnsetBP"] &]
  ],
  True,
  TestID -> "grid-builds"
]

VerificationTest[
  Module[{grid = LactasePersistenceSpatial`BuildEuropeGrid[], traj},
    traj = LactasePersistenceSpatial`SimulateSpatialTrajectory[
      <|"InitialFrequency" -> 0.003, "SelectionBase" -> 0.001,
        "SelectionDairying" -> 0.02, "Migration" -> 0.002|>,
      grid,
      "StartBP" -> 10000,
      "EndBP" -> 9500,
      "TimeStepYears" -> 250
    ];
    Length[traj["TimesBP"]] == 3 && Length[traj["Frequencies"][[1]]] == Length[grid]
  ],
  True,
  TestID -> "spatial-simulator-shape"
]

VerificationTest[
  Module[{predictor, value},
    predictor = LactasePersistenceSpatial`OrdinaryKrigingPredictor[
      {{0., 0.}, {1., 0.}, {0., 1.}},
      {0.05, 0.2, 0.35}
    ];
    value = predictor[{0.25, 0.25}];
    NumericQ[value] && 0 <= value <= 1
  ],
  True,
  TestID -> "ordinary-kriging-predictor-bounded"
]
