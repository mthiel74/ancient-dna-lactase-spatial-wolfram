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

VerificationTest[
  Module[{v = LactasePersistenceSpatial`Private`PriorVectorSample[]},
    LactasePersistenceSpatial`Private`PriorInSupportQ[v]
  ],
  True,
  TestID -> "prior-sample-in-support"
]

VerificationTest[
  Module[{params},
    params = LactasePersistenceSpatial`Private`ParamsFromVector[
      LactasePersistenceSpatial`Private`PriorVectorSample[]];
    0 < params["InitialFrequency"] < 1 && KeyExistsQ[params, "Migration"] &&
      ! KeyExistsQ[params, "Log10InitialFrequency"]
  ],
  True,
  TestID -> "params-from-vector"
]

VerificationTest[
  Round[LactasePersistenceSpatial`WilsonInterval[5, 10], 0.001],
  {0.237, 0.763},
  TestID -> "wilson-interval"
]

VerificationTest[
  LactasePersistenceSpatial`Private`WeightedQuantile[{1., 2., 3., 4.}, {1., 1., 1., 1.}, 0.5],
  2.,
  TestID -> "weighted-quantile-median"
]

VerificationTest[
  Module[{obj, ses},
    obj[a_?NumericQ, b_?NumericQ] := -(a^2 + 2 b^2);
    ses = LactasePersistenceSpatial`Private`LogisticFitStandardErrors[obj, 0., 0.];
    Round[ses, 0.001]
  ],
  {0.707, 0.5},
  TestID -> "logistic-standard-errors"
]

VerificationTest[
  Module[{index, stats},
    index = {
      <|"CellIndex" -> 1, "TimeBP" -> 3000., "Called" -> 10, "Derived" -> 6,
        "Latitude" -> 55., "Longitude" -> 0.|>,
      <|"CellIndex" -> 2, "TimeBP" -> 3200., "Called" -> 10, "Derived" -> 1,
        "Latitude" -> 40., "Longitude" -> 20.|>
    };
    stats = LactasePersistenceSpatial`Private`ObservedGradientStatistics[index];
    {Round[stats["NorthSouth"], 0.01], stats["NorthSouthWeight"]}
  ],
  {0.5, 10},
  TestID -> "gradient-statistics"
]

VerificationTest[
  Module[{g0, gShift},
    g0 = LactasePersistenceSpatial`BuildEuropeGrid[4, 0];
    gShift = LactasePersistenceSpatial`BuildEuropeGrid[4, -400];
    g0[[1, "DairyingOnsetBP"]] - gShift[[1, "DairyingOnsetBP"]]
  ],
  400,
  TestID -> "grid-onset-shift"
]

VerificationTest[
  Module[{grid, samples, obsData, traj, d},
    grid = LactasePersistenceSpatial`BuildEuropeGrid[];
    samples = {
      <|"HasCall" -> True, "Latitude" -> 50., "Longitude" -> 8., "MeanDateBP" -> 4200.,
        "CalledAlleles" -> 2, "DerivedAlleles" -> 1, "Region" -> "Rhine-Danube"|>,
      <|"HasCall" -> True, "Latitude" -> 40., "Longitude" -> 15., "MeanDateBP" -> 6800.,
        "CalledAlleles" -> 2, "DerivedAlleles" -> 0, "Region" -> "Mediterranean"|>
    };
    obsData = LactasePersistenceSpatial`ExtendedObservedData[samples, grid];
    traj = LactasePersistenceSpatial`SimulateSpatialTrajectory[
      <|"InitialFrequency" -> 0.003, "SelectionBase" -> 0.002,
        "SelectionDairying" -> 0.02, "Migration" -> 0.003|>, grid];
    d = LactasePersistenceSpatial`ExtendedDistance[obsData, traj, grid];
    NumericQ[d] && d >= 0
  ],
  True,
  TestID -> "extended-distance-numeric"
]

VerificationTest[
  Module[{grid, samples, smc},
    grid = LactasePersistenceSpatial`BuildEuropeGrid[8];
    samples = Flatten@Table[
      <|"HasCall" -> True, "Latitude" -> lat, "Longitude" -> lon, "MeanDateBP" -> bp,
        "CalledAlleles" -> 4, "DerivedAlleles" -> If[bp < 4000, 1, 0],
        "Region" -> LactasePersistenceSpatial`AssignRegion["", lat, lon]|>,
      {lat, {42., 50., 56.}}, {lon, {0., 12.}}, {bp, {2600., 5400., 7400.}}
    ];
    smc = LactasePersistenceSpatial`RunSMCABC[samples, grid,
      "Particles" -> 12, "Generations" -> 2, "Seed" -> 7];
    Length[smc["Weights"]] == 12 && Abs[Total[smc["Weights"]] - 1.] < 10^-8 &&
      Length[smc["EpsilonHistory"]] >= 1 && smc["TotalSimulations"] >= 12
  ],
  True,
  TestID -> "smc-abc-smoke"
]

VerificationTest[
  Module[{smc},
    smc = <|"Weights" -> {0.5, 0.5}, "Particles" -> {<|"A" -> 1|>, <|"A" -> 2|>}|>;
    Length[LactasePersistenceSpatial`ResamplePosterior[smc, 5]]
  ],
  5,
  TestID -> "resample-posterior-count"
]
